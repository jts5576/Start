package com.pino.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pino.domain.BoardComVo;
import com.pino.domain.BoardSearchDto;
import com.pino.domain.BoardVo;
import com.pino.domain.NoticeComVo;
import com.pino.domain.NoticeVo;
import com.pino.domain.PagingDto;
import com.pino.domain.SearchDto;
import com.pino.domain.StartComVo;
import com.pino.domain.StartVo;
import com.pino.persistence.IStartDao;

@Service
public class StartServiceImpl implements IStartService{

	@Inject
	private IStartDao startDao;

	// 입력
	public void insert(StartVo startVo)throws Exception{
		startDao.insert(startVo);
	}
	// option리스트
	@Override
	public List<StartComVo> selectAll() throws Exception {
		List<StartComVo> list = startDao.selectAll();
		return list;
	}
	// 전체조회
	@Override
	public List<StartVo> selectList(SearchDto searchDto) throws Exception {
		List<StartVo> list = startDao.selectList(searchDto);
		return list;
	}
	// 조회
	@Override
	public StartVo select(int sabun) throws Exception {
		StartVo startVo = startDao.select(sabun);
		return startVo;
	}
	// 수정
	@Override
	public void update(StartVo startVo) throws Exception {
		startDao.update(startVo);

	}
	// 사번
	@Override
	public int getSabun() throws Exception {
		int getSabun = startDao.getSabun();
		return getSabun;
	}
	// 삭제
	@Override
	public void sabunDelete(int sabun) throws Exception {
		startDao.sabunDelete(sabun);

	}
	// 게시글목록
	@Override
	public List<BoardVo> boardList(BoardSearchDto boardsearchDto) throws Exception {
		List<BoardVo> board = startDao.boardList(boardsearchDto);
		return board;
	}
	// 게시글조회
	@Override
	public BoardVo read(int bno) throws Exception {
		BoardVo boardVo = startDao.read(bno);
		startDao.viewCount(bno);
		return boardVo;
	}
	// board-option리스트
	@Override
	public List<BoardComVo> boardAll() throws Exception {
		List<BoardComVo> list = startDao.boardAll();
		return list;
	}
	// 게시글쓰기
	@Override
	public void write(BoardVo boardVo) throws Exception {
		startDao.write(boardVo);
	}
	// 게시글삭제
	@Override
	public void bnoDelete(int bno) throws Exception {
		startDao.bnoDelete(bno);
	}
	// 게시글수정
	@Override
	public void regist(BoardVo boardVo) throws Exception {
		startDao.regist(boardVo);
	}
	// 전달사항 글쓰기
	@Override
	public void made(NoticeVo noticeVo) throws Exception {
		startDao.made(noticeVo);
	}
	// 전달사항 글목록
	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> board = startDao.noticeList();
		return board;
	}
	// 전달사항 글조회
	@Override
	public NoticeVo view(int nn) throws Exception {
		NoticeVo noticeVo = startDao.view(nn);
		return noticeVo;
	}
	// 전달사항 글수정
	@Override
	public void advice(NoticeVo noticeVo) throws Exception {
		startDao.advice(noticeVo);
	}
	// 전달사항 글삭제
	@Override
	public void nnDelete(int nn) throws Exception {
		startDao.nnDelete(nn);
	}
	// notice-option리스트
	@Override
	public List<NoticeComVo> noticeAll() throws Exception {
		List<NoticeComVo> list = startDao.noticeAll();
		return list;
	}
}