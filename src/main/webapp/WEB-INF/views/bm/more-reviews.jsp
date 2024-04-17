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
<link href="${path}/resources/public/css/bm/more_reviews.css" rel="stylesheet" />
</head>
<body>
 <div class="review-rating">
 
 <div class="purchase-content purchase-content--4">

    <a href="pro_detail.do?pro_idx=${pro_idx}" class="close"> close </a>
    <div class="review-rating">
      <p class="review-count">상품 만족도 (${count} reviews)</p>
      
      <p class="review-avg">  ${avg}/5.0 ${starRating }</p>

    </div>
    
 
                <div class="review-img-container">     
     <c:forEach var="r" items="${reviews}">
                    <a href="${path}/resources/upload/${r.review_file}" class="user-imgurl">
                        <img src="${path}/resources/upload/${r.review_file}" style="width: 100px" class="user-img">
                    </a>
            </c:forEach>
                </div>

 <c:forEach var="k" items="${reviews}">
                <div class="user-review">
                    <div class="review-header">    
                        <div class="user-info">
                            <c:set var="hiddenId" value="${k.member_id.substring(0, k.member_id.length() - 2)}**" />
                            <span class="user-id">${hiddenId}</span>
                            <span class="user-rate"> 
                                <c:forEach var="i" begin="1" end="${k.rating}">&#9733;</c:forEach>
                            </span>
                        </div>
                        <div class="date">${k.review_regdate.substring(0, 10) }</div>
                    </div>   
                    <div class="review-content">
                       
                        <pre class="review-content">${k.review_content}</pre>
                    </div> 
                </div>  
            </c:forEach>
     
 
 </div>
        
    </div>        
          
</body>
</html>