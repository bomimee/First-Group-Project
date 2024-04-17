<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/public/css/bm/myreview.css"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="../js/header.jsp"%>
	<%@ include file="../bm/sidebar.jsp"%>
	<main class="main">
    <div class="heading">
      <h1 class="cart-title"> review </h1>
    </div>
<c:forEach var="p" items="${proList}">
    <div class="myproduct">
        <a href="#" class="review-link">
            <img src="${path}/resources/img/${p.pro_type}/${p.pro_img1}" alt="${p.pro_img1}" class="pro_img1">
            <div class="text-only">
                <span class="pro_name">${p.pro_name}</span>
                <span class="description">${p.description}</span>
            </div>
        </a>

        <!-- Iterate over reviews for the current product -->
        <c:forEach var="r" items="${reviews}">
            <c:if test="${r.pro_idx == p.pro_idx}">
                <div class="myreview-container">
                    <div class="grid-col--1">
                        <p>
                            <c:forEach var="i" begin="1" end="${r.rating}">&#9733;</c:forEach>
                        </p>       
                        <pre class="myreview">${r.review_content}</pre>
                       <c:if test="${not empty r.review_file}">
                            <img src="${path}/resources/upload/${r.review_file}" alt="user-img" class="user-img">
                        </c:if>
                    </div>

                    <div class="grid-col--2">
                        <span class="date">${r.review_regdate.substring(0,10)}</span>
                    </div>

                    <div class="grid-col--3">
                        <a href="modi_review.do?review_idx=${r.review_idx}" class="btn modification">수정</a>
                        <a href="deleteConfirm.do?review_idx=${r.review_idx}" class="btn delete">삭제</a>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</c:forEach>

  
  </main>
  <footer class="footer">
		<%@ include file="../hj/footer.jsp"%>
</footer>
</body>
</html>