<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script>
	const path = "${path}";
	
	const handleSubmit = function(f) {
		f.action = "reviewModiUp.do";
		f.submit();
	}
	const handleCancel = function(f) {
		f.action = "myreview.do";
		f.submit();
	}
	
	function setRating(rating) {
	   
	    document.getElementById('ratingInput').value = rating;
	}
	

</script>
<script defer src="${path}/resources/public/js/bm/review.js"></script>
<link href="${path}/resources/public/css/bm/review.css" rel="stylesheet" />

</head>
<body>
<form class="container" method="post" enctype="multipart/form-data">
		<div class="review-container">
			<div class="review-header">
				<h1 class="title">리뷰수정</h1>
				<button class="cancel" onclick="handleCancel()"></button>
			
			</div>
			<div class="review-product">
		
				<img src="${path}/resources/img/${pvo.pro_type}/${pvo.pro_img1}" style="width:80px" >
							<span class="product-name">${pvo.pro_name}</span></div>	
			</div>
			<div class="selectStar">
				<div class="q-spans">
					<span class="review-q-black">상품은 어떠셨나요?</span> <span
						class="review-q-gray">별점을 매겨주세요</span>
				</div>
				<div class="stars">
					 <input type="hidden" id="ratingInput" name="rating" value="0">
					<img src="${path}/resources/img/star.png" class="star star--1"
						data-point="1" onclick="setRating(1)" /> 
				
						<img src="${path}/resources/img/star.png"
						class="star star--2" data-point="2" onclick="setRating(2)" /> 
					
						<img src="${path}/resources/img/star.png" class="star star--3"
						data-point="3" onclick="setRating(3)" /> 
				
						<img src="${path}/resources/img/star.png" class="star star--4" data-point="4" onclick="setRating(4)" />
					
						 <img
						src="${path}/resources/img/star.png" class="star star--5"
						data-point="5" onclick="setRating(5)"/>
				</div>
			</div>
			
				<div class="review-file">
				<c:choose>
						<c:when test="${empty rvo.review_file}">
							<input type="file" name="review_file">
							<b>이전파일없음</b>
							<input type="hidden" name="old_filename" value="">						
						</c:when>
		
						<c:otherwise>				
							<input type="file" name="file">
							<span style="font-size:10px; color:#cd5c08;">이전파일있음 ${rvo.review_file}</span>
							<input type="hidden" name="old_filename" value="${rvo.review_file}">				
						</c:otherwise>
					</c:choose>
				</div>
				
			
			<textarea name="review_content" class="text" min="15"> ${rvo.review_content }</textarea>

			<p class="lightgray-text">이미지 리뷰는 상품이 노출된 사진이 1장 이상 포함되어야 합니다.</p>
<input type="hidden" name="pro_idx" value="${pvo.pro_idx}" />
	<input type="hidden" name="review_idx" value="${rvo.review_idx }">
				<input type="hidden" name="member_idx" value="${rvo.member_idx }">
			<button class="button-black" onclick="handleSubmit(this.form)">등록하기</button>
	
	</form>
</body>
</html>