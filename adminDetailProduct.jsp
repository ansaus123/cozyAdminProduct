<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ include file = "/WEB-INF/views/include/bodyheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>상품정보</title>
<script type="text/javascript">
		function del() {
  		if (confirm(${productDetail.no }+"번 제품을 삭제하시겠습니까?"))
	  	document.list.submit();
 		}
</script>
<style>
</style>
</head>
<body>
<h1>상품상세정보</h1>
		<hr>
	<div id=sangse>
		<div>상품번호: ${productDetail.no}</div>
		<div>상품명: ${productDetail.p_name}</div>
		<div><img src="/resources/product/${productDetail.p_file}"alt="${productDetail.p_file}" title="${productDetail.p_file}"></div>
		<div>1차분류 : ${productDetail.div1}</div>
		<div>2차분류 : ${productDetail.div2}</div>
		<div>상품내용 : ${productDetail.text}</div>
		<div>가 격 : ${productDetail.price}</div>
	</div>

	<button id="detailButton" onclick="location.href='/product/productDetail/${product.no}'">상품수정</button>
	 <input type="button" onclick="del();" value="상품삭제"/>
     <form id="list" name="list" method="post" action="/product/admin/productdelete/${productDetail.no}">
 	 <input type="hidden" name="p_file" value="${productDetail.p_file }">
 	 </form>
 </body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>