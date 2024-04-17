package com.ict.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductsVO> getProductsTypeList(String pro_type) {
		try {
			return sqlSessionTemplate.selectList("products.list", pro_type);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<ProductsVO> getProductsSortList(String sort, String pro_type) {
		try {
			Map<String, Object> sortMap = new HashMap<String, Object>();
			sortMap.put("sort", sort);
			sortMap.put("pro_type", pro_type);
//			for (Map.Entry<String, Object> entry : sortMap.entrySet()) {
//	            System.out.println(entry.getKey() + ": " + entry.getValue());
//	        }
	        return sqlSessionTemplate.selectList("products.sortlist", sortMap);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	

	public List<ProductsVO> getKeyWordList(String pro_name) {
		try {
			return sqlSessionTemplate.selectList("products.keylist", pro_name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	

	
	
}
