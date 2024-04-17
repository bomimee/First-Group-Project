package com.ict.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.common.Paging;
import com.ict.project.dao.ComplainVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.QAVO;
import com.ict.project.service.ComplainService;

@Controller
public class ComplainController {

	@Autowired
	private ComplainService complainService;

	@Autowired
	private Paging paging;

	@RequestMapping("complain_list.do")
	public ModelAndView getComplainList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
		if (memberUser != null) {
			// 로그인상태이면 q_a_list 이동
			mv.setViewName("hj/complain_list");
		} else {
			// 로그인되어 있지 않다면 로그인 페이지로 리다이렉트 하면서 사용자가 눌렀던 페이지 저장
			// 이후 로그인시 메인페이지가 아니라 해당페이지로 이동
			session.setAttribute("requestPage", "complain_list.do");
			mv.setViewName("redirect:login_Form.do");
			return mv;
		}
		int count = complainService.getTotalCount();
		paging.setTotalRecord(count);

		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage == null || cPage.equals("")) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 오라클에서는 begin, end 구하기
		// mariaDB 에서는 offset 구하기
		// offset = limit * (현재 페이지 -1);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작 블록과 끝블록
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<ComplainVO> complain_list = complainService.getComplainList(paging.getOffset(), paging.getNumPerPage());
//		LocalDate nowDate = LocalDate.now();
//		if (complain_list != null) {
//			for (ComplainVO cpvo : complain_list) {
//				LocalDate qaRegDate = LocalDate.parse(cpvo.getComplain_reg().substring(0, 10));
//				if (qaRegDate.isBefore(nowDate)) {
//					// 현재 날짜보다 과거인 경우
//					mv.addObject("complain_regdate", cpvo.getComplain_reg().substring(0, 10));
//				} else {
//					mv.addObject("complain_regdate", cpvo.getComplain_reg().substring(0, 15));
//				}
				mv.addObject("complain_list", complain_list);
				mv.addObject("paging", paging);
				return mv;
			}

