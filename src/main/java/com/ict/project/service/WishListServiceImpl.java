package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.WishListDAO;
import com.ict.project.dao.WishListVO;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private WishListDAO wishListDAO;
	
	@Override
	public int getMyWishList(WishListVO wvo) {
		
		return wishListDAO.getMyWishList(wvo);
	}
	
	@Override
	public List<WishListVO> getMyWishList(String member_idx) {

		return wishListDAO.getMyWishList(member_idx);
	}

	@Override
	public int getDeleteMyWishList(String member_idx, String pro_idx) {
		return wishListDAO.getDeleteMyWishList(member_idx, pro_idx);
	}

	@Override
	public int getDeleteMyWishList2(String member2_idx, String pro2_idx) {
		return wishListDAO.getDeleteMyWishList2(member2_idx, pro2_idx);
	}

	@Override
	public WishListVO getMyWishListOne(String member_id) {
		return wishListDAO.getMyWishListOne(member_id);
	}
}
