package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.N_board;

public interface N_boardDAO {

	int n_insert(N_board N_board);

	void n_board_updateHit(Object n_seq);

	N_board selectDetail(int n_seq);
	
	int n_modify(N_board n_board);

	ArrayList<N_board> n_boardselectListAll();

	N_board selectGetOne(int n_seq);
	
	int n_board_delete(int n_seq);
}
