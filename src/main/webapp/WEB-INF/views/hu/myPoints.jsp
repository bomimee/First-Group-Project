<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/public/css/hu/myPoints.css">
</head>
<body>
<div class="container">
		 <main class="main">
			<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				 <h2 class="maintitle">적립금</h2>
					<table>
						<tbody>
							<tr>
								<th>남은 적립금</th>
								<td>${member_points}</td> 
							</tr>
						</tbody>
					</table>
			</div>
	</main>
	<%@ include file="../hj/footer.jsp"%>
	</div>
</body>
</html>