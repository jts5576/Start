package com.pino.domain;

import com.pino.domain.PagingDto;

public class SearchDto {
	private String sabun;
	private String name;
	private String join_yn;
	private String put_yn;
	private String join_gbn_code;
	private String join_day;
	private String retire_day;
	private String job_type;
	private PagingDto pagingDto;
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJoin_yn() {
		return join_yn;
	}
	public void setJoin_yn(String join_yn) {
		this.join_yn = join_yn;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	public String getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(String retire_day) {
		this.retire_day = retire_day;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public PagingDto getPagingDto() {
		return pagingDto;
	}
	public void setPagingDto(PagingDto pagingDto) {
		this.pagingDto = pagingDto;
	}
	@Override
	public String toString() {
		return "SearchDto [sabun=" + sabun + ", name=" + name + ", join_yn=" + join_yn + ", put_yn=" + put_yn
				+ ", join_gbn_code=" + join_gbn_code + ", join_day=" + join_day + ", retire_day=" + retire_day
				+ ", job_type=" + job_type + ", pagingDto=" + pagingDto + "]";
	}
}
