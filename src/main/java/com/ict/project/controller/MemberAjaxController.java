package com.ict.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.dao.MemberVO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.WishListVO;
import com.ict.project.service.MemberService;
import com.ict.project.service.ProService;
import com.ict.project.service.WishListService;

@RestController
public class MemberAjaxController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private WishListService wishListService;
	
	//아이디 중복 확인
		@RequestMapping(value="getIdChk.do", produces="text/plain; charset=utf-8")
		@ResponseBody
		public String getIdChk(String m_id) {
			String result = memberService.getIdChk(m_id);
			return result;
		}
		
		@RequestMapping(value="insert_my_wish_list.do", produces="text/plain; charset=utf-8")
		@ResponseBody
		public ModelAndView getInsertMyWishList(String pro_idx, HttpSession session) {
			try {
				ModelAndView mv = new ModelAndView("js/ballcap");
				//System.out.println(pro_idx);
				MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
				ProVO pvo = proService.getProductDetail(pro_idx);
				
				WishListVO wvo = new WishListVO();
				
				wvo.setMember_idx(mvo.getMember_idx());
				wvo.setPro_idx(pvo.getPro_idx());
				wvo.setPro_name(pvo.getPro_name());
				wvo.setPrice(pvo.getPrice());
				wvo.setPro_img1(pvo.getPro_img1());
				wvo.setPro_type(pvo.getPro_type());
				
								
				int result = wishListService.getMyWishList(wvo);
				
				System.out.println(result);
				if(result > 0) {
					return mv;
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return new ModelAndView("error");
		}
		
		@RequestMapping(value="delete_my_wish_list.do", produces="text/plain; charset=utf-8")
		@ResponseBody
		public ModelAndView getDeleteMyWishList(String pro_idx, HttpSession session) {
			System.out.println("1");
			try {
				ModelAndView mv = new ModelAndView("js/ballcap");
				MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
				
				String member_idx = mvo.getMember_idx();
				
				ProVO pvo = proService.getProductDetail(pro_idx);
				String pro_idx1 = pvo.getPro_idx();
				
				int result = wishListService.getDeleteMyWishList(member_idx, pro_idx1);
				
				if(result > 0) {
					return mv;
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return new ModelAndView("error");
		}
		
		@RequestMapping(value="delete_my_wish_list2.do", produces="text/plain; charset=utf-8")
		@ResponseBody
		public ModelAndView getDeleteMyWishList2(String pro_idx, HttpSession session) {
			//redirect:get_my_wish_list.do
			try {
				ModelAndView mv = new ModelAndView();
				MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
				
				String member2_idx = mvo.getMember_idx();
				
				ProVO pvo = proService.getProductDetail(pro_idx);
				String pro2_idx = pvo.getPro_idx();
				
				int result = wishListService.getDeleteMyWishList2(member2_idx, pro2_idx);
				
				if(result > 0) {
					return mv;
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return new ModelAndView("error");
		}
}