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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.CF_comment;
import com.naver.kokfitness.entities.CQ_comment;
import com.naver.kokfitness.entities.F_board;
import com.naver.kokfitness.entities.Q_board;
import com.naver.kokfitness.service.CF_commentDAO;
import com.naver.kokfitness.service.CQ_commentDAO;
import com.naver.kokfitness.service.F_boardDAO;
import com.naver.kokfitness.service.MemberDAO;
import com.naver.kokfitness.service.Q_boardDAO;

@Controller
public class CommentController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;
	@Autowired
	Q_board q_board;
	@Autowired
	CF_comment cf_comment;
	@Autowired
	CQ_comment cq_comment;

	@RequestMapping(value = "cf_insert", method = RequestMethod.POST)
	public ModelAndView cf_insert(@ModelAttribute("cf_comment") CF_comment cf_comment, @RequestParam int f_seq,String email) {
		ModelAndView mav = new ModelAndView("boardmain/f_list_desc");
		CF_commentDAO dao1 = sqlSession.getMapper(CF_commentDAO.class);
		F_boardDAO dao = sqlSession.getMapper(F_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);
		cf_comment.setCf_date(today);
		cf_comment.setCf_parseq(f_seq);
		dao1.cf_insert(cf_comment);
		MemberDAO dao2 = sqlSession.getMapper(MemberDAO.class);
		dao2.membermileage_comment(email);
		//상세
		f_board = dao.selectDetail(f_seq);
		mav.addObject("f_board" , f_board);
		//댓글 내용
		ArrayList<CF_comment> cf_comments = dao1.cf_selectList(f_seq); 
		mav.addObject("cf_comments", cf_comments);
		return mav;
	}
	@RequestMapping(value = "cf_comment_delete", method = RequestMethod.POST)
	@ResponseBody
	public void cf_comment_delete(@RequestParam int cf_seq) {
		CF_commentDAO dao = sqlSession.getMapper(CF_commentDAO.class);
		dao.cf_comment_delete(cf_seq);
		
	}
	
	@RequestMapping(value = "cq_insert", method = RequestMethod.POST)
	public ModelAndView cq_insert(@ModelAttribute("cq_comment") CQ_comment cq_comment, @RequestParam int q_seq,String email) {
		ModelAndView mav = new ModelAndView("boardmain/q_list_desc");
		CQ_commentDAO dao1 = sqlSession.getMapper(CQ_commentDAO.class);
		Q_boardDAO dao = sqlSession.getMapper(Q_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);
		cq_comment.setCq_date(today);
		cq_comment.setCq_parseq(q_seq);
		dao1.cq_insert(cq_comment);
		MemberDAO dao2 = sqlSession.getMapper(MemberDAO.class);
		dao2.membermileage_comment(email);
		//상세
		q_board = dao.selectDetail(q_seq);
		mav.addObject("q_board" , q_board);
		//댓글 내용
		ArrayList<CQ_comment> cq_comments = dao1.cq_selectList(q_seq); 
		mav.addObject("cq_comments", cq_comments);
		return mav;
	}
	
	//페이지로 지울때
//	@RequestMapping(value = "cq_comment_delete", method = RequestMethod.GET)
//	public ModelAndView cq_comment_delete(@RequestParam int cq_seq, int q_seq) {
//		ModelAndView mav = new ModelAndView("boardmain/q_board_update");
//		CQ_commentDAO dao = sqlSession.getMapper(CQ_commentDAO.class);
//		dao.cq_comment_delete(cq_seq);
//		
//		Q_boardDAO dao1 = sqlSession.getMapper(Q_boardDAO.class);
//		ArrayList<Q_board> q_boards = dao1.q_boardselectListAll();
//		mav.addObject("q_boards",q_boards);
//		
//		//상세
//		Q_board q_board = dao1.selectDetail(q_seq);
//		mav.addObject("q_board", q_board);
//				
//		ArrayList<CQ_comment> cq_comments = dao.cq_selectList(q_seq);
//		mav.addObject("cq_comments", cq_comments);
//		return mav;
//	}
	
	@RequestMapping(value = "cq_comment_delete", method = RequestMethod.POST)
	@ResponseBody
	public void cq_comment_delete(@RequestParam int cq_seq) {
		CQ_commentDAO dao = sqlSession.getMapper(CQ_commentDAO.class);
		dao.cq_comment_delete(cq_seq);
	}
}