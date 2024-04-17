<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>I.C.T</title>
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/public/css/js/header.css">
<script src="${path}/resources/public/js/js/header.js" defer></script>
<script type="text/javascript">
 function search_go(form, pro_name) {
    var searchValue = form.querySelector('.searchbar1').value.trim(); // 검색어 입력 필드에서 값을 가져옴
    if (searchValue !== '') { // 검색어가 비어있지 않은지 확인
        var pro_name = ''; // 상품 타입 변수
        var categoryLinks = document.querySelectorAll('.category-list'); // 카테고리 링크들을 가져옴
        for (var i = 0; i < categoryLinks.length; i++) {
            if (searchValue.toLowerCase().includes(categoryLinks[i].textContent.toLowerCase())) { // 검색어에 카테고리 이름이 포함되어 있는지 확인
                // pro_name = categoryLinks[i].textContent.toLowerCase(); // 상품 타입 설정
                break; // 반복문 종료
            }
        }
        if (pro_name !== '$(pro_name)') { // 상품 타입이 설정되었으면
            var url = "products_1.do?pro_name=" + encodeURIComponent(pro_name); // 상품 타입을 포함한 URL 생성
            location.href = url; // 생성된 URL로 이동
        } else {
            alert("검색된 상품이 없습니다.");
        }
    } else {
        alert("검색어를 입력해주세요.");
    }
} 

</script>

<!-- <script defer src="js 파일 위치"></script> -->
</head>
<body>
	<header id="header">
		<div class="wrapper">
			<p class="title">
				<a href="main.do">I.C.T</a>
			</p>
			<ul class="category">
				<li><a class="category-list" href="products.do?pro_type=ballcap">Ballcap</a></li>
				<li><a class="category-list" href="products.do?pro_type=buckethat">Buckethat</a></li>
				<li><a class="category-list" href="products.do?pro_type=beanie">Beanie</a></li>
				<li><a class="category-list" href="products.do?pro_type=suncap">Suncap</a></li>
			</ul>
			<a href="#" class="hamburger">
				<i class="fa-solid fa-bars"></i>
			</a>
			<form class="item2" onsubmit="return false">
				<input type="text" class="searchbar2" placeholder="&nbsp;&nbsp;검 색">
				<button class="res2">&nbsp;검색</button>
				
			</form>
			<form class="item" method="post" onsubmit="return false">  <!-- onsubmit="return false" -->
				<input type="text" class="searchbar1" placeholder="&nbsp;&nbsp;검 색">
				<button  class="res1" onclick="search_go(this.form, '${pro_name}')">&nbsp;검색</button>
				<a href="#" class="b1 a1"><i class="fa-solid fa-magnifying-glass"></i></a>
<%-- 				<c:choose> --%>
<%--                     <c:when test="${empty sessionScope.cartItemsList}"> --%>
<!--                         <a href="cart.do" class="b2 a1"><i class="fa-solid fa-cart-shopping"></i></a> -->
<%--                     </c:when> --%>
<%--                     <c:otherwise> --%>
                        <a href="cart.do" class="b2 a1"><i class="fa-brands fa-opencart"></i></a>
<%--                     </c:otherwise> --%>
<%--                 </c:choose> --%>
				<a href="my_page.do" class="b3 a1"><i class="fa-regular fa-user"></i></a>
				<c:choose>
                    <c:when test="${empty sessionScope.memberUser}">
                        <a href="loginpage.do" class="b4 a1"><i class="fa-solid fa-toggle-off fa-lg"></i></a>
                    </c:when>
                    <c:otherwise>
                        <a href="loginpage.do" class="b4 a1"><i class="fa-solid fa-toggle-on fa-lg"></i></a>
                    </c:otherwise>
                </c:choose>
			</form>	
		</div>	
	</header>
</body>
</html>