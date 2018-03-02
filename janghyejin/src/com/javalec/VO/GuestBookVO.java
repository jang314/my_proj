package com.javalec.VO;

import java.sql.Date;

public class GuestBookVO {
	private int idx;
	private String id;
	private String name;
	private String password;
	private String content;
	private Date writedate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	@Override
	public String toString() {
		return "GuestBookVO [idx=" + idx + ", id=" + id + ", name=" + name + ", password=" + password + ", content="
				+ content + ", writedate=" + writedate + "]";
	}
}
