<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style type="text/css">
body {font-size : 11pt; color: teal;}
div {margin: 0 auto;}
</style>
</head>
<body>
<div>
<h2>사원정보 입력</h2>
<c:forEach var ="e" items="${productList}">
<a href = "productDetail/${e.no}">${e.no}</a>
</c:forEach>
<p><a href="empInputForm">사원정보 추가</a></p>
</div>
</body>
</html>