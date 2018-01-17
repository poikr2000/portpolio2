package com.naver.kokfitness;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
public class CommentController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;
	@Autowired
	CF_comment cf_comment;

	@RequestMapping(value = "cf_insert", method = RequestMethod.POST)
	public ModelAndView cf_insert(@ModelAttribute("cf_comment") CF_comment cf_comment, @RequestParam int f_seq) {
		ModelAndView mav = new ModelAndView("boardmain/f_board_update");
		CF_commentDAO dao1 = sqlSession.getMapper(CF_commentDAO.class);
		F_boardDAO dao = sqlSession.getMapper(F_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);
		cf_comment.setCf_date(today);
		dao1.cf_insert(cf_comment);
		
		//상세
		f_board = dao.selectDetail(f_seq);
		mav.addObject("f_board" , f_board);
		
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		mav.addObject("f_boards", f_boards);
		ArrayList<CF_comment> cf_comments = dao1.cf_selectListAll();
		mav.addObject("cf_comments", cf_comments);
		return mav;
	}
}