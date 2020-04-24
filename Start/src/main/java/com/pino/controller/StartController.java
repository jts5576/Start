package com.pino.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pino.domain.BoardComVo;
import com.pino.domain.BoardSearchDto;
import com.pino.domain.BoardVo;
import com.pino.domain.NoticeComVo;
import com.pino.domain.NoticeVo;
import com.pino.domain.SearchDto;
import com.pino.domain.StartComVo;
import com.pino.domain.StartVo;
import com.pino.service.IStartService;

@Controller
@RequestMapping("/start/*")
public class StartController {

	@Inject
	private IStartService startService;

	// 홈 메인
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main(BoardSearchDto boardsearchDto, Model model)throws Exception {
		List<BoardVo> board = startService.boardList(boardsearchDto);

		// BoardVo, BoardSearchDto(int tot_cnt) get.(0)0번째 빼오기
				if(board.size() != 0) {
					int tot_cnt = board.get(0).getTot_cnt();
					model.addAttribute("tot_cnt", tot_cnt);
				}

		model.addAttribute("board", board);
	}
	// 전달사항 Service뷰
	@RequestMapping(value="/service", method=RequestMethod.GET)
	public List<NoticeVo> service(Model model)throws Exception {
		List<NoticeVo> board = startService.noticeList();

		model.addAttribute("board", board);

		return board;
	}
	// 전달사항 글쓰기 - GET
	@RequestMapping(value="/made", method=RequestMethod.GET)
	public void made(Model model)throws Exception {
		List<NoticeComVo> noticeCom = startService.noticeAll();

		model.addAttribute("NoticeComVo", noticeCom);
	}
	// 전달사항 글쓰기 - POST
	@RequestMapping(value="/made-run", method = RequestMethod.POST)
	public String made(NoticeVo noticeVo, HttpSession session, RedirectAttributes attr, Model model)throws Exception {
		startService.made(noticeVo);
		System.out.println("noticeVo:" + noticeVo);
		return "redirect:/start/service";
	}
	// 전달사항 글조회 - GET
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void view(@RequestParam("nn")int nn, Model model)throws Exception {
		NoticeVo noticeVo = startService.view(nn);

		model.addAttribute("NoticeVo", noticeVo);
		System.out.println("noticeVo:" + noticeVo);
	}
	// 전달사항 글수정 - GET
	@RequestMapping(value="/advice", method = RequestMethod.GET)
	public void adviceGet(@RequestParam("nn")int nn, Model model)throws Exception {
		NoticeVo noticeVo = startService.view(nn);
		model.addAttribute("NoticeVo", noticeVo);

		List<NoticeComVo> noticeCom = startService.noticeAll();
		model.addAttribute("NoticeComVo", noticeCom);
	}
	// 전달사항 글수정 - POST
	@RequestMapping(value="/advice", method = RequestMethod.POST)
	public String advicePost(@RequestParam("nn")int nn, HttpSession session,
								Model model, RedirectAttributes rttr, NoticeVo noticeVo)throws Exception {

		startService.advice(noticeVo);
		rttr.addAttribute("message", "success_update");

		return "redirect:/start/service?nn=" + noticeVo.getNn();
	}
	// 전달사항 글삭제 - GET
	@RequestMapping(value="/nnDelete")
	public String nnDelete(@RequestParam("nn")int nn)throws Exception {
		startService.nnDelete(nn);

		return "redirect:/start/service";
	}
	// 게시판목록
	@RequestMapping(value="/board")
	public List<BoardVo> board(BoardSearchDto boardsearchDto, Model model)throws Exception {
		List<BoardVo> board = startService.boardList(boardsearchDto);
		List<BoardComVo> boardCom = startService.boardAll();

		// BoardVo, BoardSearchDto(int tot_cnt) get.(0)0번째 빼오기
		if(board.size() != 0) {
			int tot_cnt = board.get(0).getTot_cnt();
			model.addAttribute("tot_cnt", tot_cnt);
		}

		model.addAttribute("BoardComVo", boardCom);
		model.addAttribute("board", board);  // model view찾아갈때 내용전달임무
		
		model.addAttribute("id", "jts5076"); // model 파람값을 view단에다가 넘겨주기
											 // ("변수이름", "변수에 넣을 데이터값");

		return board;
	}

