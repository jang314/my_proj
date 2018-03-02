package com.javalec.VO;

import java.util.Date;

public class AlbumboardCommentVO {
	private int idx;
	private int ref;
	private String id;
	private String name;
	private String content;
	private Date writeDate;
	private String img ="" ;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	@Override
	public String toString() {
		return "AlbumboardCommentVO [idx=" + idx + ", ref=" + ref + ", id=" + id + ", name=" + name + ", content="
				+ content + ", writeDate=" + writeDate + ", img=" + img + "]";
	}
}
