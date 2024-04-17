 package com.ict.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ProVO getProductDetail(String pro_idx) {
		try {
			return sqlSessionTemplate.selectOne("products.detail", pro_idx);
		} catch (Exception e) {
			  e.printStackTrace();
		}
		return null;
	}
	
	public int addToCart(CartVO cvo) {
		try {
			
			return sqlSessionTemplate.insert("cart.add", cvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public int getUploadReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("review.add",rvo);
	}
	
	public List<ReviewVO> getReviews(String pro_idx) {
		try {
			return sqlSessionTemplate.selectList("review.lists", pro_idx);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<ReviewVO> getAllReviews(String pro_idx) {
		try {
			return sqlSessionTemplate.selectList("review.lists-All", pro_idx);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	public List<ReviewVO> getMyReviews(String member_idx) {
		try {
			return sqlSessionTemplate.selectList("review.myReviewList", member_idx);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	public int getReviewCount(String pro_idx) {
		try {
			return sqlSessionTemplate.selectOne("review.count", pro_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;}
	
	public int getReviewAvg(String pro_idx) {
		try {
			return sqlSessionTemplate.selectOne("review.avg", pro_idx);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public ReviewVO getReviewDetail(String review_idx) {
		
		return sqlSessionTemplate.selectOne("review.detail",review_idx);
	}
	
	public int getUpdateReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("review.update",rvo);
	}
	
	public MemberVO getMemberDetail(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.detail", member_id);
	}
	
	public int getReviewDelete(String review_idx) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("review.delete",review_idx);
	}
}
