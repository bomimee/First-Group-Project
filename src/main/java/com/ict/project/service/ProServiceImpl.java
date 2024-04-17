package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ict.project.common.Products;
import com.ict.project.dao.CartVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.ProDAO;
import com.ict.project.dao.ProVO;
import com.ict.project.dao.ReviewVO;

@Service
public class ProServiceImpl implements ProService {

	@Autowired
	private ProDAO proDAO;

	@Override
	public ProVO getProductDetail(String pro_idx) {

		return proDAO.getProductDetail(pro_idx);
	}

	@Override
	public String getProductJson() {
		Products products = new Products();
		Gson gson = new Gson();
		String json = gson.toJson(products);
		return json;

	}

	@Override
	public int addTocart(CartVO cvo) {
		// TODO Auto-generated method stub
		return proDAO.addToCart(cvo);
	}

	@Override
	public int getUploadReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return proDAO.getUploadReview(rvo);
	}

	@Override
	public List<ReviewVO> getReviews(String pro_idx) {
		// TODO Auto-generated method stub
		return proDAO.getReviews(pro_idx);
	}

	@Override
	public List<ReviewVO> getAllReviews(String pro_idx) {
		// TODO Auto-generated method stub
		return proDAO.getAllReviews(pro_idx);
	}
	
	@Override
	public List<ReviewVO> getMyReviews(String member_idx) {
		// TODO Auto-generated method stub
		return proDAO.getMyReviews(member_idx);
	}

	@Override
	public int getReviewCount(String pro_idx) {
		// TODO Auto-generated method stub
		return proDAO.getReviewCount(pro_idx);
	}

	@Override
	public int getReviewAvg(String pro_idx) {
		// TODO Auto-generated method stub
		return proDAO.getReviewAvg(pro_idx);
	}

	@Override
	public ReviewVO getReviewDetail(String review_idx) {
	
		return proDAO.getReviewDetail(review_idx);
	}
	@Override
	public int getUpdateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return proDAO.getUpdateReview(rvo);
	}
	@Override
	public MemberVO getMemberDetail(String member_id) {
		// TODO Auto-generated method stub
		return proDAO.getMemberDetail(member_id);
	}
	@Override
	public int getReviewDelete(String review_idx) {
		// TODO Auto-generated method stub
		return proDAO.getReviewDelete(review_idx);
	}
}