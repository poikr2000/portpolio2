package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Receiving;

public interface ReceivingDAO {
	int selectSequenceNo(Receiving receiving);
	void receivingInsert(Receiving receiving);
	ArrayList<Receiving> receivingSelectListAll(Receiving receiving);
}
