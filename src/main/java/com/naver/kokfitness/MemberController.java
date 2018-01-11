package com.naver.kokfitness;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
			if(passwordEncoder.matches(member.getPassword(),encodepassword)) {
                System.out.println("같음");
	        }else {
	            System.out.println("다름");
	        }
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("result_page");
		mav.addObject("member",member);
		return mav;
	}
}
