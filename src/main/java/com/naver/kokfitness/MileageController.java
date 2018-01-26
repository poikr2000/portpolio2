package com.naver.kokfitness;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Consumable;
import com.naver.kokfitness.service.ConsumableDAO;

@Controller
public class MileageController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "mileageListForm", method = RequestMethod.GET)
	public ModelAndView mileage() {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		ArrayList<Consumable> consumables = consumabledao.consumableListMileage();
		ModelAndView mav = new ModelAndView("mileage/mileage_list");
		mav.addObject("consumables", consumables);
		return mav;
	}
	@RequestMapping(value = "mileageDetail", method = RequestMethod.POST)
	@ResponseBody
	public Consumable mileageDetail(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		Consumable consumable= consumabledao.consumableGetOne(code);
		return consumable;
	}
}
