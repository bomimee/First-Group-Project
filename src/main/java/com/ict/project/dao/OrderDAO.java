package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ProductsVO getCartList(String pro_idx) throws Exception {
			return sqlSessionTemplate.selectOne("products.getCartList", pro_idx);
	}
	
	public List<AddressListVO> getAddrList(String member_idx) throws Exception {
			return sqlSessionTemplate.selectList("orders.addrList", member_idx);
	}
	
	public int getAddrWrite(AddressListVO avo) throws Exception {
		return sqlSessionTemplate.insert("orders.addrInsert", avo);
	}
	
	public AddressListVO getAddressDetail(String address_idx) throws Exception {
		return sqlSessionTemplate.selectOne("orders.addrDetail", address_idx);
	}
	
	public int getAddressUpdateOK(AddressListVO avo) throws Exception{
		return sqlSessionTemplate.update("orders.addrUpdate", avo);
	}
	
	public int getAddressDeleteOK(String address_idx) throws Exception {
		return sqlSessionTemplate.delete("orders.addrDelete", address_idx);
	}
	
	public String getMyPoints(String member_idx) throws Exception {
		return sqlSessionTemplate.selectOne("orders.myPoints", member_idx);
	}
	
	public int getPaymentOK(List<OrderVO> orderItems) throws Exception {
		return sqlSessionTemplate.insert("orders.ordersInsert", orderItems);
	}
	
	public int getOrderPoints(MemberVO mvo) throws Exception {
		return sqlSessionTemplate.update("orders.member_points", mvo);
	}
	
	public List<OrderVO> getDetailOrderLists(String member_idx) {
		try {
			System.out.println(member_idx);
			return sqlSessionTemplate.selectList("orders.member_detail", member_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
		
	}
	
	public int getOrderCompleteLists(String member_idx, String delivery_status) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_idx", member_idx);
			map.put("delivery_status", delivery_status);
			
			return sqlSessionTemplate.delete("orders.orderDelete" , map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	

}
