package com.ict.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.ict.project.dao.CartVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.ReviewVO;
import com.ict.project.service.ProService;

@Controller
public class ProductController {
	@Autowired
	private ProService proService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	// Product

	@RequestMapping("pro_detail.do")
	public ModelAndView getProductDetail(@RequestParam("pro_idx") String pro_idx) {
		ModelAndView mv = new ModelAndView("bm/product-detail");
		ProVO pvo = proService.getProductDetail(pro_idx);
		List<ReviewVO> reviews = proService.getReviews(pro_idx);
		List<ReviewVO> allReviews = proService.getAllReviews(pro_idx);
		int count = proService.getReviewCount(pro_idx);
		int avg = proService.getReviewAvg(pro_idx);
		String star = "\u2605";
		String starRating = star.repeat(avg);
		Gson gson = new Gson();
		String pvoJson = gson.toJson(pvo);
		String reviewJson = gson.toJson(allReviews);
		mv.addObject("pvoJson", pvoJson);
		mv.addObject("pvo", pvo);
		mv.addObject("reviews", reviews);
		mv.addObject("reviewJson", reviewJson);
		mv.addObject("count", count);
		mv.addObject("avg", avg);
		mv.addObject("starRating", starRating);
		return mv;

	}
	
	// cart

	@GetMapping("addtocart.do")
	public ModelAndView getCart(CartVO cvo) {
		ModelAndView mv = new ModelAndView("cart");
		int result = proService.addTocart(cvo);
		if (result > 0) {
			mv.addObject(cvo);
			return mv;
		}
		return mv;
	}
	
	// Review 
	
	
	@GetMapping("review.do")
	public ModelAndView getReview(@RequestParam("pro_idx") String pro_idx, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("bm/review");
		ProVO pvo = proService.getProductDetail(pro_idx);
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String member_idx = (String) session.getAttribute("member_idx");
		mv.addObject("member_id", member_id);
		mv.addObject("member_idx", member_idx);
		mv.addObject("pvo", pvo);

		return mv;
	}
	
	@GetMapping("reviewAll.do")
	public ModelAndView getAllReviews(@RequestParam("pro_idx") String pro_idx) {
		ModelAndView mv = new ModelAndView("bm/more-reviews");
		
		List<ReviewVO> reviews = proService.getAllReviews(pro_idx);
		int count = proService.getReviewCount(pro_idx);
		int avg = proService.getReviewAvg(pro_idx);
		String star = "\u2605";
		String starRating = star.repeat(avg);

		mv.addObject("reviews", reviews);
		mv.addObject("pro_idx", pro_idx);
		mv.addObject("count", count);
		mv.addObject("avg", avg);
		mv.addObject("starRating", starRating);
		return mv;
	}

	@RequestMapping("reviewUp.do")
	public ModelAndView getReviewUpload(HttpServletRequest req, ReviewVO rvo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:myreview.do");
			String path = req.getSession().getServletContext().getRealPath("/resources/upload");
			  System.out.println("업로드 폴더 경로: " + path);
			MultipartFile file = rvo.getFile();
			
			// 파일이 저장될 폴더 객체 생성
	        File uploadFolder = new File(path);

	        // 폴더가 존재하지 않으면 폴더 생성
	        if (!uploadFolder.exists()) {
	            boolean created = uploadFolder.mkdirs();
	            if (!created) {
	                // 폴더 생성 실패 시 처리할 내용
	                System.out.println("폴더 생성에 실패했습니다.");
	            }
	        }
	        
			if (file.isEmpty()) {
				rvo.setReview_file("");

			} else {
				UUID uuid = UUID.randomUUID();
				String filename = uuid.toString() + "_" + file.getOriginalFilename();
				rvo.setReview_file(filename);
	
				// img 저장
				byte[] in = rvo.getFile().getBytes();
				File out = new File(path, filename);
				FileCopyUtils.copy(in, out);
			}

			int res = proService.getUploadReview(rvo);
			if (res > 0) {
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("error");
	}
	

	@RequestMapping("myreview.do")
	public ModelAndView getMyReview(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("bm/myreview");
		HttpSession session = req.getSession();
		String member_idx = (String) session.getAttribute("member_idx");
		List<ReviewVO> reviews = proService.getMyReviews(member_idx);
		List<ProVO> proList = new ArrayList<>();
	
		for (ReviewVO review : reviews) {
			String pro_idx = review.getPro_idx();
			ProVO pvo = proService.getProductDetail(pro_idx);
			proList.add(pvo);
		}

		mv.addObject("reviews", reviews);
		mv.addObject("proList", proList);
		return mv;
	}

	@RequestMapping("modi_review.do")
	public ModelAndView getUpdateReview( @RequestParam("review_idx") String review_idx) {
	
		ModelAndView mv = new ModelAndView("bm/updateReview");
		ReviewVO rvo = proService.getReviewDetail(review_idx);
		String pro_idx = rvo.getPro_idx();
		ProVO pvo = proService.getProductDetail(pro_idx);
		if(rvo != null) {
			
			mv.addObject("rvo", rvo);
			mv.addObject("pvo", pvo);
		}
			
		return mv;
	}
	
	@PostMapping("reviewModiUp.do")
	public ModelAndView getReviewModiUp(HttpServletRequest req, ReviewVO rvo) {
		try {
			ModelAndView mv = new ModelAndView("");
			String path = req.getSession().getServletContext().getRealPath("/resources/upload");
	
			MultipartFile file = rvo.getFile();
			String old_filename = rvo.getOld_filename();
			
			if (file.isEmpty()) {
				rvo.setReview_file(old_filename);

			} else {
				UUID uuid = UUID.randomUUID();
				String filename = uuid.toString() + "_" + file.getOriginalFilename();

				rvo.setReview_file(filename);

				// img 저장
				byte[] in = file.getBytes();
				File out = new File(path, filename);
				FileCopyUtils.copy(in, out);
			}

			int res = proService.getUpdateReview(rvo);
			if (res > 0) {
				mv.setViewName("redirect:myreview.do");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return new ModelAndView("error");
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("deleteConfirm.do")
	public ModelAndView getConfirmDeleteReview(@RequestParam("review_idx") String review_idx) {
		ModelAndView mv = new ModelAndView("bm/deleteReview");	
		mv.addObject("review_idx", review_idx);
		return mv;
	}
	
	@RequestMapping("delete_review.do")
	public ModelAndView getDeleteReview(@RequestParam("pwd") String pwd, @RequestParam("review_idx") String review_idx) {
		ModelAndView mv = new ModelAndView("");		
		ReviewVO rvo = proService.getReviewDetail(review_idx);
		String member_id = rvo.getMember_id();
		MemberVO mvo = proService.getMemberDetail(member_id);
		String memPwd = mvo.getMember_pwd();
		
//		if(!passwordEncoder.matches(pwd, memPwd)) {
//			mv.setViewName("bm/deleteReview");
//			mv.addObject("pwdchk", "fail");
//			mv.addObject("review_idx", review_idx);
//			return mv;
//		}
		
		if(pwd==memPwd) {
			mv.setViewName("bm/deleteReview");
			mv.addObject("pwdchk", "fail");
			mv.addObject("review_idx", review_idx);
			return mv;
		}
		else {
			int res = proService.getReviewDelete(rvo.getReview_idx());
			if(res>0) {
				mv.setViewName("redirect:myreview.do");
				return mv;
			}
		}
		
		 return new ModelAndView("error");
	}
}
