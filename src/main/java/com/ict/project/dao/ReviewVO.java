package com.ict.project.dao;


import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private String review_idx, rating, review_content, review_file, 
	member_idx, pro_idx, review_regdate, member_id, old_filename;
	
	private MultipartFile file;

	
	public String getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(String review_idx) {
		this.review_idx = review_idx;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_file() {
		return review_file;
	}

	public void setReview_file(String review_file) {
		this.review_file = review_file;
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

	public String getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getOld_filename() {
		return old_filename;
	}

	public void setOld_filename(String old_filename) {
		this.old_filename = old_filename;
	}
	
}
