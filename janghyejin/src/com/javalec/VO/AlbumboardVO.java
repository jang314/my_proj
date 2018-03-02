package com.javalec.VO;

import java.util.Date;

public class AlbumboardVO {
	private int idx;
	private String id;
	private String name;
	private String title;
	private String content;
	private String img;
	private Date writeDate;
	private  int hit = 0;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "AlbumboardVO [idx=" + idx + ", id=" + id + ", name=" + name + ", title=" + title + ", content="
				+ content + ", img=" + img + ", writeDate=" + writeDate + ", hit=" + hit + "]";
	}
	
	
}
