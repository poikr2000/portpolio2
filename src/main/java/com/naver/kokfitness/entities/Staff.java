package com.naver.kokfitness.entities;

import org.springframework.stereotype.Component;

@Component
public class Staff {
	private String code;
	private String name;
	private String birth_date;
	private String zipcode;
	private String newaddr;
	private String detailaddr;
	private String phone1;
	private String phone2;
	private String phone3;
	private String photo;
	private String beforephoto;
	private String certificate1;
	private String certificate2;
	private String certificate3;
	
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
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getNewaddr() {
		return newaddr;
	}
	public void setNewaddr(String newaddr) {
		this.newaddr = newaddr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCertificate1() {
		return certificate1;
	}
	public void setCertificate1(String certificate1) {
		this.certificate1 = certificate1;
	}
	public String getCertificate2() {
		return certificate2;
	}
	public void setCertificate2(String certificate2) {
		this.certificate2 = certificate2;
	}
	public String getCertificate3() {
		return certificate3;
	}
	public void setCertificate3(String certificate3) {
		this.certificate3 = certificate3;
	}
	public String getBeforephoto() {
		return beforephoto;
	}
	public void setBeforephoto(String beforephoto) {
		this.beforephoto = beforephoto;
	}
	
}
