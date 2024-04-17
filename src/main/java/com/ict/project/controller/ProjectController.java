package com.ict.project.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.ProductsVO;
import com.ict.project.dao.WishListVO;
import com.ict.project.service.ProService;
import com.ict.project.service.ProductsService;
import com.ict.project.service.WishListService;

@Controller
public class ProjectController {

	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private ProService proService;
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	

// 단순 페이지이동 	
	@GetMapping("/")
	public ModelAndView getIndex() {
		return new ModelAndView("hj/mainpage");
	}

	@RequestMapping("main.do")
	public ModelAndView getMain() {
		return new ModelAndView("hj/mainpage");
	}

	@RequestMapping("cart.do")
	public ModelAndView getCart() {
		return new ModelAndView("bm/cart");
	}

	@RequestMapping("faq.do")
	public ModelAndView getFaq() {
		return new ModelAndView("bm/faq");
	}

	@RequestMapping("loginpage.do")
	public ModelAndView getLoginpage() {
		return new ModelAndView("hu/login_Form");
	}
	
	@RequestMapping("loginpage2.do")
	public ModelAndView getLoginpage2() {
		return new ModelAndView("hu/login_Form");
	}
	
	@RequestMapping("products.do")
	public ModelAndView getProducts(@RequestParam("pro_type")String pro_type, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		List<ProductsVO> list = productsService.getProductsTypeList(pro_type);
		ProductsVO pvo = new ProductsVO();
		
		//찜목록 하트 변환
		MemberVO mvo = (MemberVO) session.getAttribute("memberUser");
		if(mvo != null) {
			String member_idx = mvo.getMember_idx();
			List<WishListVO> wlist = wishListService.getMyWishList(member_idx);
			
			if (wlist.size() > 0) {
				for (ProductsVO k : list) { 
					k.setActive("0");
					for (WishListVO w : wlist) {
						if(k.getPro_idx().equals(w.getPro_idx())) {
							k.setActive("1");
						}
						else {
							continue;
						}
					} 
				}
			}else {
				for (ProductsVO k2 : list) { 
					k2.setActive("0");
				}
			}
			if(list != null) {
				mv.setViewName("js/" + pro_type);
				mv.addObject("list", list);
				mv.addObject("pro_type", pro_type);
				mv.addObject("wlist", wlist);
				return mv;
			}
		}else {
			if(list != null) {
				mv.setViewName("js/" + pro_type);
				mv.addObject("list", list);
				mv.addObject("pro_type", pro_type);
				return mv;
			}
			
		}
		
		
		return new ModelAndView("error");
	}
	
	@RequestMapping("checkout.do")
	public ModelAndView getPayment() {
//		ModelAndView mv = new ModelAndView("js/payment");
		return new ModelAndView("js/payment");
	}
	
	@RequestMapping("pro_sort.do")
	public ModelAndView getProductSort(@RequestParam("sort")String sort, @RequestParam("pro_type")String pro_type) {
		ModelAndView mv = new ModelAndView();
			List<ProductsVO> list = productsService.getProductsSortList(sort, pro_type);
			if(list != null) {
				mv.setViewName("js/" + pro_type);
				mv.addObject("list", list);
				mv.addObject("pro_type", pro_type);
				mv.addObject("sort", sort);
				return mv;
			}
		return new ModelAndView("error");
	}
}