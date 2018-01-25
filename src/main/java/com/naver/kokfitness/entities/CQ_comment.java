package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class CQ_comment {
	
	private int cq_seq;
	private String cq_name;
	private String cq_content;
	private String cq_date;
	private int cq_parseq;
	private int cq_comcount;
	public int getCq_seq() {
		return cq_seq;
	}
	public void setCq_seq(int cq_seq) {
		this.cq_seq = cq_seq;
	}
	public String getCq_name() {
		return cq_name;
	}
	public void setCq_name(String cq_name) {
		this.cq_name = cq_name;
	}
	public String getCq_content() {
		return cq_content;
	}
	public void setCq_content(String cq_content) {
		this.cq_content = cq_content;
	}
	public String getCq_date() {
		return cq_date;
	}
	public void setCq_date(String cq_date) {
		this.cq_date = cq_date;
	}
	public int getCq_parseq() {
		return cq_parseq;
	}
	public void setCq_parseq(int cq_parseq) {
		this.cq_parseq = cq_parseq;
	}
	public int getCq_comcount() {
		return cq_comcount;
	}
	public void setCq_comcount(int cq_comcount) {
		this.cq_comcount = cq_comcount;
	}
}
