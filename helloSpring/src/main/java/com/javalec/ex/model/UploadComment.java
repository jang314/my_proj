package com.javalec.ex.model;

import java.util.Date;

public class UploadComment {
	
	private int no;
	private MemberVO membervo;
	private String content;
	private Date regdate;
	private int uploadno;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public MemberVO getMembervo() {
		return membervo;
	}
	public void setMembervo(MemberVO membervo) {
		this.membervo = membervo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getUploadno() {
		return uploadno;
	}
	public void setUploadno(int uploadno) {
		this.uploadno = uploadno;
	}
	
	@Override
	public String toString() {
		return "UploadComment [no=" + no + ", membervo=" + membervo + ", content=" + content + ", regdate=" + regdate
				+ ", uploadno=" + uploadno + "]";
	}
}
