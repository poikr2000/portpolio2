package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Staff;

public interface StaffDAO {
	int codeConfirm(String code);
	void staffInsert(Staff staff);
	ArrayList<Staff> staffListAll();
	int staffDelete(String code);
	Staff staffGetOne(String code);
	int staffUpdate(Staff staff);
}
