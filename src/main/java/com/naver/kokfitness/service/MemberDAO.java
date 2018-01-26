package com.naver.kokfitness.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.kokfitness.entities.Member;
import com.naver.kokfitness.entities.Program;

public interface MemberDAO {
	int emailConfirm(String email);
	int idConfirm(String id);
	void memberInsert(Member member);
	Member memberGetOne(String email);
	Member passwordFind(HashMap emailname);
	int passwordChange(Member member);
	void memberUpdate(Member member);
	void adminMemberUpdate(Member member);
	ArrayList<Member> memberListAll();
	void memberDelete(String email);
	ArrayList<Program> programListAll();
	void memberUpdateNotPass(Member member);
}
