package com.naver.kokfitness;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.F_board;
import com.naver.kokfitness.service.F_boardDAO;

@Controller
public class BoardmainController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;

	@RequestMapping(value = "f_board", method = RequestMethod.GET)
	public ModelAndView f_board() {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		return mav;
	}

	@RequestMapping(value = "f_insert_form", method = RequestMethod.GET)
	public ModelAndView f_insert_form() {
		ModelAndView mav = new ModelAndView("boardmain/f_board_insert");
		return mav;
	}

	@RequestMapping(value = "f_insert", method = RequestMethod.POST)
	public ModelAndView f_insert(@ModelAttribute("f_board") F_board f_board,HttpServletRequest request,@RequestParam CommonsMultipartFile file) {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		if(!file.getOriginalFilename().equals("")) {
			String filetime=System.currentTimeMillis()+"";
			String path="D:/STSsourece/kokfitness/src/main/webapp/resources/uploadattachs";
			String realpath="resources/uploadattachs/";
			String originalname =file.getOriginalFilename();
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output=new BufferedOutputStream(new FileOutputStream(path+filetime+originalname));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				
			}
			f_board.setF_attach(realpath+filetime+originalname);
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy년  MM월 dd일 hh시 mm:ss");
		Date date=new Date();
		String today=df.format(date);
		f_board.setF_date(today);
		String ip = request.getRemoteAddr();
		f_board.setF_ip(ip);
		int result =0;
		String message = "저장되었습니다.";
		result=dao.f_insert(f_board);
		mav.addObject("msg", message);
		return mav;
	}
	
	@RequestMapping(value = "f_boardPageList", method = RequestMethod.GET)
	public ModelAndView f_boardPageList(HttpSession session) {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards",f_boards);
		return mav;
	}
	

	@RequestMapping(value = "f_board_update", method = RequestMethod.GET)
	public ModelAndView f_board_update(HttpSession session) {
		ModelAndView mav = new ModelAndView("boardmain/f_board_update");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		mav.addObject(f_board);
		return mav;
	}
}
