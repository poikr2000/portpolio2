package com.naver.kokfitness;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.kokfitness.entities.Balance;
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
	@RequestMapping(value = "balanceForm", method = RequestMethod.GET)
	 public ModelAndView balanceForm() {
		ModelAndView mav = new ModelAndView("consumable/consumable_balance");
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		ArrayList<Balance>balances = consumabledao.balanceListAll();
		mav.addObject("balances",balances);
		return mav;
	}
	@RequestMapping(value = "balanceDetail", method = RequestMethod.GET)
	 public ModelAndView balanceDetail(@RequestParam String yyyy,@RequestParam String bp_code) {
		ModelAndView mav = new ModelAndView("consumable/consumable_balance_detail");
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		HashMap detailmap = new HashMap();
		detailmap.put("yyyy", yyyy);
		detailmap.put("bp_code", bp_code);
		Balance balance=consumabledao.balanceSelectGenOne(detailmap);
		mav.addObject("balance",balance);
		return mav;
	}
	@RequestMapping(value = "balanceUpdate", method = RequestMethod.POST)
	 public ModelAndView balanceUpdate(@ModelAttribute("balance")Balance balance) {
		ModelAndView mav = new ModelAndView("consumable/consumable_balance");
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		try {
			consumabledao.balanceUpdate(balance);
		} catch (Exception e) {
			System.out.println("----------"+e.getMessage());
		}
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
	public String consumableInsert(@ModelAttribute("consumable") Consumable consumable,
			@RequestParam CommonsMultipartFile imgfile) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		String path="D:/STSSOURCE/kokfitness/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String strcode = consumable.getCode();
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+strcode+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
			
		}
		try {
			consumable.setPhoto(realpath+strcode+originalname);
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
	public String consumableUpdate(@ModelAttribute("consumable") Consumable consumable,
			@RequestParam CommonsMultipartFile imgfile) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		String path="D:/STSSOURCE/kokfitness/src/main/webapp/resources/uploadfiles/";
		String realpath="resources/uploadfiles/";
		String originalname =imgfile.getOriginalFilename();
		String strcode = consumable.getCode();
		try {
			byte bytes[] = imgfile.getBytes();
			BufferedOutputStream output=
					new BufferedOutputStream(new FileOutputStream(path+strcode+originalname));
			output.write(bytes);
			output.flush();
			output.close();
		} catch (Exception e) {
			
		}
		try {
			if(originalname.equals("")) {
				consumable.setPhoto(consumable.getBeforephoto());
			}else {
				consumable.setPhoto(realpath+strcode+originalname);
			}
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
	@RequestMapping(value = "taskCloseForm", method = RequestMethod.GET)
	 public ModelAndView taskCloseForm() {
		ModelAndView mav = new ModelAndView("consumable/task_close");
		return mav;
	}
	@RequestMapping(value = "taskCloseMonth", method = RequestMethod.POST)
	 public String mmTaskClose(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_list");
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		int intmm = Integer.parseInt(mm)+1;
		if(intmm==13) {
			intmm=1;
		}
		String strmm = String.format("%02d",intmm);	
		String columnname = "prebalance"+strmm;
		HashMap closemap = new HashMap();
		closemap.put("yyyy", yyyy);
		closemap.put("columnname", columnname);
		consumabledao.balanceMonthClose(closemap);
		consumabledao.mmTaskClose();
		return "redirect:consumableList";
	}
	@RequestMapping(value = "taskCloseYear", method = RequestMethod.POST)
	 public String yearTaskClose(@RequestParam String yyyy,@RequestParam String mm) {
		ModelAndView mav = new ModelAndView("product/product_list");
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		int intyyyy=Integer.parseInt(yyyy)+1;
		HashMap yyyyclose = new HashMap();
		yyyyclose.put("yyyy", yyyy);
		yyyyclose.put("newyyyy", intyyyy+"");
		
		ArrayList<Balance> yybalances = consumabledao.balanceYyyyList(yyyyclose);
		consumabledao.balanceYearClose(yybalances);
		consumabledao.yearTaskClose();
		return "redirect:consumableList";
	}
}
