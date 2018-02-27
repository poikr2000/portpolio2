package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Equipment {
	private String code;
	private String name;
	private String capacity;
	private int stock;
	private int price;
	private String rcv_date;
	private String bp_code;
	private String bp_name;
	private String category_code;
	private String explanation;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getRcv_date() {
		return rcv_date;
	}
	public void setRcv_date(String rcv_date) {
		this.rcv_date = rcv_date;
	}
	public String getBp_code() {
		return bp_code;
	}
	public void setBp_code(String bp_code) {
		this.bp_code = bp_code;
	}
	public String getBp_name() {
		return bp_name;
	}
	public void setBp_name(String bp_name) {
		this.bp_name = bp_name;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
