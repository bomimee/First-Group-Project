package com.ict.project.service;

import java.util.List;

import com.ict.project.dao.ProductsVO;

public interface ProductsService {
	
	public List<ProductsVO> getProductsTypeList(String pro_type);
	public List<ProductsVO> getProductsSortList(String sort, String pro_type);
	public List<ProductsVO> getKeyWordList(String pro_name);
}
