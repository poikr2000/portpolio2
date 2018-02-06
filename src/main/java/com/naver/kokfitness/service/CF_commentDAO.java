package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.CF_comment;

public interface CF_commentDAO {

	int cf_insert(CF_comment cf_comment);
	
	ArrayList<CF_comment> cf_selectList(int cf_parseq);

	ArrayList<CF_comment> cf_selectList_desc(int cf_parseq);
	
	int cf_comment_delete(int cf_seq);
	
	void cf_comment_delete_All(int cf_parseq);
	
	String select_cf_date(int f_seq);
}