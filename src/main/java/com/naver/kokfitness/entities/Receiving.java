package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Receiving {
	private int seq;
	private String bp_code;
	private String bp_name;
	private String consume_code;
	private String equipment_code;
	private String beforeconsume_code;
	private String beforeequipment_code;
	private String consume_name;
	private String equipment_name;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private int price;
	private int qty;
	private int beforeqty;
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
	public String getEquipment_code() {
		return equipment_code;
	}
	public void setEquipment_code(String equipment_code) {
		this.equipment_code = equipment_code;
	}
	public String getConsume_name() {
		return consume_name;
	}
	public void setConsume_name(String consume_name) {
		this.consume_name = consume_name;
	}
	public String getEquipment_name() {
		return equipment_name;
	}
	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
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
	public String getBeforeconsume_code() {
		return beforeconsume_code;
	}
	public void setBeforeconsume_code(String beforeconsume_code) {
		this.beforeconsume_code = beforeconsume_code;
	}
	public String getBeforeequipment_code() {
		return beforeequipment_code;
	}
	public void setBeforeequipment_code(String beforeequipment_code) {
		this.beforeequipment_code = beforeequipment_code;
	}
	public int getBeforeqty() {
		return beforeqty;
	}
	public void setBeforeqty(int beforeqty) {
		this.beforeqty = beforeqty;
	}
}