//		}
//		return new ModelAndView("error");
//	}

	@RequestMapping("complain_write.do")
	public ModelAndView getComplainWrite() {
		return new ModelAndView("hj/complain_write");
	}

	@RequestMapping("complain_write_ok.do")
	public ModelAndView getComplainWriteOK(ComplainVO cpvo, HttpSession session, HttpServletRequest request) {
		try {

			ModelAndView mv = new ModelAndView("redirect:complain_list.do");
			// 세션에서 사용자 정보 객체를 가져옴
			MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = cpvo.getFile_name();

			if (memberUser != null) {
				// 로그인되어있는 회원정보를 작성 정보에 사용자의 member_idx로 설정
				cpvo.setMember_idx(memberUser.getMember_idx());

				if (file.isEmpty()) {
					System.out.println("1111");
					cpvo.setF_name("");
				} else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString() + "_" + file.getOriginalFilename();
					cpvo.setF_name(f_name);

					// 이미지 저장
					byte[] in = file.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
				}

				int result = complainService.getComplainInsert(cpvo);
				if (result > 0) {
					return mv;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");

	}

	@RequestMapping("cp_detail.do")
	public ModelAndView getComplainDetail(@ModelAttribute("cPage") String cPage, String complain_idx,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("hj/complain_detail");

		ComplainVO cpvo = complainService.getComplainDetail(complain_idx);
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");

		if (cpvo != null && memberUser != null && cpvo.getMember_idx().equals(memberUser.getMember_idx())) {
			List<ComplainVO> cp_comm_list = complainService.getComplainCommentList(complain_idx);
			
			mv.addObject("cp_comm_list", cp_comm_list);
			mv.addObject("cpvo", cpvo);
			mv.addObject("memberUser", memberUser);
			mv.addObject("member_name", memberUser.getMember_name());
			mv.addObject("cPage", cPage);
			return mv;
		} else {
			mv.addObject("detailMessage", "작성자만 읽기 가능합니다.");
			mv.addObject("cpvo", cpvo);
			return mv;
		}
//		return new ModelAndView("error");
	}

	@RequestMapping("cp_comment_insert.do")
	public ModelAndView getCommentInsert(ComplainVO cpvo, @ModelAttribute("complain_idx") String complain_idx,
			@ModelAttribute("member_idx") String memeber_idx, HttpSession session) {
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");

		if (memberUser != null) {
			cpvo.setMember_idx(memberUser.getMember_idx());
		}

		ComplainVO cpvo2 = complainService.getComplainDetail(cpvo.getComplain_idx());
		int complain_step = Integer.parseInt(cpvo2.getComplain_step());

		complain_step++;

		cpvo.setComplain_step(String.valueOf(complain_step));
		ModelAndView mv = new ModelAndView("redirect:cp_detail.do");

		int result2 = complainService.getCommentInsert(cpvo);
		if (result2 > 0) {
			return mv;
		}
		return new ModelAndView("error");
	}

//	@RequestMapping("login_Form.do")
//	public ModelAndView getLogin() {
//		return new ModelAndView("hu/login_Form");
//	}
	@RequestMapping("cp_down.do")
	public void getGuestBook2Down(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "utf-8");
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);

			File file = new File(new String(path.getBytes(), "utf-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	@RequestMapping("complain_delete_ok.do")
	public ModelAndView getComplainDeleteOK(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("complain_idx") String complain_idx, ComplainVO cpvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		cpvo = complainService.getComplainDetail(complain_idx);

		int result = complainService.getComplainDeleteOK(cpvo);
		if (result > 0) { // 삭제성공
			if (cpvo.getComplain_step().equals("0")) {
				mv.setViewName("redirect:complain_list.do");
			} else { // 댓글 삭제인 경우
				mv.setViewName("redirect:cp_detail.do?complain_idx=" + cpvo.getComplain_cidx()); // 해당원글의 상세페이지로 이동
			}
			return mv;
		}
		return new ModelAndView("error");
	}

	@RequestMapping("complain_update.do")
	public ModelAndView getComplainUpdate(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("complain_idx") String complain_idx) {
		ModelAndView mv = new ModelAndView("hj/complain_update");
		ComplainVO cpvo = complainService.getComplainDetail(complain_idx);
		if (cpvo != null) {
			mv.addObject("cpvo", cpvo);
			return mv;
		}
		return new ModelAndView("error");
	}

	
	
	@RequestMapping("complain_update_ok.do")
	public ModelAndView getComplainUpdateOk(@ModelAttribute("cPage") String cPage, @ModelAttribute("complain_idx") String complain_idx, ComplainVO cpvo, HttpServletRequest request){// 파일 첨부
		ModelAndView mv = new ModelAndView();
		cpvo = complainService.getComplainDetail(complain_idx);
		
		try {
			System.out.println("11");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
			MultipartFile file = cpvo.getFile_name();
			
			if (file.isEmpty()) {// 파일이 비어있으면
				cpvo.setF_name(cpvo.getOld_f_name());
				System.out.println("112");
			} else { // 파일이 비어있지 않다면
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				cpvo.setF_name(f_name);
				///////// DB에 들어갈거 ////////////
				System.out.println("113");
				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
				System.out.println("114");
			}
			
			System.out.println("1");
			int result = complainService.getComplainUpdateOK(cpvo);
//			System.out.println(cpvo.getComplain_idx());
			if (result > 0) {
				System.out.println("2");
			mv.setViewName("redirect:cp_detail.do?complain_idx=" + cpvo.getComplain_idx());
				return mv;
			}
		} catch (Exception e) {
			System.out.println("3");
			System.out.println(e);
		
		}
		System.out.println("4");
		return new ModelAndView("error");
	
	
	}
	

	

	@RequestMapping("cp_update_comment_ok.do")
	public ModelAndView getCommentUpdate(@RequestParam("complain_idx") String complain_idx,
			@RequestParam("complain_cidx") String complain_cidx, ComplainVO cpvo) {
		ModelAndView mv = new ModelAndView();

		int result = complainService.getCommentUpdate(cpvo);
		if (result > 0) {
			mv.setViewName("redirect:cp_detail.do?complain_idx=" + cpvo.getComplain_cidx());
			return mv;
		}
		return new ModelAndView("error");
	}

}
