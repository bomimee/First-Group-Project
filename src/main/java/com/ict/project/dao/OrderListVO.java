package com.ict.project.dao;

import java.util.List;

public class OrderListVO {
	private List<OrderVO> orderItems;
	private String member_idx;
	
	public List<OrderVO> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderVO> orderItems) {
		this.orderItems = orderItems;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	
	
}
