package com.pino.domain;

public class PaginationDto {
	private int totalCount; // 데이터갯수
	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev; // 이전출력여부
	private boolean next; // 다음출력여부
	private int pageCount; // 전체 페에지 수 
	private int paginationCount = 10; // 페이지 출력 갯수
	private PagingDto pagingDto;
	
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		// 505 : 51
		if (pagingDto == null) {
			pagingDto = new PagingDto();
		}
		int perPage = pagingDto.getPerPage();
		
		// 전체 페이지 개수
		pageCount = totalCount / perPage;
		if (totalCount % perPage > 0) {
			pageCount += 1;
		}
		
		// 시작 페이지
		int page = pagingDto.getNowPage();
		startPage = ((page- 1) / paginationCount) * paginationCount + 1;
		endPage = startPage + paginationCount -1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		if (startPage != 1) {
			prev = true;
		}
		
		if (endPage != pageCount) {
			next = true;
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPaginationCount() {
		return paginationCount;
	}
	public void setPaginationCount(int paginationCount) {
		this.paginationCount = paginationCount;
	}
	public PagingDto getPagingDto() {
		return pagingDto;
	}
	public void setPagingDto(PagingDto pagingDto) {
		this.pagingDto = pagingDto;
	}
	@Override
	public String toString() {
		return "PaginationDto [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", pageCount=" + pageCount + ", paginationCount="
				+ paginationCount + ", pagingDto=" + pagingDto + "]";
	}
}
