package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Receiving;
import com.naver.kokfitness.entities.ReceivingSearch;

public interface ReceivingDAO {
	int selectSequenceNo(Receiving receiving);
	void receivingInsert(Receiving receiving);
	ArrayList<Receiving> receivingSelectListAll(Receiving receiving);
	ArrayList<Receiving> SelectReceivingSearchRollup(ReceivingSearch receivingsearch);
	Receiving receivingSelectOne(String seq);
	void deleteRow(String seq);
	void updateRow(Receiving receiving);
}
