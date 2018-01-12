package com.naver.kokfitness.service;

import java.util.HashMap;

import com.naver.kokfitness.entities.Member;

public interface MemberDAO {
	int emailConfirm(String email);
	int idConfirm(String id);
	void memberInsert(Member member);
	Member memberGetOne(String email);
	Member passwordFind(HashMap emailname);
	int passwordChange(Member member);
	void memberUpdate(Member member);
}
