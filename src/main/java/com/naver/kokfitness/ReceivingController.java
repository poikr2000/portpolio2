package com.naver.kokfitness;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import com.naver.kokfitness.entities.Equipment;
import com.naver.kokfitness.entities.Partner;
import com.naver.kokfitness.entities.Receiving;
import com.naver.kokfitness.entities.ReceivingSearch;
import com.naver.kokfitness.service.ConsumableDAO;
import com.naver.kokfitness.service.EquipmentDAO;
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
	
	@RequestMapping(value = "equipmentListForm", method = RequestMethod.GET)
	public ModelAndView equipmentListForm() {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		ArrayList<Equipment> equipments = equipmentdao.equipmentListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		ModelAndView mav = new ModelAndView("receiving/equipment_insert");
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
		mav.addObject("equipments",equipments);
		mav.addObject("partners",partners);
		return mav;
	}
	
	@RequestMapping(value = "receivingStatement", method = RequestMethod.GET)
	public ModelAndView receivingStatement() {
		ModelAndView mav = new ModelAndView("receiving/receiving_statement");
		return mav;
	}
	
	@RequestMapping(value = "equipmentStatement", method = RequestMethod.GET)
	public ModelAndView equipmentStatement() {
		ModelAndView mav = new ModelAndView("receiving/equipment_statement");
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
	
	@RequestMapping(value = "equipmentSelected", method = RequestMethod.POST)
	@ResponseBody
	public Receiving equipmentSelected(@RequestParam String code) {
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		Equipment equipment=equipmentdao.selectGetOne(code);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		receiving.setYyyy(yyyy);
		receiving.setMm(mm);
		receiving.setDd(dd);
		receiving.setEquipment_code(equipment.getCode());
		receiving.setBp_code(equipment.getBp_code());
		receiving.setBp_name(equipment.getBp_name());
		receiving.setPrice(equipment.getPrice());
		receiving.setStock(equipment.getStock());
		
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
			receiving.setDealname("deal"+receiving.getMm());
			receiving.setBalancename("balance"+receiving.getMm());
			receivingdao.receivingBalanceAdd(receiving);
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
	
	@RequestMapping(value = "rcvEquipmentInsert", method = RequestMethod.POST)
	 public ModelAndView rcvEquipmentInsert(@ModelAttribute("receiving")Receiving receiving) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		try {
			receivingdao.receivingInsert(receiving);
			receiving.setColumnname("rcv"+receiving.getMm());
			equipmentdao.receivingAdd(receiving);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		ArrayList<Equipment> equipments = equipmentdao.equipmentListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		receiving.setHang(receiving.getHang()+1);
		ModelAndView mav = new ModelAndView("receiving/equipment_insert");
		mav.addObject("equipments",equipments);
		mav.addObject("partners",partners);
		mav.addObject("receiving",receiving);
		ArrayList<Receiving> receivings = receivingdao.rcvRquipmentSelectListAll(receiving);
		mav.addObject("receivings",receivings);
		
		return mav;
	}
	
	@RequestMapping(value = "receivingSearch", method = RequestMethod.POST)
	 public ModelAndView receivingSearch(@ModelAttribute("receivingsearch")ReceivingSearch receivingsearch) {
		ModelAndView mav = new ModelAndView("receiving/receiving_insert");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		int resultmm=Integer.parseInt(receivingsearch.getSearchmm());
		if(resultmm<10) {
			String mm = String.format("%02d", resultmm);
			receivingsearch.setSearchmm(mm);
		}
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
		try {
			ArrayList<Receiving> receivings =  receivingdao.SelectReceivingSearchRollup(receivingsearch);
			ArrayList<Consumable> consumables = consumabledao.consumableListAll();
			ArrayList<Partner> partners = partnerdao.partnerListAll();
			mav.addObject("receivings",receivings);
			mav.addObject("consumables",consumables);
			mav.addObject("partners",partners);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value = "rcvEquipmentSearch", method = RequestMethod.POST)
	 public ModelAndView rcvEquipmentSearch(@ModelAttribute("receivingsearch")ReceivingSearch receivingsearch) {
		ModelAndView mav = new ModelAndView("receiving/equipment_insert");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		int resultmm=Integer.parseInt(receivingsearch.getSearchmm());
		if(resultmm<10) {
			String mm = String.format("%02d", resultmm);
			receivingsearch.setSearchmm(mm);
		}
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
		try {
			ArrayList<Receiving> receivings =  receivingdao.SelectEquipmentSearchRollup(receivingsearch);
			ArrayList<Equipment> equipments = equipmentdao.equipmentListAll();
			ArrayList<Partner> partners = partnerdao.partnerListAll();
			mav.addObject("receivings",receivings);
			mav.addObject("equipments",equipments);
			mav.addObject("partners",partners);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value = "receivingSearchNotingPartner", method = RequestMethod.POST)
	 public ModelAndView receivingSearchNotingPartner(@ModelAttribute("receivingsearch")ReceivingSearch receivingsearch) {
		ModelAndView mav = new ModelAndView("receiving/receiving_insert");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		int resultmm=Integer.parseInt(receivingsearch.getSearchmm());
		if(resultmm<10) {
			String mm = String.format("%02d", resultmm);
			receivingsearch.setSearchmm(mm);
		}
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
		try {
			ArrayList<Receiving> receivings =  receivingdao.SelectReceivingSearchRollupNotingPartner(receivingsearch);
			ArrayList<Consumable> consumables = consumabledao.consumableListAll();
			ArrayList<Partner> partners = partnerdao.partnerListAll();
			mav.addObject("receivings",receivings);
			mav.addObject("consumables",consumables);
			mav.addObject("partners",partners);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value = "receivingListDelete", method = RequestMethod.GET)
	 public String receivingListDelete(@RequestParam String seq) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		Receiving receiving = receivingdao.receivingSelectOne(seq);
		receiving.setColumnname("rcv"+receiving.getMm());
		receiving.setDealname("deal"+receiving.getMm());
		receiving.setBalancename("balance"+receiving.getMm());
		receivingdao.receivingDeleteBalance(receiving);
		consumabledao.receivingDeleteSub(receiving);
		receivingdao.deleteRow(seq);
		return "redirect:receivingInsertForm";
	}
	@RequestMapping(value = "equipmentListDelete", method = RequestMethod.GET)
	 public String equipmentListDelete(@RequestParam String seq) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		Receiving receiving = receivingdao.equipmentSelectOne(seq);
		receiving.setColumnname("rcv"+receiving.getMm());
		equipmentdao.receivingDeleteSub(receiving);
		receivingdao.deleteRow(seq);
		return "redirect:equipmentListForm";
	}
	@RequestMapping(value = "receivingDetail", method = RequestMethod.POST)
	@ResponseBody
	 public Receiving receivingDetail(@RequestParam String seq) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		Receiving receiving = receivingdao.receivingSelectOne(seq);
		return receiving;
	}
	
	@RequestMapping(value = "equipmentDetail", method = RequestMethod.POST)
	@ResponseBody
	 public Receiving equipmentDetail(@RequestParam String seq) {
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		Receiving receiving = receivingdao.equipmentSelectOne(seq);
		return receiving;
	}
	
	@RequestMapping(value = "receivingUpdate", method = RequestMethod.POST)
	 public ModelAndView buyUpdate(@ModelAttribute("receiving")Receiving receiving) {
		ModelAndView mav = new ModelAndView("receiving/receiving_insert");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		receiving.setColumnname("rcv"+receiving.getMm());
		receiving.setDealname("deal"+receiving.getMm());
		receiving.setBalancename("balance"+receiving.getMm());
		receivingdao.receivingUpdateBalance(receiving);
		receivingdao.receivingBalanceAdd(receiving);
		receivingdao.updateRow(receiving);
		consumabledao.receivingUpdateSub(receiving);
		consumabledao.receivingAdd(receiving);
		
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
		
		ArrayList<Consumable> consumables = consumabledao.consumableListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		ArrayList<Receiving> receivings = receivingdao.receivingSelectListAll(receiving);
		mav.addObject("receivings",receivings);
		mav.addObject("consumables",consumables);
		mav.addObject("partners",partners);
		return mav;
	}
	
	@RequestMapping(value = "equipmentUpdate", method = RequestMethod.POST)
	 public ModelAndView equipmentUpdate(@ModelAttribute("receiving")Receiving receiving) {
		ModelAndView mav = new ModelAndView("receiving/equipment_insert");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		EquipmentDAO equipmentdao=sqlSession.getMapper(EquipmentDAO.class);
		PartnerDAO partnerdao=sqlSession.getMapper(PartnerDAO.class);
		receiving.setColumnname("rcv"+receiving.getMm());
		receivingdao.equipmetUpdate(receiving);
		equipmentdao.receivingUpdateSub(receiving);
		equipmentdao.receivingAdd(receiving);
		
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
		
		ArrayList<Equipment> equipments = equipmentdao.equipmentListAll();
		ArrayList<Partner> partners = partnerdao.partnerListAll();
		ArrayList<Receiving> receivings = receivingdao.receivingSelectListAll(receiving);
		mav.addObject("receivings",receivings);
		mav.addObject("equipments",equipments);
		mav.addObject("partners",partners);
		return mav;
	}
	
	@RequestMapping(value = "receivingStatementMm", method = RequestMethod.POST)
	 public ModelAndView receivingStatementMm(@RequestParam String yyyy , @RequestParam String mm) {
		ModelAndView mav = new ModelAndView("receiving/receiving_statement");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		int resultmm=Integer.parseInt(mm);
		if(resultmm<10) {
			mm = String.format("%02d", resultmm);
		}
		HashMap yyyymm = new HashMap();
		yyyymm.put("yyyy", yyyy);
		yyyymm.put("mm", mm);
		ArrayList<Receiving>receivings=receivingdao.SelectReceivingStatementMm(yyyymm);
		mav.addObject("receivings",receivings);
		mav.addObject("yyyy",yyyy);
		mav.addObject("mm",mm);
		mav.addObject("number",1);
		return mav;
	}
	@RequestMapping(value = "receivingStatementDd", method = RequestMethod.POST)
	 public ModelAndView receivingStatementDd(@ModelAttribute("receiving")Receiving receiving) {
		ModelAndView mav = new ModelAndView("receiving/receiving_statement");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		int resultmm=Integer.parseInt(receiving.getMm());
		if(resultmm<10) {
			String mm = String.format("%02d", resultmm);
			receiving.setMm(mm);
		}
		int resultdd=Integer.parseInt(receiving.getDd());
		if(resultdd<10) {
			String dd = String.format("%02d", resultdd);
			receiving.setDd(dd);
		}
		ArrayList<Receiving>receivings=receivingdao.SelectReceivingStatementDd(receiving);
		mav.addObject("receivings",receivings);
		mav.addObject("yyyy",receiving.getYyyy());
		mav.addObject("mm",receiving.getMm());
		mav.addObject("dd",receiving.getDd());
		mav.addObject("number",1);
		return mav;
	}
	
	@RequestMapping(value = "equipmentStatementAll", method = RequestMethod.POST)
	 public ModelAndView equipmentStatement(@RequestParam String yyyy , @RequestParam String mm) {
		ModelAndView mav = new ModelAndView("receiving/equipment_statement");
		ReceivingDAO receivingdao=sqlSession.getMapper(ReceivingDAO.class);
		int resultmm=Integer.parseInt(mm);
		if(resultmm<10) {
			mm = String.format("%02d", resultmm);
		}
		HashMap yyyymm = new HashMap();
		yyyymm.put("yyyy", yyyy);
		yyyymm.put("mm", mm);
		ArrayList<Receiving>receivings=receivingdao.SelectEquipmentStatement(yyyymm);
		mav.addObject("receivings",receivings);
		mav.addObject("yyyy",yyyy);
		mav.addObject("mm",mm);
		mav.addObject("number",1);
		return mav;
	}
}
