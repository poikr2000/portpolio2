package com.naver.kokfitness;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		ArrayList<Consumable> consumables = consumabledao.consumableListMileage();
		String member_mail = session.getAttribute("sessionemail").toString();
		int cartcount = shippingdao.cartCount(member_mail);
		Member data=memberdao.memberGetOne(member_mail);
		session.setAttribute("sessionmileage", data.getMileage());
		
		ModelAndView mav = new ModelAndView("mileage/mileage_list");
		mav.addObject("consumables", consumables);
		mav.addObject("cartcount",cartcount);
		return mav;
	}
	@RequestMapping(value = "shippingStatement", method = RequestMethod.GET)
	public ModelAndView receivingStatement() {
		ModelAndView mav = new ModelAndView("mileage/shipping_statement");
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
	@RequestMapping(value = "directOrderInsert", method = RequestMethod.POST)
	public ModelAndView directOrderInsert(@ModelAttribute("shipping") Shipping shipping) {
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
		shippingdao.directOrderInsert(shipping);
		consumabledao.shippingSub(shipping);
		memberdao.mileageSub(shipping);
		ArrayList<Shipping>shippings = shippingdao.memberOrderList(shipping.getMember_mail());
		ModelAndView mav = new ModelAndView("member/member_order");
		mav.addObject("shippings",shippings);
		return mav;
	}
	@RequestMapping(value = "orderInsert", method = RequestMethod.POST)
	public ModelAndView orderInsert(@RequestParam ("seq") List<String> seq) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		for(String data:seq) {
			shippingdao.orderInsert(data);
		}
		Shipping shipping=shippingdao.selectGetOne(seq.get(0));
		System.out.println(shipping.getMember_mail());
		if(shipping.getMember_mail().equals("admin@admin.com")) {
			ArrayList<Shipping>shippings = shippingdao.orderListAll();
			ModelAndView mav = new ModelAndView("order/order_list");
			mav.addObject("shippings",shippings);
			return mav;
		}else {
			ArrayList<Shipping>shippings = shippingdao.memberOrderList(shipping.getMember_mail());
			ModelAndView mav = new ModelAndView("member/member_order");
			mav.addObject("shippings",shippings);
			return mav;
		}
	}
	@RequestMapping(value = "memberOrderList", method = RequestMethod.GET)
	public ModelAndView memberOrderList(@RequestParam String email) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ArrayList<Shipping>shippings = shippingdao.memberOrderList(email);
		ModelAndView mav = new ModelAndView("member/member_order");
		mav.addObject("shippings",shippings);
		return mav;
	}
	@RequestMapping(value = "orderListForm", method = RequestMethod.GET)
	public ModelAndView orderListForm() {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ArrayList<Shipping>shippings = shippingdao.orderListAll();
		ModelAndView mav = new ModelAndView("order/order_list");
		mav.addObject("shippings",shippings);
		return mav;
	}
	@RequestMapping(value = "orderDelete", method = RequestMethod.POST)
	public ModelAndView orderDelete(@RequestParam String seq,HttpSession session) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		Shipping shipping=shippingdao.selectGetOne(seq);
		consumabledao.shippingAdd(shipping);
		memberdao.mileageAdd(shipping);
		shippingdao.cartDelete(seq);
		ArrayList<Shipping>shippings = shippingdao.memberOrderList(shipping.getMember_mail());
		Member data=memberdao.memberGetOne(shipping.getMember_mail());
		session.setAttribute("sessionmileage", data.getMileage());
		ModelAndView mav = new ModelAndView("member/member_order");
		mav.addObject("shippings",shippings);
		return mav;
	}
	@RequestMapping(value = "shippingCheckOut", method = RequestMethod.POST)
	public String shippingCheckOut(@RequestParam String seq) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy= date.substring(0,4);
		String mm = date.substring(5,7);
		String dd = date.substring(8,10);
		Shipping shipping=shippingdao.selectGetOne(seq);
		shipping.setYyyy(yyyy);
		shipping.setMm(mm);
		shipping.setDd(dd);
		shipping.setSeq(Integer.parseInt(seq));
		try {
			shipping.setColumnname("ship"+shipping.getMm());
			consumabledao.shippingUpdate(shipping);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		shippingdao.shippingCheckOut(shipping);
		return "redirect:orderListForm";
	}
	@RequestMapping(value = "shippingCancel", method = RequestMethod.POST)
	public String shippingCancel(@RequestParam String seq) {
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		ConsumableDAO consumabledao=sqlSession.getMapper(ConsumableDAO.class);
		MemberDAO memberdao=sqlSession.getMapper(MemberDAO.class);
		Shipping shipping=shippingdao.selectGetOne(seq);
		consumabledao.shippingAdd(shipping);
		memberdao.mileageAdd(shipping);
		shippingdao.cartDelete(seq);
		return "redirect:orderListForm";
	}
	@RequestMapping(value = "shippingStatementMm", method = RequestMethod.POST)
	 public ModelAndView shippingStatementMm(@RequestParam String yyyy , @RequestParam String mm) {
		ModelAndView mav = new ModelAndView("mileage/shipping_statement");
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		int resultmm=Integer.parseInt(mm);
		if(resultmm<10) {
			mm = String.format("%02d", resultmm);
		}
		HashMap yyyymm = new HashMap();
		yyyymm.put("yyyy", yyyy);
		yyyymm.put("mm", mm);
		ArrayList<Shipping>shippings=shippingdao.SelectShippingStatementMm(yyyymm);
		mav.addObject("shippings",shippings);
		mav.addObject("yyyy",yyyy);
		mav.addObject("mm",mm);
		mav.addObject("number",1);
		return mav;
	}
	@RequestMapping(value = "shippingStatementDd", method = RequestMethod.POST)
	 public ModelAndView shippingStatementDd(@ModelAttribute("shipping")Shipping shipping) {
		ModelAndView mav = new ModelAndView("mileage/shipping_statement");
		ShippingDAO shippingdao=sqlSession.getMapper(ShippingDAO.class);
		int resultmm=Integer.parseInt(shipping.getMm());
		if(resultmm<10) {
			String mm = String.format("%02d", resultmm);
			shipping.setMm(mm);
		}
		int resultdd=Integer.parseInt(shipping.getDd());
		if(resultdd<10) {
			String dd = String.format("%02d", resultdd);
			shipping.setDd(dd);
		}
		System.out.println("----------------"+shipping.getDd());
		ArrayList<Shipping>shippings=shippingdao.SelectShippingStatementDd(shipping);
		mav.addObject("shippings",shippings);
		mav.addObject("yyyy",shipping.getYyyy());
		mav.addObject("mm",shipping.getMm());
		mav.addObject("dd",shipping.getDd());
		mav.addObject("number",1);
		return mav;
	}
}
