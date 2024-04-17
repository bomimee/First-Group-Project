package com.ict.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.dao.ProductsVO;
import com.ict.project.service.ProductsService;

@Controller
public class KeywordController {
	@Autowired
	private ProductsService productsService; 
	
	@RequestMapping("products_1.do")
	public ModelAndView getProducts_1(@RequestParam("pro_name")String pro_name) {
		ModelAndView mv = new ModelAndView();
		List<ProductsVO> list = productsService.getKeyWordList(pro_name);
		mv.addObject("list", list);
		mv.addObject("pro_name", pro_name);
		mv.setViewName("hj/ballcap");
		return mv;
	
		
		
		
		
		//		if(list != null) {
//			mv.setViewName("hj/" + pro_name);
//			mv.addObject("list", list);
////			mv.addObject("pro_name", pro_name);
////			mv.setViewName("hj/ballcap");
//			return mv;
//		}
//		return new ModelAndView("error");
	
	}
	
	
}
