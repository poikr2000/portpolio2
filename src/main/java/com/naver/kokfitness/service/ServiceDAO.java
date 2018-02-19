package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Program;
import com.naver.kokfitness.entities.Service;

public interface ServiceDAO {
	Program serviceSelected(String radio);
	void serviceInsert(Service service);
	ArrayList<Service> serviceListGetOne(String member_mail);
	ArrayList<Service> serviceListAll();
	int serviceCheck(String member_mail);
	void serviceDelete(String seq);
	void serviceExpired(String seq);
	void serviceRegister(Service service);
	
}
