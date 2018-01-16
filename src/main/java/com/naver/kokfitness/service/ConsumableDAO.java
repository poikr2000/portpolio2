package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Category;
import com.naver.kokfitness.entities.Consumable;

public interface ConsumableDAO {
	ArrayList<Category> categoryListAll();
	int codeConfirm(String code);
	void consumableInsert(Consumable consumable);
}