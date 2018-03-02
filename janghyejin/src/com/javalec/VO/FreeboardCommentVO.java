package com.javalec.VO;

import java.util.Date;

public class FreeboardCommentVO {
	private int idx;
	private int ref;
	private String name;
	private String content;
	private Date writeDate;
	private String id;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "FreeboardCommentVO [idx=" + idx + ", ref=" + ref + ", name=" + name + ", content=" + content
				+ ", writeDate=" + writeDate + ", id=" + id + "]";
	}
	
	
	
}
