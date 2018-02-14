package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Category;
import com.naver.kokfitness.entities.Equipment;
import com.naver.kokfitness.entities.Receiving;

public interface EquipmentDAO {
	ArrayList<Category> categoryListAll();
	ArrayList<Equipment> equipmentListAll();
	int codeConfirm(String code);
	int equipmentInsert(Equipment equipment);
	Equipment selectGetOne(String code);
	void receivingAdd(Receiving receiving);
	void receivingUpdateSub(Receiving receiving);
	void receivingDeleteSub(Receiving receiving);
}
