package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.Q_board;

public interface Q_boardDAO {

	int q_insert(Q_board Q_board);

	void q_board_updateHit(Object q_seq);

	Q_board selectDetail(int q_seq);
	
	int q_modify(Q_board q_board);

	ArrayList<Q_board> q_boardselectListAll();

	Q_board selectGetOne(int q_seq);
	
	int q_board_delete(int q_seq);
	
	int cq_comcount(int cq_parseq);
}
