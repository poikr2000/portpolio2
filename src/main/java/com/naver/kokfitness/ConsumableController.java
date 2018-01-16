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

import com.naver.kokfitness.entities.Category;
import com.naver.kokfitness.entities.Consumable;
import com.naver.kokfitness.entities.Partner;
import com.naver.kokfitness.service.ConsumableDAO;
import com.naver.kokfitness.service.PartnerDAO;

@Controller
public class ConsumableController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "consumableInsertForm", method = RequestMethod.GET)
	public ModelAndView consumableInsertForm() {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		ArrayList<Category> categorys=consumabledao.categoryListAll();
		ArrayList<Partner> partners=partnerdao.partnerListAll();
		ModelAndView mav = new ModelAndView("consumable/consumable_insert");
		mav.addObject("categorys",categorys);
		mav.addObject("partners",partners);
		return mav;
	}
	@RequestMapping(value = "consumableCodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int consumableCodeConfirm(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		int result=0;
		try {
			result=consumabledao.codeConfirm(code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	@RequestMapping(value = "consumableInsert", method = RequestMethod.POST)
	public ModelAndView consumableInsert(@ModelAttribute("consumable") Consumable consumable) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		System.out.println("-------------"+consumable.getBp_code());
		System.out.println("-------------"+consumable.getCategory_code());
		try {
			consumabledao.consumableInsert(consumable);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
}
