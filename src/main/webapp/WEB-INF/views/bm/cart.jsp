<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>my cart</title>
<script>
const path = "${path}";
</script>
<script defer src="${path}/resources/public/js/bm/cart.js"></script>
<link href="${path}/resources/public/css/bm/cart.css" rel="stylesheet" />
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const checkoutButton = document.querySelector(".cart-checkout");
    checkoutButton.addEventListener("click", function(event) {
        event.preventDefault(); 
        
	    const request = new XMLHttpRequest();
	    
	    const data = JSON.parse(localStorage.getItem("items"));
	    const jsonData = JSON.stringify(data);
		console.log("cart.jsp");
	    request.open('POST', 'data.do', true);
	    request.setRequestHeader('Content-Type', 'application/json'); 
	    request.send(jsonData);
	
	    // 데이터를 성공적으로 전송한 후에 payment.jsp로 이동
	    request.onreadystatechange = function() {
	        if (request.readyState === XMLHttpRequest.DONE) {
	            if (request.status === 200) {
	                window.location.href = 'pro_checkout.do';
	                console.log("cart.jsp2");
	            } else {
	                console.error("Failed to send data: " + request.status);
	            }
	        }
	    };
	 });
 });
</script>
</head>
<body>
<header>
	<%@ include file="../js/header.jsp"%>
</header>
	<main class="main-cart">

		<div class="heading grid-row--1">
			<h1 class="cart-title">edit/view cart</h1>
		</div>

		<div class="cart-state grid-row--2">
		
		</div>

		<div class="items-total grid-row--3">
			<span class="small-label">subtotal</span>&#8361;<span
				class="subtotal"></span>
		</div>
		<div class="cart-bottom grid-row--4">
			<a href="products.do?pro_type=ballcap" class="cart-keepshopping">keep shopping</a>
			 <button class="cart-checkout" onclick="sendData()">checkout now</button>
		</div>


	</main>
<footer class="footer">
	<%@ include file="../hj/footer.jsp"%>
	</footer>
</body>
</html>