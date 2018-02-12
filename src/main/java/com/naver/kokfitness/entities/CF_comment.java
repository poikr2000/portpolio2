package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class CF_comment {

	private int cf_seq;
	private String cf_name;
	private String cf_content;
	private String cf_date;
	private int cf_parseq;
	
	private String sort;
	private int f_seq;
	
	public int getCf_seq() {
		return cf_seq;
	}
	public void setCf_seq(int cf_seq) {
		this.cf_seq = cf_seq;
	}
	public String getCf_name() {
		return cf_name;
	}
	public void setCf_name(String cf_name) {
		this.cf_name = cf_name;
	}
	public String getCf_content() {
		return cf_content;
	}
	public void setCf_content(String cf_content) {
		this.cf_content = cf_content;
	}
	public String getCf_date() {
		return cf_date;
	}
	public void setCf_date(String cf_date) {
		this.cf_date = cf_date;
	}
	public int getCf_parseq() {
		return cf_parseq;
	}
	public void setCf_parseq(int cf_parseq) {
		this.cf_parseq = cf_parseq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
}
