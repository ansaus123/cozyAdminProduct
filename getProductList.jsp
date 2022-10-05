<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ include file = "/WEB-INF/views/include/bodyheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
#productTitle{margin: 36px 0;}
.productBox{border: 1px solid #ccc; padding: 2%; border-radius: 5%;}
.productBox img{width:100%; border-radius: 10%;}
.leftMenu{border-bottom:1px solid #ccc;}
#p_nameBox{margin-top:8px; height:42px; overflow: hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}
#pageBox{text-align:center;}
#detailButton{background-color: white; border:1px solid #ccc; width:50%; height:32px; border-radius: 8px;}
#detailButton:hover{background-color:#eee; color:#333;}
#cartButton{background-color:#A283E5;  border:1px solid #A283E5; width:50%; height:32px; border-radius: 8px; color:white;}
#cartButton:hover{background-color: #953acd;}
.clear{clear:both;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

<div class="col-md-11.5">
	<h2 id="productTitle">전체</h2>
	<c:forEach items="${productList}" var="product">
	<div class="col-md-4 col-sm-6 productBox">
	<img src="/resources/${product.p_file}" alt="${product.p_file}" title="${product.p_file}"/>
	<p id="p_nameBox">${product.p_name}</p>
	<p>${product.price}</p>
	<button id="detailButton" onclick="location.href='/product/productDetail/${product.no}'">자세히 보기</button><button id="cartButton" onclick="location.href='/cart/${product.no}/1'">장바구니</button>
	</div>
	</c:forEach>
	<c:if test="${empty productList }">
		<p>상품이 없습니다.</p>
	</c:if>
	<div class="clear"></div>
	<div id="pageBox">
	<ul class="pagination">
	<li><a id="fisrtPage" href="./1">&lt;</a></li>
	<li><a class="numberPage" href="./${5*paging.page+1}">${5*paging.page+1}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+2}">${5*paging.page+2}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+3}">${5*paging.page+3}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+4}">${5*paging.page+4}</a></li>
	<li><a class="numberPage" href="./${5*paging.page+5}">${5*paging.page+5}</a></li>
	<li><a id="lastPage" href="./${5*paging.page+6}">&gt;</a></li>
	</ul>
	</div>
</div>
<div class="col-md-0.5"></div>
<div class="clear"></div>
<br>

</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>