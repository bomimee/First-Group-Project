package com.ict.project.service;

import java.util.List;

import com.ict.project.dao.CartVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.ReviewVO;

public interface ProService {

	// product detail
	public ProVO getProductDetail(String pro_idx);

	// json 변환
	String getProductJson();

	// add to cart
	public int addTocart(CartVO cvo);

	// review List
	public List<ReviewVO> getReviews(String pro_idx);
	public List<ReviewVO> getAllReviews(String pro_idx);

	public List<ReviewVO> getMyReviews(String member_idx);
	// uploadReview
	public int getUploadReview(ReviewVO rvo);

	public int getReviewCount(String pro_idx);
	
	public int getReviewAvg(String pro_idx);
	
	public ReviewVO getReviewDetail(String review_idx);
	
	public int getUpdateReview(ReviewVO rvo);
	
	public MemberVO getMemberDetail(String member_id);
	
	public int getReviewDelete(String review_idx);
	
}
