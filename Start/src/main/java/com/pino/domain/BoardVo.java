package com.pino.domain;

public class BoardVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private String viewcnt;
	private String dept_code;
	private String area;
	private String gender;
	private String kosa;
	private String mil_yn;
	private int tot_cnt;
	private String file_up;
	private String file_up1;
	private String hobby;
	private String marry;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
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
	public int getTot_cnt() {
		return tot_cnt;
	}
	public void setTot_cnt(int tot_cnt) {
		this.tot_cnt = tot_cnt;
	}
	public String getFile_up() {
		return file_up;
	}
	public void setFile_up(String file_up) {
		this.file_up = file_up;
	}
	public String getFile_up1() {
		return file_up1;
	}
	public void setFile_up1(String file_up1) {
		this.file_up1 = file_up1;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", dept_code=" + dept_code + ", area=" + area + ", gender="
				+ gender + ", kosa=" + kosa + ", mil_yn=" + mil_yn + ", tot_cnt=" + tot_cnt + ", file_up=" + file_up
				+ ", file_up1=" + file_up1 + ", hobby=" + hobby + ", marry=" + marry + "]";
	}
}