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

import com.naver.kokfitness.entities.Consumable;
import com.naver.kokfitness.entities.Partner;
import com.naver.kokfitness.entities.Receiving;
import com.naver.kokfitness.service.ConsumableDAO;
import com.naver.kokfitness.service.PartnerDAO;
import com.naver.kokfitness.service.ReceivingDAO;

@Controller
public class ReceivingController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Receiving receiving;
	
	@RequestMapping(value = "receivingInsertForm", method = RequestMethod.GET)
	public ModelAndView receivingInsertForm() {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		ArrayList<Consumable> consumables = consumabledao.consumableListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		ModelAndView mav = new ModelAndView("receiving/receiving_insert");
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		receiving.setYyyy(yyyy);
		receiving.setMm(mm);
		receiving.setDd(dd);
		int no = receivingdao.selectSequenceNo(receiving);
		receiving.setNo(no);
		receiving.setHang(1);
		mav.addObject("receiving",receiving);
		mav.addObject("consumables",consumables);
		mav.addObject("partners",partners);
		return mav;
	}
	@RequestMapping(value = "consumableSelected", method = RequestMethod.POST)
	@ResponseBody
	public Receiving consumableSelected(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		Consumable consumable=consumabledao.selectGetOne(code);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		receiving.setYyyy(yyyy);
		receiving.setMm(mm);
		receiving.setDd(dd);
		receiving.setConsume_code(consumable.getCode());
		receiving.setBp_code(consumable.getBp_code());
		receiving.setBp_name(consumable.getBp_name());
		receiving.setPrice(consumable.getPrice());
		receiving.setStock(consumable.getStock());
		
		return receiving;
	}
	@RequestMapping(value = "receivingInsert", method = RequestMethod.POST)
	 public ModelAndView receivingInsert(@ModelAttribute("receiving")Receiving receiving) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		try {
			receivingdao.receivingInsert(receiving);
			receiving.setColumnname("rcv"+receiving.getMm());
			consumabledao.receivingAdd(receiving);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		ArrayList<Consumable> consumables = consumabledao.consumableListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		receiving.setHang(receiving.getHang()+1);
		ModelAndView mav = new ModelAndView("receiving/receiving_insert");
		mav.addObject("consumables",consumables);
		mav.addObject("partners",partners);
		mav.addObject("receiving",receiving);
		ArrayList<Receiving> receivings = receivingdao.receivingSelectListAll(receiving);
		mav.addObject("receivings",receivings);
		
		return mav;
	}
}
