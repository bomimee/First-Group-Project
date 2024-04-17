package com.ict.project.service;

import java.util.List;

import com.ict.project.dao.ProductsVO;

public interface SearchService {
	
	public List<ProductsVO> getSearchInsertTypeList(String pro_type);
	public List<ProductsVO> getSearchInsertSortList(String sort, String pro_type);
}
