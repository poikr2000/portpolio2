package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class ReceivingSearch {
	private String searchpartner;
	private String searchyyyy;
	private String searchmm;
	private String searchdd;
	
	public String getSearchpartner() {
		return searchpartner;
	}
	public void setSearchpartner(String searchpartner) {
		this.searchpartner = searchpartner;
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
