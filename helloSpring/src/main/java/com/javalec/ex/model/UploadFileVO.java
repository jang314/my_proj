package com.javalec.ex.model;

public class UploadFileVO {
	private int uploadfileno;
	private String savedfilename;
	private String userfilename;
	private int downloadCount;
	private int uploadno;
	public int getUploadfileno() {
		return uploadfileno;
	}
	public void setUploadfileno(int uploadfileno) {
		this.uploadfileno = uploadfileno;
	}
	public String getSavedfilename() {
		return savedfilename;
	}
	public void setSavedfilename(String savedfilename) {
		this.savedfilename = savedfilename;
	}
	public String getUserfilename() {
		return userfilename;
	}
	public void setUserfilename(String userfilename) {
		this.userfilename = userfilename;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public int getUploadno() {
		return uploadno;
	}
	public void setUploadno(int uploadno) {
		this.uploadno = uploadno;
	}
	
	@Override
	public String toString() {
		return "UploadFileVO [uploadfileno=" + uploadfileno + ", savedfilename=" + savedfilename + ", userfilename="
				+ userfilename + ", downloadCount=" + downloadCount + ", uploadno=" + uploadno + "]";
	}
}
