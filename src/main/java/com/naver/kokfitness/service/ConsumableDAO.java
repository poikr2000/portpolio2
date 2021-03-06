package com.naver.kokfitness.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.kokfitness.entities.Balance;
import com.naver.kokfitness.entities.Category;
import com.naver.kokfitness.entities.Consumable;
import com.naver.kokfitness.entities.Receiving;
import com.naver.kokfitness.entities.Shipping;

public interface ConsumableDAO {
	ArrayList<Category> categoryListAll();
	int codeConfirm(String code);
	void consumableInsert(Consumable consumable);
	ArrayList<Consumable> consumableListAll();
	ArrayList<Consumable> consumableListMileage();
	void consumableDelete(String code);
	Consumable consumableGetOne(String code);
	Consumable selectGetOne(String code);
	void consumableUpdate(Consumable consumable);
	int GoodsConfirm(String bp_code);
	void receivingAdd(Receiving receiving);
	void receivingUpdateSub(Receiving receiving);
	void receivingDeleteSub(Receiving receiving);
	void shippingSub(Shipping shipping);
	void shippingAdd(Shipping shipping);
	void shippingUpdate(Shipping shipping);
	int mmTaskClose();
	int yearTaskClose();
	void balanceMonthClose(HashMap closemap);
	void balanceYearClose(ArrayList<Balance>list);
	ArrayList<Balance> balanceYyyyList(HashMap yyyyclose);
	ArrayList<Balance> balanceListAll();
	Balance balanceSelectGenOne(HashMap detailmap);
	void balanceUpdate(Balance balance);
}
