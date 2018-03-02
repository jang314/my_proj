package com.javalec.VO;

import java.sql.Date;

public class MemberVO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private  Date birth;
	private String gender;
	private String phone;
	private String post;
	private String address;
	private String email;
	private Date joinDate;
	private int grade=0;
	
	
	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", phone=" + phone + ", post=" + post + ", address=" + address + ", email="
				+ email + ", joinDate=" + joinDate + ", grade=" + grade + "]";
	}
	
	
}
