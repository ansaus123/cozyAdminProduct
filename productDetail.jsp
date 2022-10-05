<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ include file = "/WEB-INF/views/include/bodyheader.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
#proimg {float: left;
		margin-top:1em;
		width : 598px;
		height : 598px;
		border : 1px solid #F6F6F6;}
body {font-size : 11pt; color: #888888;}
.detaildiv {
		float : right;
		width : 550px;}
		
#padiv {width: 1200px;
		margin: auto;
		}
.procnt{number-align : "right";
width: 40px;
}
a { color : black;}
.minusbtn, .plusbtn {color : #888888;
background-color : white;
border-color:#888888;
cursor: pointer;
margin:0;}
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    margin: 0;
}
#clear {clear : both;}
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>CoZy</title>
</head>
<body><div id = padiv>
<img id = proimg src="/resources/${productDetail.p_file}">
<div class = detaildiv>
<br>
<h3 style ="color : black">${productDetail.p_name}</h3><hr><br>
제품코드 ${productDetail.no} <br><br> 
가격 <span id = "pricespan">${productDetail.price}원 </span><br><br>
배송비 3,000원 (3만원 이상 구매시 무료)<br><br>
상세설명 : <br>${productDetail.text}<br><hr><br>
<div>
<form method = "post" action = "/paysheet" id="payform" name = "payform">
<div class="price">수량 : 
	<span class="count">
	<button type="button" class="minusbtn">&minus;</button>
		<input type="number" id="numberValue" name = "procnt" min = 1 max="999" value = "1" class = "procnt">
	<button type="button" class="plusbtn">&plus;</button>
	</span><br><hr>	
<span class = "totalprice" style ="color : black">합계금액 :</span><br><br> </div>
<input type="hidden" name="no" value="${productDetail.no}">
<input type="hidden" name="p_name" value="${productDetail.p_name}">
<input type="hidden" name="totalprice" id = "totalprice">
<input type="hidden" name="procnt" value=numberValue.value>

<button type="button" class="btn btn-outline-primary" onclick="location.href = '/'">장바구니</button>
<button type="submit" class="btn btn-outline-info" onclick="location.href = 'javascript:goPaySheet()'">바로 구매</button>
<!-- 카카오 api로 교체할 부분 -->
<button type="submit" class="btn btn-outline-warning" onclick="location.href = '/'">카카오 페이</button>

</form>
</div>
</div>
<div id=clear></div>
</body>
<script>
$().ready(function(){
	let price = "${productDetail.price}" * 1;
	let prodPrice = price.toLocaleString('ko-KR');
	$("#pricespan").text(prodPrice + "원");
	if (price < 30000){
		price ="${productDetail.price}" * 1 + 3000;}
	priceComma = price.toLocaleString('ko-KR');
	$("#totalprice").val(price);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	});

$(".plusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity < 999){
		$(".procnt").val(++quantity);
	}
	let price = "${productDetail.price}" * quantity;
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});
$(".minusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity > 1){
		$(".procnt").val(--quantity);
	}
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});
$(".procnt").on("change", function(){
	let quantity = $(this).val();
	if(quantity%1 !=0){
		quantity = Math.floor(quantity);
		$(this).val(quantity);
	}
	if(quantity > 999 || quantity < 0.1){
		alert("수량을 다시 확인해주세요(최대 999개까지 구매 가능합니다.)")
		quantity = 1
		$(this).val(quantity);	
	}
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
});

</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>