package com.cozy.www.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;

	
	@Override
	public List<ProductVO> getList(ProductVO vo) {
		return productDAO.getProductList(vo);
	}
	@Override
	public List<ProductVO> getProductListPage(Paging paging) {
		return productDAO.getProductListPage(paging);
	}
	
	@Override
	public ProductVO adminproductdetail(int no) {
		return productDAO.adminproductdetail(no);
	}
	
	@Override
	public int adminproductinsert(ProductVO vo) {
		return productDAO.adminproductinsert(vo);
	}
	
	@Override
	public int adminproductdelete(int no) {
		return productDAO.adminproductdelete(no);
	}
	
}
