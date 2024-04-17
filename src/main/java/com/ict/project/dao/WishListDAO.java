package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishListDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getMyWishList(WishListVO wvo) {
		try {
			return sqlSessionTemplate.insert("wishList.insert_wish_list", wvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public List<WishListVO> getMyWishList(String member_idx) {
		try {
			return sqlSessionTemplate.selectList("wishList.get_wish_list", member_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
	public int getDeleteMyWishList(String member_idx, String pro_idx) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_idx", member_idx);
			map.put("pro_idx", pro_idx);
			return sqlSessionTemplate.delete("wishList.delete_wish_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public int getDeleteMyWishList2(String member2_idx, String pro2_idx) {
		try {
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("member_idx", member2_idx);
			map2.put("pro_idx", pro2_idx);
			return sqlSessionTemplate.delete("wishList.delete_wish_list2", map2);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public WishListVO getMyWishListOne(String member_id) {
		return sqlSessionTemplate.selectOne("wishList.wish_list_detail", member_id);
	}
}
