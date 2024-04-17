package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.AddressListVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.OrderDAO;
import com.ict.project.dao.OrderListVO;
import com.ict.project.dao.OrderVO;
import com.ict.project.dao.ProductsVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public ProductsVO getCartList(String pro_idx) throws Exception {
		return orderDAO.getCartList(pro_idx);
	}

	@Override
	public List<AddressListVO> getAddrList(String member_idx) throws Exception {
		return orderDAO.getAddrList(member_idx);
	}

	@Override
	public int getAddrWrite(AddressListVO avo) throws Exception {
		return orderDAO.getAddrWrite(avo);
	}

	@Override
	public AddressListVO getAddressDetail(String address_idx) throws Exception{
		return orderDAO.getAddressDetail(address_idx);
	}

	@Override
	public int getAddressUpdateOK(AddressListVO avo) throws Exception{
		return orderDAO.getAddressUpdateOK(avo);
	}

	@Override
	public int getAddressDeleteOK(String address_idx) throws Exception {
		return orderDAO.getAddressDeleteOK(address_idx);
	}

	@Override
	public String getMyPoints(String member_idx) throws Exception {
		return orderDAO.getMyPoints(member_idx);
	}

	@Override
	public int getPaymentOK(List<OrderVO> orderItems) throws Exception {
		return orderDAO.getPaymentOK(orderItems);
	}

	@Override
	public int getOrderPoints(MemberVO mvo) throws Exception {
		return orderDAO.getOrderPoints(mvo);
	}

	@Override
	public List<OrderVO> getDetailOrderLists(String member_idx) {
		return orderDAO.getDetailOrderLists(member_idx);
	}

	@Override
	public int getOrderCompleteLists(String member_idx, String delivery_status) {
		
		return orderDAO.getOrderCompleteLists(member_idx, delivery_status);
	}
}