package com.javalec.ex.model;

import java.util.Date;

public class UploadVO {
	private int uploadno;
	private String title;
	private MemberVO membervo;
	private String content;
	private String notice;
	private int readcount;
	private Date regdate;
	private int commentCount;
	private UploadComment comment;
	
	public int getUploadno() {
		return uploadno;
	}
	public void setUploadno(int uploadno) {
		this.uploadno = uploadno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public UploadComment getComment() {
		return comment;
	}
	public void setComment(UploadComment comment) {
		this.comment = comment;
	}
	
	@Override
	public String toString() {
		return "UploadVO [uploadno=" + uploadno + ", title=" + title + ", membervo=" + membervo + ", content=" + content
				+ ", notice=" + notice + ", readcount=" + readcount + ", regdate=" + regdate + ", commentCount="
				+ commentCount + ", comment=" + comment + "]";
	}
}
