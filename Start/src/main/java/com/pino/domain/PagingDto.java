package com.pino.domain;

public class PagingDto {
	private int nowPage = 1;
	private int perPage = 10;
	private int startRow = 1;
	private int endRow = startRow + perPage - 1;
	private String searchType;
	private String keyword;
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		setRow();
	}
	public void setRow() {
		startRow = perPage * (nowPage -1) + 1;
		endRow = startRow + perPage -1;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "PagingDto [nowPage=" + nowPage + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow="
				+ endRow + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
