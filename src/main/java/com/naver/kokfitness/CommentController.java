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
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.CF_comment;
import com.naver.kokfitness.entities.F_board;
import com.naver.kokfitness.service.CF_commentDAO;

@Controller
public class CommentController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;
	@Autowired
	CF_comment cf_comment;
	
	@RequestMapping(value = "cf_insert", method = RequestMethod.POST)
	public ModelAndView cf_insert(@ModelAttribute ("cf_comment") CF_comment cf_comment) {
		ModelAndView mav = new ModelAndView("boardmain/f_board_update");
		CF_commentDAO dao = sqlSession.getMapper(CF_commentDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		cf_comment.setCf_date(today);
		dao.cf_insert(cf_comment);
		return mav;
	}
	
	@RequestMapping(value = "cf_comment", method = RequestMethod.POST)
	public ModelAndView cf_comment() {
		ModelAndView mav = new ModelAndView("boardmain/f_board_update");
		CF_commentDAO dao = sqlSession.getMapper(CF_commentDAO.class);
		ArrayList<CF_comment> cf_comments = dao.cf_selectListAll();
		mav.addObject("cf_comments",cf_comments);
		return mav;
	}
	
	@RequestMapping(value = "cf_selectListAll", method = RequestMethod.GET)
	public ModelAndView cf_selectListAll() {
		ModelAndView mav = new ModelAndView("boardmain/f_comment");
		CF_commentDAO dao=sqlSession.getMapper(CF_commentDAO.class);
		ArrayList<CF_comment> cf_comments = dao.cf_selectListAll();
		mav.addObject("cf_comments",cf_comments);
		return mav;
	}
}