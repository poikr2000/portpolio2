package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Shipping {
	private int seq;
	private String consume_code;
	private String beforeconsume_code;
	private String consume_name;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private int price;
	private int qty;
	private int beforeqty;
	private int shipping_check; //0 or 9
	private int order_check; //0 or 9
	private int total;
	private int stock;
	private String member_mail;
	private int cartcount;
	private String photo;
	private int mileageprice;
	private int mileagetotal;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getConsume_code() {
		return consume_code;
	}
	public void setConsume_code(String consume_code) {
		this.consume_code = consume_code;
	}
	public String getBeforeconsume_code() {
		return beforeconsume_code;
	}
	public void setBeforeconsume_code(String beforeconsume_code) {
		this.beforeconsume_code = beforeconsume_code;
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
	public int getBeforeqty() {
		return beforeqty;
	}
	public void setBeforeqty(int beforeqty) {
		this.beforeqty = beforeqty;
	}
	public int getShipping_check() {
		return shipping_check;
	}
	public void setShipping_check(int shipping_check) {
		this.shipping_check = shipping_check;
	}
	public int getOrder_check() {
		return order_check;
	}
	public void setOrder_check(int order_check) {
		this.order_check = order_check;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}
	public int getCartcount() {
		return cartcount;
	}
	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getMileageprice() {
		return mileageprice;
	}
	public void setMileageprice(int mileageprice) {
		this.mileageprice = mileageprice;
	}
	public int getMileagetotal() {
		return mileagetotal;
	}
	public void setMileagetotal(int mileagetotal) {
		this.mileagetotal = mileagetotal;
	}
}
