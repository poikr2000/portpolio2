package com.naver.kokfitness.service;

import java.util.ArrayList;

import com.naver.kokfitness.entities.F_board;

public interface F_boardDAO {

	int f_insert(F_board f_board);

	void updateHit(Object f_seq);

	F_board selectDetail(int f_seq);

	ArrayList<F_board> f_boardselectListAll();

	
}
