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
<link rel="stylesheet" href="${path}/resources/public/css/hu/myLists.css">
</head>
<body>
<%@ include file="../js/header.jsp"%>
<div class="container">
		 <main class="main">
			<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				 <h2 class="maintitle">전체주문내역</h2>
					<table>
						<thead> 
							<tr> 
								<th>주문번호</th>
								<th>상품명</th> 
								<th>주문날짜</th> 
								<th>주문가격</th>  
								<th>배송상태</th>  
							</tr> 
						</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty olist}">
										<tr>
											<td colspan="7"><h2 class="olist">전체주문 내역이 없습니다.</h2></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${olist}">
												<tr>
													<c:if test="${k.delivery_status == '1'}">
													</c:if>
													
													<c:if test="${k.delivery_status == '0'}">
													<td>${k.order_idx}</td>
													<td>${k.pro_name}</td>
													<td>${k.orderdate}</td> 
													<td>${k.price}</td>
													    <td>배송중</td>
													</c:if>
												</tr>
											</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
					</table>
			</div>
	</main>
	<footer class="footer">
		<%@ include file="../hj/footer.jsp"%>
</footer>
	</div>
</body>
</html>