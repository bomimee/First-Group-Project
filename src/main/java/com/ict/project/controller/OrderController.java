package com.ict.project.controller;


import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ict.project.common.CartItems;
import com.ict.project.dao.AddressListVO;
import com.ict.project.dao.MemberVO;
import com.ict.project.dao.OrderListVO;
import com.ict.project.dao.OrderVO;
import com.ict.project.service.OrderService;


@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("pro_checkout.do")
    public ModelAndView getOrders(HttpSession session ) throws Exception {
        ModelAndView mv = new ModelAndView();
        MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
        String member_idx = (String) session.getAttribute("member_idx");
        
        if (memberUser != null) {
        	List<CartItems> cartItemsList = (List<CartItems>) session.getAttribute("cartItemsList");
        	List<AddressListVO> addr_list = orderService.getAddrList(member_idx);
        	String member_points = orderService.getMyPoints(member_idx);
        	DecimalFormat formatter = new DecimalFormat("#,###");
            String formattPoints = formatter.format(Integer.parseInt(member_points));
//        	ObjectMapper objectMapper = new ObjectMapper();
//            String addrListJson = objectMapper.writeValueAsString(addr_list);
            mv.setViewName("js/payment");
            mv.addObject("memberUser", memberUser);
            mv.addObject("member_idx", member_idx);
            mv.addObject("cartItems", cartItemsList);
//            mv.addObject("addrListJson", addrListJson);
            mv.addObject("addr_list", addr_list);
            mv.addObject("member_points", formattPoints);
        } else {
        	session.setAttribute("requestPage", "pro_checkout.do");
            mv.setViewName("redirect:login_Form.do");
        }
        return mv;
    }
	
	@RequestMapping("address_list.do")
	public ModelAndView getAddressList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberUser = (MemberVO) session.getAttribute("memberUser");
		String member_idx = (String) session.getAttribute("member_idx");
		if(memberUser != null) {
			List<AddressListVO> addr_list = orderService.getAddrList(member_idx);
			mv.setViewName("js/address_list");
			mv.addObject("memberUser", memberUser);
			mv.addObject("member_idx", member_idx);
			mv.addObject("addr_list", addr_list);
			return mv;
		}else {
			session.setAttribute("requestPage", "address_list.do");
            mv.setViewName("redirect:login_Form.do");
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("address_write.do")
	public ModelAndView getAddressWrite(@RequestParam("member_idx")String member_idx) {
		return new ModelAndView("js/address_write");
	}
	
	@RequestMapping("address_write_ok.do")
	public ModelAndView getAddressWriteOK(@RequestParam("member_idx")String member_idx, AddressListVO avo) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:address_list.do");
		
		String phoneNumber = avo.getSend_phone1() + "-" + avo.getSend_phone2() + "-" + avo.getSend_phone3();
		avo.setSend_phone(phoneNumber);
		avo.setMember_idx(member_idx);
		int result = orderService.getAddrWrite(avo);
		if(result > 0) {
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("address_detail.do")
	public ModelAndView getAddressDetail(@RequestParam("address_idx")String address_idx, @RequestParam("member_idx")String member_idx) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		AddressListVO avo = orderService.getAddressDetail(address_idx);
		if(avo != null && member_idx != null) {
			mv.setViewName("js/address_detail");
			mv.addObject("avo", avo);
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("address_update.do")
	public ModelAndView getAddressUpdate(@RequestParam("address_idx")String address_idx, @RequestParam("member_idx")String member_idx) throws Exception {
		ModelAndView mv = new ModelAndView("js/address_update");
		AddressListVO avo = orderService.getAddressDetail(address_idx);
		if(avo != null) {
			mv.addObject("avo", avo);
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("address_update_ok.do")
	public ModelAndView getAddressUpdateOK(@RequestParam("address_idx")String address_idx, @RequestParam("member_idx")String member_idx, AddressListVO avo) throws Exception{
		ModelAndView mv = new ModelAndView();
		String phoneNumber = avo.getSend_phone1() + "-" + avo.getSend_phone2() + "-" + avo.getSend_phone3();
		avo.setSend_phone(phoneNumber);
		avo.setAddress_idx(address_idx);
		
		int result = orderService.getAddressUpdateOK(avo);
		if(result > 0) {
			mv.setViewName("redirect:address_detail.do?address_idx=" + address_idx + "&member_idx=" + member_idx);
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("address_delete_ok.do")
	public ModelAndView getAddressDeleteOK(@RequestParam("address_idx")String address_idx, @RequestParam("member_idx")String member_idx) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = orderService.getAddressDeleteOK(address_idx);
		if(result > 0) {
			mv.setViewName("redirect:address_list.do");
			return mv;
		}
		return new ModelAndView("error");
	}
	
	@RequestMapping("payment_go.do")
	public ModelAndView getPaymentOK(@ModelAttribute("orderForm") OrderListVO orderForm, @RequestParam("member_idx")String member_idx, @RequestParam("send_name")String send_name,
									 @RequestParam("send_addr")String send_addr, @RequestParam("send_addrdetail")String send_addrdetail, @RequestParam("send_postcode")String send_postcode, @RequestParam("send_msg")String send_msg,
									 @RequestParam("send_phone1")String send_phone1, @RequestParam("send_phone2")String send_phone2, @RequestParam("send_phone3")String send_phone3, @RequestParam("member_points")String member_points, 
									 @RequestParam("total_price")String total_price, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String phoneNumber = send_phone1 + "-" + send_phone2 + "-" + send_phone3;
		List<OrderVO> orderItems = orderForm.getOrderItems();
//		System.out.println(orderItems.get(0).getPro_idx());
//		System.out.println(orderItems.get(1).getPro_idx());
		for (OrderVO orderItem : orderItems) {
	        orderItem.setMember_idx(member_idx);
	        orderItem.setSend_name(send_name);
	        orderItem.setSend_addr(send_addr);
	        orderItem.setSend_addrdetail(send_addrdetail);
	        orderItem.setSend_postcode(send_postcode);
	        orderItem.setSend_msg(send_msg);
	        orderItem.setSend_phone(phoneNumber);
	        int quantity = Integer.parseInt(orderItem.getPro_quantity());
	        int oprice = Integer.parseInt(orderItem.getPrice());
	        int totalPrice = quantity * oprice;
	        orderItem.setPrice(Integer.toString(totalPrice));
	    }
		
		List<CartItems> cartItemsList = (List<CartItems>) session.getAttribute("cartItemsList");
		String protype = cartItemsList.get(0).getPvoData().getPro_type();
		
		String memberPointsRe = member_points.replaceAll(",", "");
		String totalPriceRe = total_price.replaceAll(",", "");
		int memberPoints = Integer.parseInt(memberPointsRe);
		int totalPrice = Integer.parseInt(totalPriceRe);
	    int remainPoint = memberPoints - totalPrice;
	    
	    MemberVO mvo = new MemberVO();
	    mvo.setMember_idx(member_idx);
	    mvo.setMember_points(Integer.toString(remainPoint));
	    int orderPoints = orderService.getOrderPoints(mvo);
	    
		int result = orderService.getPaymentOK(orderItems);
		if(result > 0) {
			mv.setViewName("js/payment_ok");
			mv.addObject("member_points", Integer.toString(remainPoint));
			mv.addObject("pro_type", protype);
			return mv;
		}
		return new ModelAndView("error");
	}
}
