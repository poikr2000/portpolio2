package com.naver.kokfitness;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.naver.kokfitness.entities.Member;
import com.naver.kokfitness.entities.Shipping;
import com.naver.kokfitness.service.ConsumableDAO;
import com.naver.kokfitness.service.MemberDAO;
import com.naver.kokfitness.service.ShippingDAO;

@Controller
public class MileageController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	Shipping shipping;
	
	@RequestMapping(value = "mileageListForm", method = RequestMethod.GET)
	public ModelAndView mileageListForm(HttpSession session) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ArrayList<Consumable> consumables = consumabledao.consumableListMileage();
		String member_mail = session.getAttribute("sessionemail").toString();
		int cartcount = shippingdao.cartCount(member_mail);
		ModelAndView mav = new ModelAndView("mileage/mileage_list");
		mav.addObject("consumables", consumables);
		mav.addObject("cartcount",cartcount);
		return mav;
	}
	@RequestMapping(value = "mileageDetail", method = RequestMethod.POST)
	@ResponseBody
	public Consumable mileageDetail(@RequestParam String code) {
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		Consumable consumable= consumabledao.consumableGetOne(code);
		return consumable;
	}
	@RequestMapping(value = "shippingInsert", method = RequestMethod.POST)
	@ResponseBody
	public Shipping shippingInsert(@ModelAttribute("shipping") Shipping shipping,HttpSession session) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		int no=shippingdao.selectSequenceNo(shipping.getMember_mail());
		shipping.setNo(no);
		HashMap emailno = new HashMap();
		emailno.put("email", shipping.getMember_mail());
		emailno.put("no", no);
		int hang=shippingdao.selectSequenceHang(emailno);
		shipping.setHang(hang);
		shippingdao.shippingInsert(shipping);
		consumabledao.shippingSub(shipping);
		memberdao.mileageSub(shipping);
		int cartcount = shippingdao.cartCount(shipping.getMember_mail());
		shipping.setCartcount(cartcount);
		
		Member data=memberdao.memberGetOne(shipping.getMember_mail());
		session.setAttribute("sessionmileage", data.getMileage());
		return shipping;
	}
	@RequestMapping(value = "cartDetail", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Shipping> cartDetail(@RequestParam String member_mail) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ArrayList<Shipping>shippings=shippingdao.memberCartList(member_mail);
		return shippings;
	}
	@RequestMapping(value = "cartDelete", method = RequestMethod.POST)
	@ResponseBody
	public Shipping cartDelete(@RequestParam String seq,HttpSession session) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		Shipping shipping=shippingdao.selectGetOne(seq);
		consumabledao.shippingAdd(shipping);
		memberdao.mileageAdd(shipping);
		shippingdao.cartDelete(seq);
		int cartcount = shippingdao.cartCount(shipping.getMember_mail());
		shipping.setCartcount(cartcount);
		
		Member data=memberdao.memberGetOne(shipping.getMember_mail());
		session.setAttribute("sessionmileage", data.getMileage());
		return shipping;
	}
	@RequestMapping(value = "orderInsert", method = RequestMethod.POST)
	public ModelAndView orderInsert(@RequestParam ("seq") List<String> seq) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		for(String data:seq) {
			shippingdao.orderInsert(data);
		}
		ModelAndView mav = new ModelAndView("member/member_order");
		return mav;
	}
	@RequestMapping(value = "memberOrderList", method = RequestMethod.GET)
	public ModelAndView memberOrderList(@RequestParam String email) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ArrayList<Shipping>shippings = shippingdao.memberOrderList(email);
		ModelAndView mav = new ModelAndView("member/member_order");
		mav.addObject("shippings",shippings);
		return mav;
	}
	@RequestMapping(value = "orderDelete", method = RequestMethod.POST)
	public ModelAndView orderDelete(@RequestParam String seq) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		System.out.println("-------------"+seq);
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
}
