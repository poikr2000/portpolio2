package com.naver.kokfitness;

import java.util.ArrayList;
import java.util.List;

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
	public String consumableInsert(@ModelAttribute("consumable") Consumable consumable) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		try {
			consumabledao.consumableInsert(consumable);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:consumableList";
	}
	@RequestMapping(value = "consumableList", method = RequestMethod.GET)
	public ModelAndView consumableList() {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		ArrayList<Consumable> consumables = consumabledao.consumableListAll();
		ModelAndView mav = new ModelAndView("consumable/consumable_list");
		mav.addObject("consumables", consumables);
		return mav;
	}
	@RequestMapping(value = "consumableSelectedDelete", method = RequestMethod.POST)
	public String consumableSelectedDelete(@RequestParam ("consumableunitchk") List<String> consumableunitchk) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		for(String unit : consumableunitchk) {
			consumabledao.consumableDelete(unit);
	    }
		return "redirect:consumableList";
	}
	@RequestMapping(value = "consumableDelete", method = RequestMethod.POST)
	public String consumableDelete(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		consumabledao.consumableDelete(code);
		return "redirect:consumableList";
	}
	@RequestMapping(value = "consumableUpdate", method = RequestMethod.POST)
	public String consumableUpdate(@ModelAttribute("consumable") Consumable consumable) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		try {
			consumabledao.consumableUpdate(consumable);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:consumableList";
	}
	@RequestMapping(value = "consumableDetail", method = RequestMethod.GET)
	public ModelAndView consumableDetail(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		ArrayList<Category> categorys=consumabledao.categoryListAll();
		ArrayList<Partner> partners=partnerdao.partnerListAll();
		Consumable consumable=consumabledao.consumableGetOne(code);
		ModelAndView mav = new ModelAndView("consumable/consumable_update");
		mav.addObject("consumable",consumable);
		mav.addObject("categorys",categorys);
		mav.addObject("partners",partners);
		return mav;
	}
}
