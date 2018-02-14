package com.naver.kokfitness.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.kokfitness.entities.Receiving;
import com.naver.kokfitness.entities.ReceivingSearch;

public interface ReceivingDAO {
	int selectSequenceNo(Receiving receiving);
	void receivingInsert(Receiving receiving);
	ArrayList<Receiving> receivingSelectListAll(Receiving receiving);
	ArrayList<Receiving> rcvRquipmentSelectListAll(Receiving receiving);
	ArrayList<Receiving> SelectReceivingSearchRollup(ReceivingSearch receivingsearch);
	ArrayList<Receiving> SelectEquipmentSearchRollup(ReceivingSearch receivingsearch);
	ArrayList<Receiving> SelectReceivingSearchRollupNotingPartner(ReceivingSearch receivingsearch);
	Receiving receivingSelectOne(String seq);
	Receiving equipmentSelectOne(String seq);
	void deleteRow(String seq);
	void updateRow(Receiving receiving);
	void equipmetUpdate(Receiving receiving);
	ArrayList<Receiving> SelectReceivingStatementMm(HashMap yyyymm);
	ArrayList<Receiving> SelectEquipmentStatement(HashMap yyyymm);
	ArrayList<Receiving> SelectReceivingStatementDd(Receiving receiving);
}
