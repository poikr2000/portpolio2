package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Partner;

public interface PartnerDAO {
	int codeConfirm(String code);
	void partnerInsert(Partner partner);
	ArrayList<Partner> partnerListAll();
	Partner partnerGetOne(String code);
	void partnerDelete(String code);
	void partnerUpdate(Partner partner);
}
