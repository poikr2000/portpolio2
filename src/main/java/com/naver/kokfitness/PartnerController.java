package com.naver.kokfitness;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Partner;
import com.naver.kokfitness.service.ConsumableDAO;
import com.naver.kokfitness.service.PartnerDAO;

@Controller
public class PartnerController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "partnerInsertForm", method = RequestMethod.GET)
	public String partnerInsertForm() {
		
		return "partner/partner_insert";
	}
	@RequestMapping(value = "codeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int codeConfirm(@RequestParam String code) {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		int result=0;
		try {
			result=dao.codeConfirm(code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "partnerInsert", method = RequestMethod.POST)
	public String partnerInsert(@ModelAttribute("partner") Partner partner) {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		try {
			dao.partnerInsert(partner);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:partnerList";
	}
	@RequestMapping(value = "partnerList", method = RequestMethod.GET)
	public ModelAndView partnerList() {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		ModelAndView mav = new ModelAndView("partner/partner_list");
		ArrayList<Partner> partners = dao.partnerListAll();
		mav.addObject("partners",partners);
		
		return mav;
	}
	@RequestMapping(value = "partnerDetail", method = RequestMethod.GET)
	public ModelAndView partnerDetail(@RequestParam String code) {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		Partner partner=dao.partnerGetOne(code);
		ModelAndView mav = new ModelAndView("partner/partner_update");
		mav.addObject("partner",partner);
		return mav;
	}
	@RequestMapping(value = "partnerUpdate", method = RequestMethod.POST)
	public String partnerUpdate(@ModelAttribute("partner") Partner partner) {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		try {
			dao.partnerUpdate(partner);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:partnerList";
	}
	@RequestMapping(value = "partnerDelete", method = RequestMethod.POST)
	public String partnerDelete(@RequestParam String code) {
		PartnerDAO dao=sqlSession.getMapper(PartnerDAO.class);
		dao.partnerDelete(code);
		return "redirect:partnerList";
	}
	@RequestMapping(value = "GoodsConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int GoodsConfirm(@RequestParam String bp_code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		int result=0;
		try {
			result=consumabledao.GoodsConfirm(bp_code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
}
