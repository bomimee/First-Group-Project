<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp" %>
<%@ include file="../js/popup.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hj/mainpage.css">

</head>
<body>
	<article class="article_page">
		<div id="product-list">
			<div class="product_main">
				<img alt="" src="${path}/resources/img/s2.png" class="img_main" width="100%" style="max-width: 100%;" >
			</div> 
			<div class="item_1" style="text-align: center; margin: 20px; padding: 30px;"><h2><i>Popular Product</i></h2></div>
			<div class="box">
				<img class="box_2" src="${path}/resources/img/ballcap/cap2-1.jpg" style="width: 25%; border: 1px solid black; border-left: none;">
				<img class="box_2" src="${path}/resources/img/buckethat/bcap2-1.jpg" style="width: 25%; border: 1px solid black; border-left: none;">
				<img class="box_2" src="${path}/resources/img/beanie/ncap1-1.jpg" style="width: 25%; border: 1px solid black; border-left: none;">
				<img class="box_2" src="${path}/resources/img/suncap/scap4-1.jpg" style="width: 25%; border: 1px solid black; border-left: none; border-right: none;">
			</div> 
		</div>
	</article>
	<%@ include file="../hj/footer.jsp" %>
</body>
</html>