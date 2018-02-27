package com.naver.kokfitness;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Member;
import com.naver.kokfitness.entities.Program;
import com.naver.kokfitness.entities.Service;
import com.naver.kokfitness.service.MemberDAO;
import com.naver.kokfitness.service.ServiceDAO;

@Controller
public class ServiceController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Member member;
	@Autowired
	Service service;
	
	@RequestMapping(value = "serviceListForm", method = RequestMethod.GET)
	public ModelAndView serviceListForm() {
		ModelAndView mav = new ModelAndView("service/service_list");
		return mav;
	}
	@RequestMapping(value = "serviceSelected", method = RequestMethod.POST)
	@ResponseBody
	public Program serviceSelected(@RequestParam String radio) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		Program program=servicedao.serviceSelected(radio);
		return program;
	}
	@RequestMapping(value = "serviceInsert", method = RequestMethod.POST)
	@ResponseBody
	public String serviceInsert(@RequestParam String radio,HttpSession session) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		String email = session.getAttribute("sessionemail").toString();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy.MM.dd");
		String date = sm.format(new Date());
		service.setMember_mail(email);
		service.setProgram_code(radio);
		service.setApply_date(date);
		servicedao.serviceInsert(service);
		return email;
	}
	@RequestMapping(value = "serviceChk", method = RequestMethod.POST)
	@ResponseBody
	public int serviceChk(HttpSession session) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		String email = session.getAttribute("sessionemail").toString();
		int result=servicedao.serviceCheck(email);
		return result;
	}
	@RequestMapping(value = "serviceMember", method = RequestMethod.GET)
	public ModelAndView serviceMember(HttpSession session) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		String email = session.getAttribute("sessionemail").toString();
		if(email.equals("admin@admin.com")) {
			ModelAndView mav = new ModelAndView("service/service_admin");
			ArrayList<Service>services=servicedao.serviceListAll();
			mav.addObject("services",services);
			return mav;
		}else {
			ModelAndView mav = new ModelAndView("service/service_member");
			ArrayList<Service>services=servicedao.serviceListGetOne(email);
			mav.addObject("services",services);
			return mav;
		}
	}
	@RequestMapping(value = "serviceCansel", method = RequestMethod.POST)
	public String serviceCansel(@RequestParam String seq) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		servicedao.serviceDelete(seq);
		return "redirect:serviceMember";
	}
	@RequestMapping(value = "serviceExpired", method = RequestMethod.POST)
	public String serviceExpired(@RequestParam String seq) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		Service service=servicedao.serviceGetOne(seq);
		member.setEmail(service.getMember_mail());
		memberdao.memberServiceExpired(member);
		servicedao.serviceExpired(seq);
		return "redirect:serviceMember";
	}
	@RequestMapping(value = "serviceRegister", method = RequestMethod.POST)
	public String serviceRegister(@RequestParam String seq) {
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy.MM.dd");
		String date = sm.format(new Date());
		service.setRegister_date(date);
		service.setSeq(Integer.parseInt(seq));
		servicedao.serviceRegister(service);
		Service service=servicedao.serviceGetOne(seq);
		
		if(service.getProgram_code().equals("1111")) {
			member.setMileage(2000);
		}else if(service.getProgram_code().equals("1112")) {
			member.setMileage(5000);
		}else if(service.getProgram_code().equals("1113")) {
			member.setMileage(9000);
		}else if(service.getProgram_code().equals("2111")) {
			member.setMileage(40000);
		}else if(service.getProgram_code().equals("2112")) {
			member.setMileage(70000);
		}else if(service.getProgram_code().equals("2113")) {
			member.setMileage(90000);
		}else if(service.getProgram_code().equals("3111")) {
			member.setMileage(5000);
		}else if(service.getProgram_code().equals("3112")) {
			member.setMileage(13000);
		}else if(service.getProgram_code().equals("3113")) {
			member.setMileage(25000);
		}else if(service.getProgram_code().equals("4111")) {
			member.setMileage(6000);
		}else if(service.getProgram_code().equals("4112")) {
			member.setMileage(16000);
		}else if(service.getProgram_code().equals("4113")) {
			member.setMileage(28000);
		}
		member.setEmail(service.getMember_mail());
		member.setProgram_code(service.getProgram_code());
		memberdao.memberServiceRegister(member);
		return "redirect:serviceMember";
	}
	@RequestMapping(value = "serviceAdminForm", method = RequestMethod.GET)
	public ModelAndView serviceAdminForm() {
		ModelAndView mav = new ModelAndView("service/service_admin");
		ServiceDAO servicedao=sqlSession.getMapper(ServiceDAO.class);
		ArrayList<Service>services=servicedao.serviceListAll();
		mav.addObject("services",services);
		return mav;
	}
}
