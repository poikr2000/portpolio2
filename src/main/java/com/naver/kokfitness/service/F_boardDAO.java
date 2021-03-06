package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.F_board;

public interface F_boardDAO {

	int f_insert(F_board f_board);

	void f_board_updateHit(int f_seq);

	F_board selectDetail(int f_seq);
	
	int f_modify(F_board f_board);

	ArrayList<F_board> f_boardselectListAll();

	F_board selectGetOne(int f_seq);
	
	int f_board_delete(int f_seq);
	
	int cf_comcount(int cf_parseq);
	
}
