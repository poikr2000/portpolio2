package com.naver.kokfitness;

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
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.CF_comment;
import com.naver.kokfitness.entities.F_board;
import com.naver.kokfitness.service.CF_commentDAO;
import com.naver.kokfitness.service.F_boardDAO;

@Controller
public class BoardmainController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;
	
	@RequestMapping(value = "index1", method = RequestMethod.GET)
	public ModelAndView index1() {
		ModelAndView mav = new ModelAndView("index1");
		return mav;
	}

	@RequestMapping(value = "f_board", method = RequestMethod.GET)
	public ModelAndView f_board() {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards",f_boards);
		return mav;
	}

	@RequestMapping(value = "f_insert_form", method = RequestMethod.GET)
	public ModelAndView f_insert_form() {
		ModelAndView mav = new ModelAndView("boardmain/f_board_insert");
		return mav;
	}

	@RequestMapping(value = "f_insert", method = RequestMethod.POST)
	public ModelAndView f_insert(@ModelAttribute("f_board") F_board f_board,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		CF_commentDAO dao1 = sqlSession.getMapper(CF_commentDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		f_board.setF_date(today);
		String ip = request.getRemoteAddr();
		f_board.setF_ip(ip);
		int result =0;
		String message = "저장되었습니다.";
		result=dao.f_insert(f_board);
		mav.addObject("msg", message);
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards",f_boards);
		return mav;
	}

	@RequestMapping(value = "f_board_detail", method = RequestMethod.GET)
	public ModelAndView f_board_detail(HttpSession session,@RequestParam int f_seq) {
		ModelAndView mav = new ModelAndView("boardmain/f_board_update");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		CF_commentDAO dao1 = sqlSession.getMapper(CF_commentDAO.class);
		//상세
		dao.f_board_updateHit(f_seq);
		f_board = dao.selectDetail(f_seq);
		dao.f_modify(f_board);
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		ArrayList<CF_comment> cf_comments = dao1.cf_selectListAll();
		mav.addObject("f_boards",f_boards);
		mav.addObject("f_board", f_board);
		mav.addObject("cf_comments",cf_comments);
		
		return mav;
	}
	
	@RequestMapping(value = "f_board_modify", method = RequestMethod.POST)
	public ModelAndView f_board_modify() {
		ModelAndView mav = new ModelAndView("boardmain/f_board_modify");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards",f_boards);
		mav.addObject(f_board);
		dao.f_modify(f_board);
		return mav;
	}
	
	@RequestMapping(value = "f_modify", method = RequestMethod.POST)
	public ModelAndView f_modify(@ModelAttribute("f_board") F_board f_board,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("boardmain/f_board"); 
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards",f_boards);
		Date date=new Date();
		String today=df.format(date);
		f_board.setF_date(today);
		String ip = request.getRemoteAddr();
		f_board.setF_ip(ip);
		mav.addObject(f_board);
		dao.f_modify(f_board);
		return mav;
	}
}