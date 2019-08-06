package com.project.weekend.member;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String pwCheck;
	private String name;
	private String nickname;
	private String email;
	private int age;
	private String phone;
	private int grade;
	private int count;
	private int overlap;
	private Date reg_date;
	
	
	
	
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getOverlap() {
		return overlap;
	}
	public void setOverlap(int overlap) {
		this.overlap = overlap;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getPwCheck() {
		return pwCheck;
	}
	public void setPwCheck(String pwCheck) {
		this.pwCheck = pwCheck;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
