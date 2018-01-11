package com.naver.kokfitness.service;

import com.naver.kokfitness.entities.Member;

public interface MemberDAO {
	int emailConfirm(String email);
	int idConfirm(String id);
	void memberInsert(Member member);
	Member memberGetOne(String email);
	Member passwordFind(Member member);
	int passwordChange(Member member);
}
