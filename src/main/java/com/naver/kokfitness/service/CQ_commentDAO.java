package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.CQ_comment;

public interface CQ_commentDAO {
	
	int cq_insert(CQ_comment cq_comment);
	
	ArrayList<CQ_comment> cq_selectList(int cq_parseq);

	int cq_comment_delete(int cq_seq);
	
	void cq_comment_delete_All(int parseq);
}
