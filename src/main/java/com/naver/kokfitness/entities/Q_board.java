package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Q_board {
	private int q_seq;
	private String q_name;
	private String q_title;
	private String q_content;
	private int q_hit;
	private String q_date;
	private int Q_cnt;
	
	public int getQ_cnt() {
		return Q_cnt;
	}
	public void setQ_cnt(int q_cnt) {
		Q_cnt = q_cnt;
	}
	public int getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
}
