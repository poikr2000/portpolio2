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
import com.naver.kokfitness.entities.CQ_comment;
import com.naver.kokfitness.entities.F_board;
import com.naver.kokfitness.entities.N_board;
import com.naver.kokfitness.entities.Q_board;
import com.naver.kokfitness.service.CF_commentDAO;
import com.naver.kokfitness.service.CQ_commentDAO;
import com.naver.kokfitness.service.F_boardDAO;
import com.naver.kokfitness.service.N_boardDAO;
import com.naver.kokfitness.service.Q_boardDAO;

@Controller
public class BoardmainController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	F_board f_board;
	@Autowired
	Q_board q_board;
	@Autowired
	N_board n_board;
	@Autowired
	CF_comment cf_comment;
	@Autowired
	CQ_comment cq_comment;
	
	@RequestMapping(value = "f_board", method = RequestMethod.GET)
	public ModelAndView f_board() {
		ModelAndView mav = new ModelAndView("boardmain/f_board");
		F_boardDAO dao=sqlSession.getMapper(F_boardDAO.class);
		//댓글 갯수 가져오기
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		int result=0;
	      for(F_board data:f_boards) { //향상된 for문
	         result=dao.cf_comcount(data.getF_seq());
	         data.setF_cnt(result);
	      }
		mav.addObject("f_boards",f_boards);
		N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		//현재날짜와 비교하기
		java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		mav.addObject("today",today);
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
		java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		f_board.setF_date(today);
		String ip = request.getRemoteAddr();
		f_board.setF_ip(ip);
		dao.f_insert(f_board);
		//댓글 갯수 가져오기
		ArrayList<F_board> f_boards = dao.f_boardselectListAll();
		int result=0;
	      for(F_board data:f_boards) { //향상된 for문
	         result=dao.cf_comcount(data.getF_seq());
	         data.setF_cnt(result);
	      }
	    mav.addObject("f_boards",f_boards);
		N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		//날짜 비교하기
		mav.addObject("today",today);
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
		mav.addObject("f_board", f_board);
		
		//댓글
		ArrayList<CF_comment> cf_comments = dao1.cf_selectList(f_seq);
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
	
	@RequestMapping(value = "f_board_delete", method = RequestMethod.GET)
	   public ModelAndView f_board_delete(@RequestParam int f_seq) {
	      ModelAndView mav = new ModelAndView("boardmain/f_board");
	      //댓글 삭제
	      CF_commentDAO dao2 = sqlSession.getMapper(CF_commentDAO.class);
	      dao2.cf_comment_delete_All(f_seq);
	      //게시글 삭제
	      F_boardDAO dao = sqlSession.getMapper(F_boardDAO.class);
	      dao.f_board_delete(f_seq);
	      //댓글 갯수
	      ArrayList<F_board> f_boards = dao.f_boardselectListAll();
	      int result=0;
	         for(F_board data:f_boards) { //향상된 for문
	            result=dao.cf_comcount(data.getF_seq());
	            data.setF_cnt(result);
	         }
	      mav.addObject("f_boards",f_boards);
	      N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
	      ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
	      mav.addObject("n_boards",n_boards);
	      java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	      Date date=new Date();
	      String today=df.format(date);
	      mav.addObject("today",today);
	      return mav;
	   }
	
	//-질문 게시판-
	@RequestMapping(value = "q_board", method = RequestMethod.GET)
	public ModelAndView q_board() {
		ModelAndView mav = new ModelAndView("boardmain/q_board");
		Q_boardDAO dao=sqlSession.getMapper(Q_boardDAO.class);
		ArrayList<Q_board> q_boards = dao.q_boardselectListAll();
		int result=0;
	      for(Q_board data:q_boards) { //향상된 for문
	         result=dao.cq_comcount(data.getQ_seq());
	         data.setQ_cnt(result);
	      }
		mav.addObject("q_boards",q_boards);
		N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		mav.addObject("today",today);
		return mav;
	}
	
	@RequestMapping(value = "q_insert_form", method = RequestMethod.GET)
	public ModelAndView q_insert_form() {
		ModelAndView mav = new ModelAndView("boardmain/q_board_insert");
		return mav;
	}

	@RequestMapping(value = "q_insert", method = RequestMethod.POST)
	public ModelAndView q_insert(@ModelAttribute("q_board") Q_board q_board,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("boardmain/q_board");
		Q_boardDAO dao=sqlSession.getMapper(Q_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		q_board.setQ_date(today);
		dao.q_insert(q_board);
		ArrayList<Q_board> q_boards = dao.q_boardselectListAll();
		int result=0;
		for(Q_board data:q_boards) { //향상된 for문
			result=dao.cq_comcount(data.getQ_seq());
			data.setQ_cnt(result);
		}
		mav.addObject("q_boards",q_boards);
		N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		mav.addObject("today",today);
		return mav;
	}

	@RequestMapping(value = "q_board_detail", method = RequestMethod.GET)
	public ModelAndView q_board_detail(HttpSession session,@RequestParam int q_seq) {
		ModelAndView mav = new ModelAndView("boardmain/q_board_update");
		Q_boardDAO dao=sqlSession.getMapper(Q_boardDAO.class);
		CQ_commentDAO dao1 = sqlSession.getMapper(CQ_commentDAO.class);
		//상세
		dao.q_board_updateHit(q_seq);
		q_board = dao.selectDetail(q_seq);
		mav.addObject("q_board", q_board);
		//댓글
		ArrayList<CQ_comment> cq_comments = dao1.cq_selectList(q_seq);
		mav.addObject("cq_comments",cq_comments);
		
		return mav;
	}
	
	@RequestMapping(value = "q_board_modify", method = RequestMethod.POST)
	public ModelAndView q_board_modify() {
		ModelAndView mav = new ModelAndView("boardmain/q_board_modify");
		Q_boardDAO dao=sqlSession.getMapper(Q_boardDAO.class);
		ArrayList<Q_board> q_boards = dao.q_boardselectListAll();
		mav.addObject("q_boards",q_boards);
		mav.addObject(q_board);
		dao.q_modify(q_board);
		return mav;
	}
	
	@RequestMapping(value = "q_modify", method = RequestMethod.POST)
	public ModelAndView q_modify(@ModelAttribute("q_board") Q_board q_board,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("boardmain/q_board"); 
		Q_boardDAO dao=sqlSession.getMapper(Q_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<Q_board> q_boards = dao.q_boardselectListAll();
		mav.addObject("q_boards",q_boards);
		Date date=new Date();
		String today=df.format(date);
		q_board.setQ_date(today);
		mav.addObject(q_board);
		dao.q_modify(q_board);
		return mav;
	}
	@RequestMapping(value = "q_board_delete", method = RequestMethod.GET)
	public ModelAndView q_board_delete(@RequestParam int q_seq) {
		ModelAndView mav = new ModelAndView("boardmain/q_board");
		//댓글 지우기
		CQ_commentDAO dao2 = sqlSession.getMapper(CQ_commentDAO.class);
		dao2.cq_comment_delete_All(q_seq);
		//게시판 지우기
		Q_boardDAO dao = sqlSession.getMapper(Q_boardDAO.class);
		dao.q_board_delete(q_seq);
		ArrayList<Q_board> q_boards = dao.q_boardselectListAll();
		int result=0;
		for(Q_board data:q_boards) { //향상된 for문
			result=dao.cq_comcount(data.getQ_seq());
			data.setQ_cnt(result);
		}
		mav.addObject("q_boards",q_boards);
		N_boardDAO dao1=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao1.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    Date date=new Date();
	    String today=df.format(date);
	    mav.addObject("today",today);
		return mav;
	}
	
//-공지 게시판-
	@RequestMapping(value = "n_board", method = RequestMethod.GET)
	public ModelAndView n_board() {
		ModelAndView mav = new ModelAndView("boardmain/n_board");
		N_boardDAO dao=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		return mav;
	}
	@RequestMapping(value = "n_insert_form", method = RequestMethod.GET)
	public ModelAndView n_insert_form() {
		ModelAndView mav = new ModelAndView("boardmain/n_board_insert");
		return mav;
	}

	@RequestMapping(value = "n_insert", method = RequestMethod.POST)
	public ModelAndView n_insert(@ModelAttribute("n_board") N_board n_board,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("boardmain/n_board");
		N_boardDAO dao=sqlSession.getMapper(N_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=df.format(date);
		n_board.setN_date(today);
		dao.n_insert(n_board);
		ArrayList<N_board> n_boards = dao.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		return mav;
	}

	@RequestMapping(value = "n_board_detail", method = RequestMethod.GET)
	public ModelAndView n_board_detail(HttpSession session,@RequestParam int n_seq) {
		ModelAndView mav = new ModelAndView("boardmain/n_board_update");
		N_boardDAO dao=sqlSession.getMapper(N_boardDAO.class);
		//상세
		dao.n_board_updateHit(n_seq);
		n_board = dao.selectDetail(n_seq);
		mav.addObject("n_board", n_board);
		return mav;
	}
	
	@RequestMapping(value = "n_board_modify", method = RequestMethod.POST)
	public ModelAndView n_board_modify() {
		ModelAndView mav = new ModelAndView("boardmain/n_board_modify");
		N_boardDAO dao=sqlSession.getMapper(N_boardDAO.class);
		ArrayList<N_board> n_boards = dao.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		mav.addObject(n_board);
		dao.n_modify(n_board);
		return mav;
	}
	
	@RequestMapping(value = "n_modify", method = RequestMethod.POST)
	public ModelAndView n_modify(@ModelAttribute("n_board") N_board n_board,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("boardmain/n_board"); 
		N_boardDAO dao=sqlSession.getMapper(N_boardDAO.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<N_board> n_boards = dao.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		Date date=new Date();
		String today=df.format(date);
		n_board.setN_date(today);
		mav.addObject(n_board);
		dao.n_modify(n_board);
		return mav;
	}
	
	@RequestMapping(value = "n_board_delete", method = RequestMethod.GET)
	public ModelAndView n_board_delete(@RequestParam int n_seq) {
		ModelAndView mav = new ModelAndView("boardmain/n_board");
		N_boardDAO dao = sqlSession.getMapper(N_boardDAO.class);
		try {
			dao.n_board_delete(n_seq);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		ArrayList<N_board> n_boards = dao.n_boardselectListAll();
		mav.addObject("n_boards",n_boards);
		return mav;
	}
}