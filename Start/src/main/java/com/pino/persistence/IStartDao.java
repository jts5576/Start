package com.pino.persistence;

import java.util.List;

import com.pino.domain.BoardComVo;
import com.pino.domain.BoardSearchDto;
import com.pino.domain.BoardVo;
import com.pino.domain.NoticeComVo;
import com.pino.domain.NoticeVo;
import com.pino.domain.PagingDto;
import com.pino.domain.SearchDto;
import com.pino.domain.StartComVo;
import com.pino.domain.StartVo;

public interface IStartDao {
	// 입력
	public void insert(StartVo startVo)throws Exception; 

	// option리스트
	public List<StartComVo> selectAll()throws Exception;

	// 전체조회
	public List<StartVo> selectList(SearchDto searchDto)throws Exception;

	// 조회
	public StartVo select(int sabun)throws Exception;

	// 수정
	public void update(StartVo startVo)throws Exception;

	// 사본
	public int getSabun()throws Exception;

	// 삭제
	public void sabunDelete(int sabun)throws Exception;

	// 게시판목록
	public List<BoardVo> boardList(BoardSearchDto boardsearchDto)throws Exception;

	// 게시글조회
	public BoardVo read(int bno)throws Exception;

	// 조회수
	public void viewCount(int bno)throws Exception;

	// board-option리스트
	public List<BoardComVo> boardAll()throws Exception;

	// 게시글쓰기
	public void write(BoardVo boardVo)throws Exception;

	// 게시글삭제
	public void bnoDelete(int bno)throws Exception;

	// 게시글수정
	public void regist(BoardVo boardVo)throws Exception;

	// 전달사항 글쓰기
	public void made(NoticeVo noticeVo)throws Exception;

	// 전달사항 글목록
	public List<NoticeVo> noticeList()throws Exception;

	// 전달사항 글조회
	public NoticeVo view(int nn)throws Exception;

	// 전달사항 글수정
	public void advice(NoticeVo noticeVo)throws Exception;

	// 전달사항 글삭제
	public void nnDelete(int nn)throws Exception;

	// notice-option리스트
	public List<NoticeComVo> noticeAll()throws Exception;
}