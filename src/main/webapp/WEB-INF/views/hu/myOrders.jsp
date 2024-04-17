<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <c:set var="path" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hu/myOrders.css">
</head>
<body>
<div class="container">
		 <main class="main">
			<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				 <h2 class="maintitle">구매내역조회</h2>
					<table>
						<thead> 
							<tr> 
								<th>주문번호</th>
								<th>상품명</th> 
								<th>주문날짜</th> 
								<th>주문가격</th>  
							</tr> 
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty wish_list}">
									<tr>
										<td colspan="5"><h2>고객님께서 구매하신 목록이 없습니다.</h2>
									</tr>
								</c:when>
								<c:otherwise>
								   
								   <!-- 임시로 준 변수들 1.주문번호 2.싱품명, 3. 주문날짜, 4.주문가격  -->
									<c:forEach var="k" items="${list}">
										<tr>
											<td>${k.order_idx}</td> 
											<%-- <td><fmt:formatNumber value="${k.price}" pattern="#,##0"/></td> --%>
											<td>${pro_name}</td>
											<td>${orderdate}</td>
											<td>${price}</td>
												
											<td><img src="resources/img/ballcap/${k.pro_img1}" style="width: 50px"></td>
																					
											<td><button class="btn" onclick="confirmFunction()">구매</button></td>
											<td><button class="btn" onclick="cancelFunction()">삭제</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
			</div>
	</main>
	<%@ include file="../hj/footer.jsp" %>
	</div>
</body>
</html>