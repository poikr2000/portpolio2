package com.naver.kokfitness.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.kokfitness.entities.Shipping;

public interface ShippingDAO {
	int selectSequenceNo(String member_mail);
	int selectSequenceHang(HashMap emailno);
	int cartCount(String member_mail);
	void shippingInsert(Shipping shipping);
	ArrayList<Shipping> memberCartList(String member_mail);
	void cartDelete(String seq);
	Shipping selectGetOne(String seq);
	void orderInsert(String seq);
	ArrayList<Shipping> memberOrderList(String member_mail);
}
