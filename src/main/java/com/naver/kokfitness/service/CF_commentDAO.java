package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.CF_comment;

public interface CF_commentDAO {

	int cf_insert(CF_comment cf_comment);
	
	ArrayList<CF_comment> cf_selectListAll();
	
}
