package com.ict.project.common;

import com.ict.project.dao.ProductsVO;

public class CartItems {
	private String idx, price, pro_size;
	private ProductsVO pvoData;
    private int[] size;

	    
public String getPro_size() {
	return pro_size;
}

public void setPro_size(String pro_size) {
	this.pro_size = pro_size;
}

public String getIdx() {
	return idx;
}

public void setIdx(String idx) {
	this.idx = idx;
}


public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public ProductsVO getPvoData() {
	return pvoData;
}

public void setPvoData(ProductsVO pvoData) {
	this.pvoData = pvoData;
}

public int[] getSize() {
	return size;
}

public void setSize(int[] size) {
	this.size = size;
}


}
