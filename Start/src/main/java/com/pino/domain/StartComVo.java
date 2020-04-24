package com.pino.domain;

public class StartComVo {
	private String gubun; // 구분	
	private String code; // 코드
	private String name; // 이름
	private String note; // 비고
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Override
	public String toString() {
		return "InsaComVo [gubun=" + gubun + ", code=" + code + ", name=" + name + ", note=" + note + "]";
	}
	
	
}
