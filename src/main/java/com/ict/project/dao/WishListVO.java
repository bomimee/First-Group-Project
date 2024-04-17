package com.ict.project.dao;

public class WishListVO {
	
	private String wishlist_idx, member_idx, pro_idx, pro_name, price, pro_img1, pro_type;

	public String getWishlist_idx() {
		return wishlist_idx;
	}

	public void setWishlist_idx(String wishlist_idx) {
		this.wishlist_idx = wishlist_idx;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public String getPro_idx() {
		return pro_idx;
	}

	public void setPro_idx(String pro_idx) {
		this.pro_idx = pro_idx;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPro_img1() {
		return pro_img1;
	}

	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}
	
	public String getPro_type() {
		return pro_type;
	}

	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
	}
}