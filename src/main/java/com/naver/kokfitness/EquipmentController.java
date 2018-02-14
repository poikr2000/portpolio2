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
import com.naver.kokfitness.entities.Equipment;
import com.naver.kokfitness.entities.Partner;
import com.naver.kokfitness.service.EquipmentDAO;
import com.naver.kokfitness.service.PartnerDAO;

@Controller
public class EquipmentController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "equipmentInsertForm", method = RequestMethod.GET)
	public ModelAndView equipmentInsertForm() {
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		ArrayList<Category> categorys=equipmentdao.categoryListAll();
		ArrayList<Partner> partners=partnerdao.partnerListAll();
		ModelAndView mav = new ModelAndView("equipment/equipment_insert");
		mav.addObject("categorys",categorys);
		mav.addObject("partners",partners);
		return mav;
	}
	
	@RequestMapping(value = "equipmentCodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int equipmentCodeConfirm(@RequestParam String code) {
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		int result=0;
		try {
			result=equipmentdao.codeConfirm(code);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "equipmentInsert", method = RequestMethod.POST)
	public String equipmentInsert(@ModelAttribute("equipment") Equipment equipment) {
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		try {
			equipmentdao.equipmentInsert(equipment);
		}catch(Exception e){
			System.out.println("error : "+e.getMessage());
		}
		return "redirect:index";
	}
}
