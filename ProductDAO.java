package com.cozy.www.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getProductList(ProductVO vo) {
		return mybatis.selectList("ProductDAO.getProductList",vo);
	}
	public List<ProductVO> getProductListPage(Paging paging) {
		return mybatis.selectList("ProductDAO.getProductListPage",paging);
	}
	public ProductVO adminproductdetail(int no) {
		return mybatis.selectOne("ProductDAO.adminproductdetail", no);
	}
	public int adminproductinsert(ProductVO vo) {
		  return mybatis.insert("ProductDAO.adminproductinsert", vo);
		}
	
	public int adminproductdelete(int no) {
		  return mybatis.insert("ProductDAO.adminproductdelete", no);
		}
	
}
