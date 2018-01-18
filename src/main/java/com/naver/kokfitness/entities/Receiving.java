package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Receiving {
	private int seq;
	private String bp_code;
	private String bp_name;
	private String consume_code;
	private String consume_name;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private int price;
	private int qty;
	private int total;
	private int stock;
	private String columnname;
	private String memo;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public String getConsume_code() {
		return consume_code;
	}
	public void setConsume_code(String consume_code) {
		this.consume_code = consume_code;
	}
	public String getConsume_name() {
		return consume_name;
	}
	public void setConsume_name(String consume_name) {
		this.consume_name = consume_name;
	}
	public String getYyyy() {
		return yyyy;
	}
	public void setYyyy(String yyyy) {
		this.yyyy = yyyy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHang() {
		return hang;
	}
	public void setHang(int hang) {
		this.hang = hang;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getColumnname() {
		return columnname;
	}
	public void setColumnname(String columnname) {
		this.columnname = columnname;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
