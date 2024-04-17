<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String today = java.time.LocalDate.now().toString();
    pageContext.setAttribute("today", today);
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>q_a_detail</title>
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/js/q_a_detail.css">
<script src="${path}/resources/public/js/js/q_a_modal.js" defer></script>
<style type="text/css">
	.orderok{
		padding-top: 10.06rem;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		min-height: 80%;
		margin-bottom: 10rem;
	}
	.orderokdiv{
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		width: 100%;
	}
	.orderokdiv2{
		display: flex;
		justify-content: center;
	}
	.maingo, .keepshop{
		padding: 1rem 3rem;
		cursor: pointer;
	}
	.maingo{
		background-color: white;
		color: black;
		border: 1px solid black;
	}
	.keepshop{
		background-color: black;
		color: white;
		border: none;
	}
	.abc{
		margin: 2rem;
	}
</style>
<script type="text/javascript">
	function keep_shoping() {
		location.href="products.do?pro_type=${pro_type}";
	}
	function main_go() {
		location.href="my_lists.do";
	}
	function emptyStorage () {
		localStorage.clear();
	}
	window.addEventListener('load', emptyStorage);
</script>
</head>
<body>
	<div class="orderok">
		<div class="orderokdiv">
			<h2 class="abc">주문이 완료되었습니다.</h2>
			<br>
			<fmt:formatNumber var="member_points" value="${member_points}" pattern="#,###" />
			<h2 class="abc">남은 적립금 : ${member_points }</h2>
			<br>
		</div>	
		<div class="orderokdiv2">
			<input type="button" class="abc keepshop" value="계속 쇼핑하기" onclick="keep_shoping()">
			<input type="button" class="abc maingo" value="전체주문확인" onclick="main_go()">
		</div>	
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>