	// 게시글조회
	@RequestMapping(value="/read")
	public void read(@RequestParam("bno") int bno, Model model)throws Exception {
		BoardVo boardVo = startService.read(bno);
		model.addAttribute("BoardVo", boardVo);
		System.out.println("boardVo ================" + boardVo);
	}
	// 게시글쓰기 - GET
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void write(Model model)throws Exception {
		List<BoardComVo> boardCom = startService.boardAll();
		model.addAttribute("BoardComVo", boardCom);
	}
	// 게시글쓰기 - POST
	@RequestMapping(value="/write-run", method = RequestMethod.POST)
	public String write(BoardVo boardVo, HttpSession sessin, RedirectAttributes rttr, Model model)throws Exception {
		startService.write(boardVo);
		System.out.println("boardVo:" + boardVo);

		return "redirect:/start/board";
	}
	// 게시글 삭제 - GET
	@RequestMapping(value="/bnoDelete")
	public String bnoDelete(@RequestParam("bno")int bno)throws Exception {
		startService.bnoDelete(bno);

		return "redirect:/start/board";
	}
	// 게시글 수정 - GET
	@RequestMapping(value="/regist", method = RequestMethod.GET)
	public void registGet(@RequestParam("bno")int bno, Model model)throws Exception {
		BoardVo boardVo = startService.read(bno);
		model.addAttribute("BoardVo", boardVo);

		List<BoardComVo> boardCom = startService.boardAll();
		model.addAttribute("BoardComVo", boardCom);
	}
	// 게시글 수정 - POST
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public String registPost(@RequestParam("bno")int bno, Model model, RedirectAttributes rttr,
						HttpSession session, BoardVo boardVo)throws Exception {
		startService.regist(boardVo);
		rttr.addAttribute("message", "succees_update");
		return "redirect:/start/board?bno=" + boardVo.getBno(); 
	}
	// 입력 - GET
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void insert(Model model)throws Exception {
		int getSabun = startService.getSabun();
		model.addAttribute("sabun", getSabun);

		List<StartComVo> list = startService.selectAll();
		model.addAttribute("StartComVo", list);
	}
	// 입력 - POST
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Model model, StartVo startVo, 
				RedirectAttributes rttr, HttpSession session)throws Exception {

		startService.insert(startVo);
		rttr.addFlashAttribute("message", "success_insert");

		return "redirect:/start/select";
	}
	// 조회 - GET
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public void select(Model model, SearchDto searchDto)throws Exception {

		List<StartVo> list = startService.selectList(searchDto);
		System.err.println("list" + list.toString());

		List<StartComVo> listCom = startService.selectAll();

		model.addAttribute("list", list);
		model.addAttribute("StartComVo", listCom);
	}
	// 수정 - GET
	@RequestMapping(value="/update", method=RequestMethod.GET )
	public void update(@RequestParam("sabun")int sabun, Model model)throws Exception {
		StartVo startVo = startService.select(sabun);
		model.addAttribute("startVo", startVo);
		System.out.println("StartVo:"+ startVo);

		// 이메일 update부분 원하는위치정하기
		String total = startVo.getEmail();
		int emailtest1 = total.indexOf("@");
		String emailtest2 = total.substring(0, emailtest1);

		startVo.setEmail(emailtest2);

		List<StartComVo> list = startService.selectAll();
		model.addAttribute("StartComVo", list);
	}
	// 수정 - POST
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@RequestParam int sabun, StartVo startVo, 
					RedirectAttributes rttr, Model model, HttpSession session )throws Exception {
		startService.update(startVo);

		return "redirect:/start/select?sabun=" + startVo.getSabun();
	}
	// 삭제 - GET
	@RequestMapping(value="/sabunDelete")
	public String sabunDelete(@RequestParam("sabun")int sabun)throws Exception {
		startService.sabunDelete(sabun);

		return "redirect:/start/select";
	}
	// 삭제 - POST
	@RequestMapping(value="/sabunDelete", method=RequestMethod.POST)
	public String sabunDelete(@RequestParam("sabun")int sabun, Model model)throws Exception {
		startService.sabunDelete(sabun);

		return "redirect:/start/select";
	}

}