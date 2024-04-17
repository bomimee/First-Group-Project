package com.ict.project.service;

import java.util.List;

import com.ict.project.dao.AddressListVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.OrderListVO;
import com.ict.project.dao.OrderVO;
import com.ict.project.dao.ProductsVO;

public interface OrderService {
	public ProductsVO getCartList(String pro_idx) throws Exception;
	public List<AddressListVO> getAddrList(String member_idx) throws Exception;
	public int getAddrWrite(AddressListVO avo) throws Exception;
	public AddressListVO getAddressDetail(String address_idx) throws Exception;
	public int getAddressUpdateOK(AddressListVO avo) throws Exception;
	public int getAddressDeleteOK(String address_idx) throws Exception;
	public String getMyPoints(String member_idx) throws Exception;
	public int getPaymentOK(List<OrderVO> orderItems) throws Exception;
	public int getOrderPoints(MemberVO mvo) throws Exception; 
	public List<OrderVO> getDetailOrderLists(String member_idx);
	public int getOrderCompleteLists(String member_idx, String delivery_status);
}
