package com.cozy.www.product;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//---------------------------------------------------------admin
	//상품 전체조회
	@RequestMapping("admin/list")
	public String getList(ProductVO vo, Model model) {
		System.out.println("상품리스트");
		model.addAttribute("productList", productService.getList(vo));
		return "product/adminGetProductList";
	}
		
    // 상품 등록 form
	@RequestMapping(value="admin/productinsert", method = RequestMethod.GET)
    public String insertProductForm(ProductVO vo) {
		System.out.println("상품 등록 폼 실행");
		return "product/adminInsertProductForm";
	}
	
	//상품 등록하기(insert)
	@RequestMapping(value="admin/productinsert", method = RequestMethod.POST)
	public String insert(ProductVO vo,@RequestParam("img") MultipartFile img, Model model, HttpServletRequest request) {
	
		System.out.println("인서트");
		String fileRealName = img.getOriginalFilename();//파일명을 얻어낼 수 있는 메서드
		long size = img.getSize();//파일 사이즈		
	    System.out.println("용량크기(byte) : " + size);
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
	
	
		fileRealName = uuid.toString()+"_"+fileRealName;
		System.out.println("파일명 : " + fileRealName);
	
		String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);
		
	
		File saveFile = new File(absolutePath+"/"+fileRealName);  // 적용 후
		try {img.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} 
		catch (IllegalStateException e) {e.printStackTrace();} 
		catch (IOException e) {e.printStackTrace();}
        vo.setP_file(fileRealName);
        System.out.println(vo);
    	System.out.println(img);
		int result =productService.adminproductinsert(vo);
		System.out.println(result);
		model.addAttribute("productList", productService.getList(vo));
		return "redirect:/product/admin/list";
	}
	
	// 상품상세정보가기 
	 @RequestMapping(value="admin/productdetail/{no}", method = RequestMethod.GET)
    public String productdetail(@PathVariable("no") int no, Model model)  {
		System.out.println("상품 정보");
		model.addAttribute("productDetail", productService.adminproductdetail(no));
		return "product/adminDetailProduct";
	}
	
	 
	// 상품삭제
	@RequestMapping(value="admin/productdelete/{no}", method = RequestMethod.POST)
	public String delete(@PathVariable int no,@RequestParam("p_file") String p_file, ProductVO vo, Model model, HttpServletRequest request) {
		//HttpSession session = request.getSession();
		//vo.setUid((String) session.getAttribute("uid"));
		System.out.println("상품 삭제");
		vo.setNo(no);
	    int result = productService.adminproductdelete(no);
		System.out.println(result);
		String uploadFolder = "/resources/product";
		String absolutePath = request.getSession().getServletContext().getRealPath(uploadFolder);
		File delFile = new File(absolutePath+"/"+p_file); 
		delFile.delete();
		model.addAttribute("productList", productService.getList(vo));
		return "redirect:/product/admin/list";
	}
	
	
	////---------------------------------
	
	// 상품 리스트 페이징
		/*@RequestMapping("admin/list/{div1}/{offset}")
		public String getBoardList(@PathVariable String div1, @PathVariable int offset, Paging paging,  Model model) {
			System.out.println("product/{div1}/{offset} : "+div1+"/"+offset);
			paging.setPage((int)Math.floor((offset/5)));
			paging.setNowPage(offset);
			paging.setOffset(6*(paging.getOffset()-1));
			model.addAttribute("productList", productService.getProductListPage(paging));
			return "product/getProductList";
		}*/
}
