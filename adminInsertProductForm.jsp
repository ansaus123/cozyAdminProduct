<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ include file = "/WEB-INF/views/include/bodyheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>상품등록</title>
<style>
.inputArea{text-align:left;}
</style>
<script type="text/javascript">
	function categoryChange(e) {
		var dog = [ "사료", "간식/영양제", "위생용품", "생활용품" ];
		var cat = [ "사료", "간식(캣닢)/영양제", "위생용품", "생활용품" ];
		
		var target = document.getElementById("selectOption2");
		if (e.value == "dog")
			var d = dog;
		else if (e.value == "cat")
			var d = cat;
	
		target.options.length = 0;
		
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
</head><body>
<h1>상품등록</h1><hr>
		<form action="productinsert" method="post" enctype="multipart/form-data">
		
		    <div class="inputArea">
					<label for="p_name">상품명</label>
					<input type="text" name="p_name" />
            </div>
	<div>        
        <label>반려동물</label>
         <span class="span-input">
            <label><input type="radio" name="selectOption1"  onchange="categoryChange(this)" value="dog">&nbsp; 강아지</label>
            <label><input type="radio" name="selectOption1" onchange="categoryChange(this)" value="cat">&nbsp; 고양이</label>
        </span>
        <br>
        <label>용품종류</label>
        <select id="selectOption2">
        <option>용품종류를선택해주세요</option>
        </select>
        <br>
       </div>
            <div class="inputArea">
				<label for="price">상품가격</label> <input type="text" id="price" name="price" />
			</div>
            <div class="inputArea">
				<label for="text">상품소개</label>
				<textarea rows="5" cols="50" id="text" name="text"></textarea>
			</div>
				<div class="inputArea">
				<label for="img">썸네일</label>
				<input type="file" name="img" />
			</div>
				<input type="submit" value="등록"/>
		</form>
		<hr>
		<a href="list">글 목록 가기</a>
	
</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>