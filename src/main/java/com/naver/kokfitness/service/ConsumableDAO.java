package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Category;
import com.naver.kokfitness.entities.Consumable;
import com.naver.kokfitness.entities.Receiving;

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
}
