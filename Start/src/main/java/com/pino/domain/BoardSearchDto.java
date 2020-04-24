package com.pino.domain;

public class BoardSearchDto {
	private String writer;
	private String dept_code;
	private String area;
	private String gender;
	private String kosa;
	private String mil_yn;
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getKosa() {
		return kosa;
	}
	public void setKosa(String kosa) {
		this.kosa = kosa;
	}
	public String getMil_yn() {
		return mil_yn;
	}
	public void setMil_yn(String mil_yn) {
		this.mil_yn = mil_yn;
	}
	@Override
	public String toString() {
		return "BoardSearchDto [writer=" + writer + ", dept_code=" + dept_code + ", area=" + area + ", gender=" + gender
				+ ", kosa=" + kosa + ", mil_yn=" + mil_yn + "]";
	}
}
