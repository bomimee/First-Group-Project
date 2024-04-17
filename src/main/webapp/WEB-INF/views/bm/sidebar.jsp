<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/public/css/bm/sidebar.css">
</head>
<body>
<div class="sideMenu" id="sidebar">
				<ul class="alistul">
					<li><a href="get_my_wish_list.do" class="alist">찜목록</a></li>
					<li><a href="my_info.do" class="alist">회원정보</a></li>
					<li><a href="my_lists.do" class="alist">전체주문내역</a></li>
					<li><a href="my_orders.do" class="alist">구매내역조회</a></li>
					<li><a href="myreview.do" class="alist">내 리뷰</a></li>
					<li><a href="my_points.do" class="alist">적립금</a></li>
					<li><a href="address_list.do" class="alist">배송지관리</a></li>
				</ul>
			</div>
</body>
</html>

 
