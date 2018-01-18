package com.naver.kokfitness.mapper;

import org.springframework.stereotype.Component;

@Component
public class ReceivingSearch {
	private String bp_code;
	private String searchyyyy;
	private String searchmm;
	private String searchdd;
	
	public String getBp_code() {
		return bp_code;
	}
	public void setBp_code(String bp_code) {
		this.bp_code = bp_code;
	}
	public String getSearchyyyy() {
		return searchyyyy;
	}
	public void setSearchyyyy(String searchyyyy) {
		this.searchyyyy = searchyyyy;
	}
	public String getSearchmm() {
		return searchmm;
	}
	public void setSearchmm(String searchmm) {
		this.searchmm = searchmm;
	}
	public String getSearchdd() {
		return searchdd;
	}
	public void setSearchdd(String searchdd) {
		this.searchdd = searchdd;
	}
}
