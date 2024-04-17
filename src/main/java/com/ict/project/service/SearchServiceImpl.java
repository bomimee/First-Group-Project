package com.ict.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.dao.ProductsDAO;
import com.ict.project.dao.ProductsVO;

@Service
public class SearchServiceImpl implements SearchService{
		
	@Autowired
	private ProductsDAO productsDAO;

	@Override
	public List<ProductsVO> getSearchInsertTypeList(String pro_type) {
		return productsDAO.getProductsTypeList(pro_type);
	}

	@Override
	public List<ProductsVO> getSearchInsertSortList(String sort, String pro_type) {
		return productsDAO.getProductsSortList(sort, pro_type);
	}
	
	
	
	
}
