package com.ict.project.service;

import java.util.List;

import com.ict.project.dao.WishListVO;

public interface WishListService {

	public int getMyWishList(WishListVO wvo);
	
	public List<WishListVO> getMyWishList(String member_idx);
	
	public int getDeleteMyWishList(String member2_idx, String pro2_idx);
	
	public int getDeleteMyWishList2(String member2_idx, String pro2_idx);
	
	public WishListVO getMyWishListOne(String member_id);
}
