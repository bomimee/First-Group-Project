package com.ict.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.common.Paging;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.QAVO;
import com.ict.project.service.QAService;

@Controller
public class QAController {

	@Autowired
	private QAService qaService;
	@Autowired
	private Paging paging;
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("qa_list.do")
	public ModelAndView getQAList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// MemberController에서 로그인하면서 저장한 세션 이름 memberUser 가져오기
//		Object memberUser = session.getAttribute("memberUser");
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
        if (memberUser != null) {
        	// 로그인상태이면 q_a_list 이동
            mv.setViewName("js/q_a_list");
        } else {
            // 로그인되어 있지 않다면 로그인 페이지로 리다이렉트 하면서 사용자가 눌렀던 페이지 저장
        	// 이후 로그인시 메인페이지가 아니라 해당페이지로 이동
        	session.setAttribute("requestPage", "qa_list.do");
            mv.setViewName("redirect:login_Form.do");
            return mv;
        }
		int count = qaService.getQATotalCount();
		paging.setTotalRecord(count);
		
		// 전체 페이지의 수
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() +1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		// 오라클에서는 begin, end 구하기
		// mariaDB 에서는 offset 구하기
		// offset = limit * (현재 페이지 -1);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() -1));
		
		// 시작 블록과 끝블록
		paging.setBeginBlock((int)((paging.getNowPage() -1) / paging.getPagePerBlock()) * paging.getPagePerBlock() +1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
		
		if(paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<QAVO> qa_list = qaService.getQAList(paging.getOffset(), paging.getNumPerPage());
//		LocalDate nowDate = LocalDate.now();
//		String lastModifiedDate = null; // 마지막 게시글의 작성일자를 저장할 변수 추가

		mv.addObject("qa_list", qa_list);
		mv.addObject("paging", paging);
		return mv;
	}
	
	@RequestMapping("qa_write.do")
	public ModelAndView getQAWrite() {
		return new ModelAndView("js/q_a_write");
	}
	
	@RequestMapping("qa_write_ok.do")
	public ModelAndView getQAWriteOK(QAVO qavo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:qa_list.do");
//		qavo.setQa_pwd(passwordEncoder.encode(qavo.getQa_pwd()));
		// 세션에서 사용자 정보 객체를 가져옴
	    MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
	    if (memberUser != null) {
	    	// 로그인되어있는 회원정보를  작성 정보에 사용자의 member_idx로 설정
	        qavo.setMember_idx(memberUser.getMember_idx());
	        int result = qaService.getQAInsert(qavo);
			if(result > 0) {
				return mv;
			}
	    }
		return new ModelAndView("error");
	}
	
	@RequestMapping("qa_detail.do")
	public ModelAndView getQADetail(@ModelAttribute("cPage")String cPage, String qa_idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("js/q_a_detail");
		
		QAVO qavo = qaService.getQADetail(qa_idx);
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
		
		if(qavo != null && memberUser != null && qavo.getMember_idx().equals(memberUser.getMember_idx())) {
			List<QAVO> qa_comm_list = qaService.getQACommentList(qa_idx);
			
			
			mv.addObject("qa_comm_list", qa_comm_list);
			mv.addObject("qavo", qavo);
			mv.addObject("memberUser", memberUser);
			mv.addObject("member_name", memberUser.getMember_name());
			return mv;
		}else {
			mv.addObject("detailMessage", "작성자만 읽기 가능합니다.");
			mv.addObject("qavo", qavo);
//			mv.addObject("memberUser", memberUser);
//			mv.addObject("member_name", memberUser.getMember_name());
	        return mv;
		}
//		return new ModelAndView("error");
	}
	
	@RequestMapping("login_Form.do")
	public ModelAndView getLogin() {
		return new ModelAndView("hu/login_Form");
	}
	
	@RequestMapping("qa_comment_insert.do")
	public ModelAndView getCommentInsert(QAVO qavo, @ModelAttribute("qa_idx")String qa_idx, @ModelAttribute("member_idx")String member_idx, HttpSession session) {
		MemberVO memberUser = (MemberVO)session.getAttribute("memberUser");
		if (memberUser != null) {
			qavo.setMember_idx(memberUser.getMember_idx());
		}

		QAVO qavo2 = qaService.getQADetail(qavo.getQa_idx());
//		int qa_cidx = Integer.parseInt(qavo2.getQa_cidx());
		int qa_step = Integer.parseInt(qavo2.getQa_step());
//		int qa_lev = Integer.parseInt(qavo2.getQa_lev());
//		
		// step, lev 를 하나씩 올리자
		qa_step++;
		
		// DB 에서 lev 를 업데이트 하자
		// ** groups 이 같은 원글,댓글을 찾아서 기존 데이터의 레벨이 같거나 크면 기존 데이터의 lev 증가
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("c_idx", qa_cidx);
//		map.put("lev", qa_lev);
//		String qa_steps = String.valueOf(qa_step);
//		int result = qaService.getQALevUpdate(map);
//		qavo.setQa_cidx(String.valueOf(qa_cidx));
		qavo.setQa_step(String.valueOf(qa_step));
//		qavo.setQa_lev(String.valueOf(qa_lev));
		ModelAndView mv = new ModelAndView("redirect:qa_detail.do");
		
		int result2 = qaService.getCommentInsert(qavo);
		if(result2 > 0) {
			return mv;
		}
		return new ModelAndView("error");
	}
	
//	@RequestMapping("qa_comment_insert2.do")
//	public ModelAndView getCommentInsert2(QAVO qavo, @ModelAttribute("qa_idx")String qa_idx, @ModelAttribute("member_idx")String member_idx, HttpSession session) {
//		MemberVO memberUser = (MemberVO)session.getAttribute("memberUser");
//		if (memberUser != null) {
//			qavo.setMember_idx(memberUser.getMember_idx());
//		}
//		
//		QAVO qavo2 = qaService.getQADetail(qavo.getQa_idx());
//		int qa_cidx = Integer.parseInt(qavo2.getQa_cidx());
//		int qa_step = Integer.parseInt(qavo2.getQa_step());
//		int qa_lev = Integer.parseInt(qavo2.getQa_lev());
//		
//		// step, lev 를 하나씩 올리자
//		qa_step++;
//		qa_lev++;
//		
//		// DB 에서 lev 를 업데이트 하자
//		// ** groups 이 같은 원글,댓글을 찾아서 기존 데이터의 레벨이 같거나 크면 기존 데이터의 lev 증가
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("qa_cidx", qa_cidx);
//		map.put("qa_lev", qa_lev);
////		String qa_lev = String.valueOf(lev);
//		int result = qaService.getQALevUpdate(map);
//		qavo.setQa_cidx(String.valueOf(qa_cidx));
//		qavo.setQa_step(String.valueOf(qa_step));
//		qavo.setQa_lev(String.valueOf(qa_lev));
//		ModelAndView mv = new ModelAndView("redirect:qa_detail.do");
//		
//		int result2 = qaService.getCommentInsert(qavo);
//		if(result2 > 0) {
//			return mv;
//		}
//		return new ModelAndView("error");
//	}

	
	@RequestMapping("qa_delete_ok.do")
	public ModelAndView getQADeleteOk(@ModelAttribute("cPage")String cPage, @ModelAttribute("qa_idx")String qa_idx, QAVO qavo) {
		ModelAndView mv = new ModelAndView();
		// 원글 삭제 (댓글있는 원글을 그냥 삭제하면 DB 외래키 때문에 오류 발생)
		// 그래서 mapper 에서 active 컬럼의 값을 1로 변경한다.
		qavo = qaService.getQADetail(qa_idx);
		
		int result = qaService.getQADeleteOk(qavo);
		if (result > 0) {
			if (qavo.getQa_step().equals("0")) { // 원글 삭제인 경우
	            mv.setViewName("redirect:qa_list.do");
	        } else { // 댓글 삭제인 경우
	            mv.setViewName("redirect:qa_detail.do?qa_idx=" + qavo.getQa_cidx()); // 해당 원글의 상세 페이지로 이동
	        }
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("qa_update.do")
	public ModelAndView getQAUpdate(@ModelAttribute("cPage")String cPage, @ModelAttribute("qa_idx")String qa_idx) {
		ModelAndView mv = new ModelAndView("js/q_a_update");
		QAVO qavo = qaService.getQADetail(qa_idx);
		if(qavo != null) {
			mv.addObject("qavo", qavo);
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("qa_update_ok.do")
	public ModelAndView getQAUpdateOk(@ModelAttribute("cPage")String cPage, @ModelAttribute("qa_idx")String qa_idx, QAVO qavo) {
		ModelAndView mv = new ModelAndView();
		int result = qaService.getQAUpdateOk(qavo);
		if (result > 0) {
			mv.setViewName("redirect:qa_detail.do?qa_idx=" + qavo.getQa_idx());
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("qa_update_comment_ok.do")
	public ModelAndView getQAUpdateComment(@RequestParam("qa_idx")String qa_idx, @RequestParam("qa_cidx")String qa_cidx, QAVO qavo) {
		ModelAndView mv = new ModelAndView();
		
//		QAVO qavo2 = qaService.getQADetail2(qa_idx);
		
		int result = qaService.getCommentUpdate(qavo);
		if (result > 0) {
			mv.setViewName("redirect:qa_detail.do?qa_idx=" + qavo.getQa_cidx());
			return mv;
		}
		return new ModelAndView("error");
	}
}