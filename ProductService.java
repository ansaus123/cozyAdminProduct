package com.cozy.www.product;

import java.util.List;

public interface ProductService {
	
	List<ProductVO> getList(ProductVO vo); // 어드민 상품 리스트 
	
	List<ProductVO> getProductListPage(Paging paging); // 어드민 상품 전체 페이징
	
	ProductVO adminproductdetail(int no); // 어드민 상품 1개 정보
	
	public int adminproductinsert(ProductVO vo); // 어드민 상품 등록
	
	public int adminproductdelete(int no);  // 어드민 상품 삭제
	
}
