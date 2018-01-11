package com.naver.kokfitness;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Member;
import com.naver.kokfitness.service.MemberDAO;

@Controller
public class MemberController {
	@Autowired
	Member member;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "memberTerms", method = RequestMethod.GET)
	public String memberTerms() {
		
		return "member/member_terms";
	}
	@RequestMapping(value = "memberInsertForm", method = RequestMethod.GET)
	public String memberInsertForm() {
		
		return "member/member_insert";
	}
	@RequestMapping(value = "emailConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int emailConfirm(@RequestParam String email) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		System.out.println("---------"+email);
		int result=0;
		try {
			result=dao.emailConfirm(email);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "idConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idConfirm(@RequestParam String id) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		System.out.println("---------"+id);
		int result=0;
		try {
			result=dao.idConfirm(id);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		try {
			String encodepassword=passwordEncoder.encode(member.getPassword());
			member.setPassword(encodepassword);
			dao.memberInsert(member);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("result_page");
		mav.addObject("member",member);
		return mav;
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("member") Member member,HttpSession session,HttpServletResponse response) throws IOException {
		MemberDAO dao=sqlSession.getMapper(MemberDAO.class);
		Member data=dao.memberGetOne(member.getEmail());
		if(data==null) {
			response.setCharacterEncoding("EUC-KR");
		    PrintWriter writer = response.getWriter();
		    writer.println("<script type='text/javascript'>");
		    writer.println("alert('이메일 주소와 일치하는 회원이 없습니다.');");
		    writer.println("history.back();");
		    writer.println("</script>");
		    writer.flush();
			return "";
		}else {
			if(BCrypt.checkpw(member.getPassword(), data.getPassword())) {
                session.setAttribute("sessionemail", data.getEmail());
                session.setAttribute("sessionid", data.getId());
    			session.setAttribute("sessionname", data.getName());
    			session.setAttribute("sessionpassword", data.getPassword());
    			session.setAttribute("sessionzipcode", data.getZipcode());
    			session.setAttribute("sessionnewaddr", data.getNewaddr());
    			session.setAttribute("sessiondetailaddr", data.getDetailaddr());
    			session.setAttribute("sessionphone1", data.getPhone1());
    			session.setAttribute("sessionphone2", data.getPhone2());
    			session.setAttribute("sessionphone3", data.getPhone3());
    			session.setAttribute("sessionprogram", data.getProgram_code());
    			session.setAttribute("sessionlevel", data.getMemlevel());
    			return "redirect:index";
	        }else {
	        	response.setCharacterEncoding("EUC-KR");
			    PrintWriter writer = response.getWriter();
			    writer.println("<script type='text/javascript'>");
			    writer.println("alert('비밀번호가 일치하지 않습니다.');");
			    writer.println("history.back();");
			    writer.println("</script>");
			    writer.flush();
				return "";
	        }
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
}
