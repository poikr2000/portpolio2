package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class F_board {

	private int f_seq;
	private String f_name;
	private String f_title;
	private String f_content;
	private int f_hit;
	private String f_date;
	private String f_attach;
	private String f_ip;
	
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public int getF_hit() {
		return f_hit;
	}
	public void setF_hit(int f_hit) {
		this.f_hit = f_hit;
	}
	public String getF_date() {
		return f_date;
	}
	public void setF_date(String f_date) {
		this.f_date = f_date;
	}
	public String getF_attach() {
		return f_attach;
	}
	public void setF_attach(String f_attach) {
		this.f_attach = f_attach;
	}
	public String getF_ip() {
		return f_ip;
	}
	public void setF_ip(String f_ip) {
		this.f_ip = f_ip;
	}
}
