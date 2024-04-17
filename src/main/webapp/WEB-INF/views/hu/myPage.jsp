<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hu/myPage.css">
<!-- <script>
   
    setTimeout(function() {
        window.location.href = "login_Form.do";
    }, 10000); 
</script> -->
</head>
<body>
	<div class="container">
    <main>
        <section class="section center">
        <div class="main-container">
            <div class="text_inner">
                <div class="text">
                	<a href="get_my_wish_list.do" class="mypagecolor">
	                    <h3 class="text_title">찜목록</h3>
	                    <p class="text_desc"> 관심 상품 목록 확인하기</p>
                    </a>
                </div>
                <div class="text"><a href="my_info.do" class="mypagecolor">
                    <h3 class="text_title">회원정보</h3>
                    <p class="text_desc"> 회원이신 고객님 개인정보를 관리하는 공간입니다.</p></a>
           
                </div>
                <div class="text"><a href="my_lists.do" class="mypagecolor">
                    <h3 class="text_title">전체주문내역</h3>
                    <p class="text_desc">고객님께서 주문하신 상품의 전체 주문내역을 확인하실 수 있습니다.</p></a>
                
                </div>
                <div class="text"><a href="my_orders.do" class="mypagecolor">
                    <h3 class="text_title">구매내역조회</h3>
                    <p class="text_desc">고객님께서 주문하신 현재 상품의 주문내역을 확인하실 수 있습니다.</p></a>
                   
                </div>
                <div class="text"><a href="my_points.do" class="mypagecolor">
                    <h3 class="text_title">적립금</h3>
                    <p class="text_desc">적립금은 상품 구매시 사용 하실 수 있습니다.</p></a>
                  
                </div>
                <div class="text"><a href="myreview.do" class="mypagecolor">
                    <h3 class="text_title">상품 리뷰</h3>
                    <p class="text_desc"> 리뷰 수정/삭제하기</p></a>
                </div>
                <div class="text"><a href="address_list.do" class="mypagecolor">
                    <h3 class="text_title">배송지 관리</h3>
                    <p class="text_desc">배송지 추가/수정/삭제</p></a>
                </div>

            </div>
        </div>
    </section>
    </main>
    	 <%@ include file="../hj/footer.jsp" %>
    </div>
</body>
</html>