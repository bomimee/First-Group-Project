package com.ict.project.controller;

import java.net.http.HttpRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.dao.AddressListVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.OrderListVO;
import com.ict.project.dao.OrderVO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.WishListVO;
import com.ict.project.service.MemberService;
import com.ict.project.service.OrderService;
import com.ict.project.service.ProService;
import com.ict.project.service.ProductsService;
import com.ict.project.service.WishListService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private OrderService orderService;
	
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostMapping("term_of_use.do")
	public ModelAndView getTermOfUse() {
		try {
			ModelAndView mv = new ModelAndView("hu/termsOfUse");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}

	@RequestMapping("create_acc_go.do")
	public ModelAndView getSignUp1() {
		try {
			ModelAndView mv = new ModelAndView("hu/createAccount");
			return mv;

		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}

	@RequestMapping("sign_up_go.do")
	public ModelAndView getSignUp(MemberVO mvo, HttpServletRequest request) {

		try {
			ModelAndView mv = new ModelAndView("hu/login_Form");

			String accId = request.getParameter("acc_id");
			String accName = request.getParameter("acc_name");
			String accBday = request.getParameter("acc_bday");
			String accEmail = request.getParameter("acc_email");
			String accPwd = request.getParameter("acc_pwd");
			
			String sample6_postcode = request.getParameter("sample6_postcode");
			String sample6_address = request.getParameter("sample6_address");
			String sample6_detailAddress = request.getParameter("sample6_detailAddress");
			String sample6_extraAddress = request.getParameter("sample6_extraAddress");
			
			String accTel = request.getParameter("acc_tel");
			String gender = request.getParameter("gender");

			// 鍮꾨쾲 �븫�샇�솕 肄붾뱶
			String accPwd2 = passwordEncoder.encode(accPwd);

			MemberVO vo1 = new MemberVO();
			vo1.setMember_id(accId);
			vo1.setMember_name(accName);
			vo1.setMember_dob(accBday);
			vo1.setMember_email(accEmail);
			vo1.setMember_pwd(accPwd2);
			
			vo1.setMember_postalCode(sample6_postcode);
			vo1.setMember_addr(sample6_address);
			vo1.setMember_detailAddr(sample6_detailAddress);
			vo1.setMember_extraAddr(sample6_extraAddress);
			
			System.out.println(vo1.getMember_addr());
			vo1.setMember_phone(accTel);
			vo1.setMember_gender(gender);

			// �쉶�썝媛��엯�젙蹂� �궫�엯 肄붾뱶
			int result = memberService.getSignUp(vo1);
		
			return mv;

		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	//로그인
	@RequestMapping("login_go_ok.do")
    public ModelAndView getLogInOk(HttpServletRequest request, MemberVO vo ) {
        try {
        	HttpSession session = request.getSession();
        	ModelAndView mv = new ModelAndView();

            MemberVO vo2 = memberService.getLogInOK(vo);
                     
            if(! passwordEncoder.matches(vo.getMember_pwd(), vo2.getMember_pwd())) {
            	mv.setViewName("redirect:login_Form.do");
            	return mv;
            }else {
            	 session.setAttribute("memberUser", vo2); 
                 session.setAttribute("member_id", vo2.getMember_id());
                 session.setAttribute("member_idx", vo2.getMember_idx());
                 
                 if (vo2 != null && vo2.getMember_id() != null) { 
                     session.setAttribute("memberUser", vo2); 
                     session.setAttribute("member_id", vo2.getMember_id());
                     session.setAttribute("member_idx", vo2.getMember_idx());
                     
                     // 요청한 페이지가 있다면 해당 페이지로 리다이렉트, 없으면 메인 페이지로 리다이렉트
                     String requestPage = (String) session.getAttribute("requestPage");
                     if (requestPage != null && !requestPage.isEmpty()) {
                         session.removeAttribute("requestPage"); // 세션에서 요청한 페이지 정보 삭제
                         return new ModelAndView("redirect:" + requestPage);
                     } else {
                         return new ModelAndView("redirect:main.do"); 
                     }
                 } else {
                     return new ModelAndView("redirect:login_Form.do");
                 }
            }
        } catch (Exception e) {
            System.out.println(e);
            return new ModelAndView("error");
        }
	}

	@RequestMapping("my_page.do")
	public ModelAndView getMyPage(HttpSession session) {
		 
		 MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
		 
		// session.setMaxInactiveInterval(10);
		
		 if (memberUser != null) {
			 return new ModelAndView("hu/myPage");
		 }else {
			 //session.setAttribute("requestPage", "my_page.do");
			 return new ModelAndView("redirect:login_Form.do");
		 }
	}
	
	@RequestMapping("my_info.do")
	public ModelAndView getInfo(HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("hu/myInfo");
			 MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
			 String member_idx = mvo.getMember_idx();
			 
			MemberVO my_info = memberService.getMemberDetail(member_idx); 
			mv.addObject("my_info", my_info);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	//전체주문내역
	@RequestMapping("my_lists.do")
	public ModelAndView getMyLists(HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("hu/myLists");
			MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
			String member_idx = memberUser.getMember_idx();

			List<OrderVO> olist =  orderService.getDetailOrderLists(member_idx);
			
			for (OrderVO k : olist) {
	            String dateString = k.getOrderdate();
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            try {
	                Date date = dateFormat.parse(dateString);
	                
	                
	                // 현재 시간 구하기
	                Calendar calendar= Calendar.getInstance();
	                long currentTime = calendar.getTimeInMillis();
	                
	                // 주문 시간 구하기
	                Calendar calendarOrder = Calendar.getInstance();
	                calendarOrder.setTime(date);
	                long orderTime = calendarOrder.getTimeInMillis();
	                
	                // 주문 후 경과 시간 구하기 (밀리초 단위)
	                long timeMillis = currentTime - orderTime;
	                long timeSeconds = timeMillis / 1000; 
	                
	                if(timeSeconds <= (1*24*60*60)) {
	                    k.setDelivery_status("0");                   
	                } else {
	                	k.setDelivery_status("1");
	                	
	                    String delivery_status = k.getDelivery_status();
	                    int result =  orderService.getOrderCompleteLists(member_idx, delivery_status);
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	            }
	        }
					
			System.out.println(olist);
			if(olist != null) {
				mv.addObject("olist", olist);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	
	@RequestMapping("get_my_wish_list.do")
	public ModelAndView getMyWishList(HttpSession session) {
		try {
		ModelAndView mv = new ModelAndView("hu/myWishList");
	
		MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
		String member_idx = mvo.getMember_idx();
		
		List<WishListVO> wish_list = wishListService.getMyWishList(member_idx);
		
			if(wish_list != null) {
				mv.addObject("wish_list", wish_list);
				return mv;
			}
			} catch (Exception e) {
				System.out.println(e);
			}
			return new ModelAndView("error");
	 }

	@RequestMapping("my_orders.do")
	public ModelAndView getMyOrders() {
		try {
			ModelAndView mv = new ModelAndView("hu/myOrders");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("my_points.do")
	public ModelAndView getMyPoints(HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("hu/myPoints");
			MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
			String member_points = mvo.getMember_points();
			mv.addObject("member_points", member_points);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	
	@RequestMapping("update_go.do")
	public ModelAndView getUpdateDetailAccount(String member_idx) {
		System.out.println(member_idx);
		try {
			ModelAndView mv = new ModelAndView("hu/updateAccount");
			MemberVO up_list = memberService.getUpdateDetailAccount(member_idx);
			mv.addObject("up_list", up_list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("update_go_ok.do")
	public ModelAndView getUpdateOKAccount(MemberVO mvo, HttpServletRequest request) {
		try {
			 ModelAndView mv = new ModelAndView();
			 
			 String member_pwd2 = mvo.getMember_pwd(); 
			 String member_pwd = passwordEncoder.encode(member_pwd2);
			 
			 mvo.setMember_pwd(member_pwd);
		
			int result = memberService.getUpdateOKAccount(mvo);
			
			if(result > 0) {
				mv.setViewName("redirect:my_info.do");
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("delete_go.do")
	public ModelAndView getDeleteAccount(String member_idx) {
		try {
			ModelAndView mv = new ModelAndView("hu/deleteAccount");
			mv.addObject("member_idx", member_idx);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("delete_go_ok.do")
	public ModelAndView getDeleteOKAccount(MemberVO mvo, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView();
			
			
			String cwpd = mvo.getMember_pwd();
			
			
			MemberVO mvo2 = memberService.getMemberDetail(mvo.getMember_idx());
			
			String dpwd = mvo2.getMember_pwd();
			
			if(!passwordEncoder.matches(cwpd, dpwd)) {
				mv.setViewName("redirect:my_page.do");
				return mv;
			}else {
				
				int result = memberService.getDeleteOKAccount(mvo.getMember_idx());
				if(result>0) {
					mv.setViewName("redirect:main.do");
					session.removeAttribute("memberUser");
					return mv;
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("login_out_ok.do")
	public ModelAndView getLogOut(HttpSession session) {
		session.removeAttribute("memberUser");
		return new ModelAndView("redirect:main.do");	
	}
}