package com.javalec.ex.model;

import java.util.Date;

public class MemberVO {
		private String id;
		private String password;
		private String repassword;
		private String name;
		private String gender;
		private String email;
		private Integer lev;
		private Date regdate;
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
		public String getRepassword() {
			return repassword;
		}
		public void setRepassword(String repassword) {
			this.repassword = repassword;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Integer getLev() {
			return lev;
		}
		public void setLev(Integer lev) {
			this.lev = lev;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		@Override
		public String toString() {
			return "MemberVO [id=" + id + ", password=" + password + ", repassword=" + repassword + ", name=" + name
					+ ", gender=" + gender + ", email=" + email + ", lev=" + lev + ", regdate=" + regdate + "]";
		}
}
