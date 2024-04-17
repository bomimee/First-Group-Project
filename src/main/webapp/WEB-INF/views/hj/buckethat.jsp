<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>product_berkethat</title>
<%@ include file="../js/header.jsp"%>
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/public/css/js/products.css">
<script src="${path}/resources/public/js/js/product.js" defer></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#sortSelect').change(function() {
        $('#sortForm').submit();
    });
});
function wishList(pro_idx){
	let thistag = this;
	$.ajax({
		url: "insert_my_wish_list.do",
	    /* data : "pro_idx="+$("#pro_idx").val(),  */
	    data : "pro_idx="+pro_idx,
		method : "post",
		dataType: "text",
		success : function(data){
	 		$(thistag).removeClass(".heart");
			$(thistag).addClass(".heart2"); 
			location.reload();
			
		},
		error:function(){
			alert("읽기 실패");
		}
	});
};
function DeleteWishList(pro_idx){
	let thistag = this;
	$.ajax({
		url: "delete_my_wish_list.do",
	    data : "pro_idx="+pro_idx,
		method : "post",
		dataType: "text",
		success : function(data){
			$(thistag).removeClass(".heart2");
			$(thistag).addClass(".heart"); 
			location.reload();
		},
		error:function(){
			alert("읽기 실패");
		}
	});
};
</script>
</head>
<body>
	<section class="ccontainer">
		<div class="cwrapper">
			<div class="newsslider">
			    <div class="newsslide"><i>회원 가입시 1000000만 포인트 증정!!!!!</i></div>
			    <div class="newsslide"><i>오후 3시 이전 주문시 당일 배송 출발</i></div>
			    <div class="newsslide"><i>매달 백만원 이상 구매시 상품 지급</i></div>
			</div>
			<form action="pro_sort.do" method="get" class="sortform" id="sortForm">
			    <select name="sort" class="sort" id="sortSelect">
			        <option value="basicsort" ${param.sort eq 'basicsort' ? 'selected' : ''}>기&nbsp;&nbsp;본</option>
			        <option value="latest" ${param.sort eq 'latest' ? 'selected' : ''}>최&nbsp;신&nbsp;순</option>
			        <option value="lowPrice" ${param.sort eq 'lowPrice' ? 'selected' : ''}>가격낮은순</option>
			        <option value="highPrice" ${param.sort eq 'highPrice' ? 'selected' : ''}>가격높은순</option>
			        <option value="topRating" ${param.sort eq 'topRating' ? 'selected' : ''}>평점높은순</option>
			        <option value="reviewcount" ${param.sort eq 'reviewcount' ? 'selected' : ''}>리뷰순</option>
			    </select>
			    <input type="hidden" name="pro_type" value="${pro_type}">
			</form>
			<c:forEach var="k" items="${list }">
				<div class="citem">
						 <c:if test="${k.active == 0 }"> 
   							<i class="fa-regular fa-heart heart" onclick="wishList(${k.pro_idx})"></i>
   						 </c:if> 
   						 <c:if test="${k.active == 1 }"> 
    						<i class="fa-solid fa-heart heart2" onclick="DeleteWishList(${k.pro_idx})"></i> 
 						 </c:if> 
						<a href="pro_detail.do?pro_idx=${k.pro_idx}"></a><img src="${path}/resources/img/buckethat/${k.pro_img1 }" class="cimg">
						<div class="ctext">
							<span class="cname">${k.pro_name }</span>
							<span class="cprice">${k.price }</span>
						</div></a>
				</div>
			</c:forEach>
		</div>
	</section>	
<%@ include file="../hj/footer.jsp" %>
	
</body>
</html>