<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ include file = "/WEB-INF/views/include/bodyheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>상품 목록</title>

<style>
#pageBox{text-align:center;}
.clear{clear:both;}
table{border:1px; width:700px;}
th {text-align: auto;}
td{text-align: left; align-items: center;}
img{width:100px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var off = document.getElementById('offsetValue').value;
	for (var i = 0; i <5; i++){
		if(parseInt(document.getElementsByClassName('numberPage')[i].text) == off){
			document.getElementsByClassName('numberPage')[i].style.backgroundColor = "#eee";
//			alert(document.getElementsByClassName('numberPage')[i]); //url 그대로 갖고 오네;;
		}
	}
});	
</script>
</head>
<body>
<input type="hidden" id="offsetValue" value="${paging.nowPage }"/>
    <h1>상품 목록</h1>
	
	<table class="table text-center table-hover container">
       <thead>
	    <tr><th>상품번호</th><th>상품이미지</th><th>상품명</th><th>상품카테고리</th><th>상품가격</th><th>등록일</th></tr>
	   </thead>
<c:forEach items="${productList}" var="product">
<tr onClick="location.href='/product/admin/productdetail/${product.no}'"> 
<td>${product.no}</td>
<td><img src="/resources/product/${product.p_file}" alt="${product.p_file}" title="${product.p_file}"/></td>
<td>${product.p_name}</td>
<td>${product.div1}/${product.div2}</td>
<td>${product.price}</td>
<td>${product.date}</td>
</tr>
</c:forEach>
</table>
<br>
<input type='button' onclick="location.href='/product/admin/productinsert';"value="상품등록"/>
<a href="insertBoard.jsp">상품수정</a>
<input type='button' id="del" onclick="location.href='/product/admin/productdelete/${product.no}';"value="상품삭제"/>
<div class="clear"></div>
<div id="pageBox">
	<ul class="pagination">
	<li><a id="fisrtPage" href="./list/1">&lt;</a></li>
	<li><a class="numberPage" href="./list/${5*paging.page+1}">${5*paging.page+1}</a></li>
	<li><a class="numberPage" href="./list/${5*paging.page+2}">${5*paging.page+2}</a></li>
	<li><a class="numberPage" href="./list/${5*paging.page+3}">${5*paging.page+3}</a></li>
	<li><a class="numberPage" href="./list/${5*paging.page+4}">${5*paging.page+4}</a></li>
	<li><a class="numberPage" href="./list/${5*paging.page+5}">${5*paging.page+5}</a></li>
	<li><a id="lastPage" href="./list/${5*paging.page+6}">&gt;</a></li>
	</ul>
</div>
<div class="clear"></div>

</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>