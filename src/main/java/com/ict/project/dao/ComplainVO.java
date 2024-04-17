package com.ict.project.dao;

import org.springframework.web.multipart.MultipartFile;

public class ComplainVO {
	private String  complain_idx, member_idx, complain_cidx, member_name, complain_type, complain_subject, complain_content, complain_comment, complain_groups, complain_lev, complain_step, complain_reg, complain_active, complain_hit, f_name, complain_pwd, old_f_name;

	private MultipartFile file_name;

	public String getComplain_idx() {
		return complain_idx;
	}

	public void setComplain_idx(String complain_idx) {
		this.complain_idx = complain_idx;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public String getComplain_cidx() {
		return complain_cidx;
	}

	public void setComplain_cidx(String complain_cidx) {
		this.complain_cidx = complain_cidx;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getComplain_type() {
		return complain_type;
	}

	public void setComplain_type(String complain_type) {
		this.complain_type = complain_type;
	}

	public String getComplain_subject() {
		return complain_subject;
	}

	public void setComplain_subject(String complain_subject) {
		this.complain_subject = complain_subject;
	}

	public String getComplain_content() {
		return complain_content;
	}

	public void setComplain_content(String complain_content) {
		this.complain_content = complain_content;
	}

	public String getComplain_comment() {
		return complain_comment;
	}

	public void setComplain_comment(String complain_comment) {
		this.complain_comment = complain_comment;
	}

	public String getComplain_groups() {
		return complain_groups;
	}

	public void setComplain_groups(String complain_groups) {
		this.complain_groups = complain_groups;
	}

	public String getComplain_lev() {
		return complain_lev;
	}

	public void setComplain_lev(String complain_lev) {
		this.complain_lev = complain_lev;
	}

	public String getComplain_step() {
		return complain_step;
	}

	public void setComplain_step(String complain_step) {
		this.complain_step = complain_step;
	}

	public String getComplain_reg() {
		return complain_reg;
	}

	public void setComplain_reg(String complain_reg) {
		this.complain_reg = complain_reg;
	}

	public String getComplain_active() {
		return complain_active;
	}

	public void setComplain_active(String complain_active) {
		this.complain_active = complain_active;
	}

	public String getComplain_hit() {
		return complain_hit;
	}

	public void setComplain_hit(String complain_hit) {
		this.complain_hit = complain_hit;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getComplain_pwd() {
		return complain_pwd;
	}

	public void setComplain_pwd(String complain_pwd) {
		this.complain_pwd = complain_pwd;
	}

	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}
	
	
	
	
	

	
	
	
}
