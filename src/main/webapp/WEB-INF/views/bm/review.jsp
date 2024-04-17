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
		f.action = "reviewUp.do";
		f.submit();
	}
	const handleCancel = function(f) {
		f.action = "my_page.do";
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
				<h1 class="title">리뷰작성</h1>
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
					<input
						type="file" class="file file--1" id="file"
						name="file" />
		
				</div>
				

			<textarea name="review_content" class="text" min="15
				placeholder="최소 15자 이상 작성해주세요"></textarea>

			<p class="lightgray-text">이미지 리뷰는 상품이 노출된 사진이 1장 이상 포함되어야 합니다.</p>
<input type="hidden" name="pro_idx" value="${pvo.pro_idx}" />
	<input type="hidden" name="member_id" value="${member_id }">
				<input type="hidden" name="member_idx" value="${member_idx }">
			<button class="button-black" onclick="handleSubmit(this.form)">등록하기</button>
	
	</form>

</body>
</html>