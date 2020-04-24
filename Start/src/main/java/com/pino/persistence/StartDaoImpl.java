package com.pino.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import com.pino.domain.BoardComVo;
import com.pino.domain.BoardSearchDto;
import com.pino.domain.BoardVo;
import com.pino.domain.NoticeComVo;
import com.pino.domain.NoticeVo;
import com.pino.domain.PagingDto;
import com.pino.domain.SearchDto;
import com.pino.domain.StartComVo;
import com.pino.domain.StartVo;

@Repository
public class StartDaoImpl implements IStartDao {

	private static final String NAMESPACE = "start";

	@Inject
	private SqlSession sqlSession;

	// 입력
	@Override
	public void insert(StartVo startVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", startVo);
	}
	// option리스트
	@Override
	public List<StartComVo> selectAll() throws Exception {
		List<StartComVo> list = sqlSession.selectList("startcom.selectAll");
		return list;
	}
	// 전체조회
	@Override
	public List<StartVo> selectList(SearchDto searchDto) throws Exception {
		List<StartVo> list = sqlSession.selectList(NAMESPACE + ".selectList", searchDto);
		return list;
	}
	// 조회
	@Override
	public StartVo select(int sabun) throws Exception {
		StartVo startVo = sqlSession.selectOne(NAMESPACE + ".select", sabun);
		return startVo;
	}
	// 수정
	@Override
	public void update(StartVo startVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", startVo);

	}
	// 사번
	@Override
	public int getSabun() throws Exception {
		int getSabun = sqlSession.selectOne(NAMESPACE + ".getSabun");
		return getSabun;
	}
	// 삭제
	@Override
	public void sabunDelete(int sabun) throws Exception {
		sqlSession.delete(NAMESPACE + ".sabunDelete", sabun);

	}
	// 게시글목록
	@Override
	public List<BoardVo> boardList(BoardSearchDto boardsearchDto) throws Exception {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + ".boardList", boardsearchDto);
		return list;
	}
	// 게시글조회
	@Override
	public BoardVo read(int bno) throws Exception {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + ".read", bno);
		return boardVo;
	}
	// 조회수
	@Override
	public void viewCount(int bno) throws Exception {
		sqlSession.update(NAMESPACE + ".viewcnt", bno);
	}
	// board-option리스트
	@Override
	public List<BoardComVo> boardAll() throws Exception {
		List<BoardComVo> list = sqlSession.selectList("boardcom.boardAll");
		return list;
	}
	// 게시글쓰기
	@Override
	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".write", boardVo);
	}
	// 게시글삭제
	@Override
	public void bnoDelete(int bno) throws Exception {
		sqlSession.delete(NAMESPACE + ".bnoDelete", bno);

	}
	// 게시글수정
	@Override
	public void regist(BoardVo boardVo) throws Exception {
		sqlSession.update(NAMESPACE + ".regist", boardVo);
	}
	// 전달사항 글쓰기
	@Override
	public void made(NoticeVo noticeVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".made", noticeVo);
	}
	// 전달사항 글목록
	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> list = sqlSession.selectList(NAMESPACE + ".noticeList");
		return list;
	}
	// 전달사항 글조회
	@Override
	public NoticeVo view(int nn) throws Exception {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE + ".view", nn);
		return noticeVo;
	}
	// 전달사항 글수정
	@Override
	public void advice(NoticeVo noticeVo) throws Exception {
		sqlSession.update(NAMESPACE + ".advice", noticeVo);
	}
	// 전달사항 글삭제
	@Override
	public void nnDelete(int nn) throws Exception {
		sqlSession.delete(NAMESPACE + ".nnDelete", nn);
	}
	// notice-option리스트
	@Override
	public List<NoticeComVo> noticeAll() throws Exception {
		List<NoticeComVo> list = sqlSession.selectList("noticecom.noticeAll");
		return list;
	}
}