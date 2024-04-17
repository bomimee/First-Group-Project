<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>footer</title>

<link href="${path}/resources/public/css/hj/footer.css" rel="stylesheet" />
</head>
<body>
	<div class="text_list">
		<div class="text_box">
			<ul class="text_ul">
				<li class="text_li">TEL. 010-1234-5678</li>
				<li class="text_li">ICT14_3@naver.com ADDRESS.</li>
				<li class="text_li">서울특별시 마포구 백범로 23, 3층</li>
			</ul>
		</div>
		<div class="text_box">
			<ul class="text_ul">
				<li class="text_li">COMPANY. I’amCapTop</li>
				<li class="text_li">OWNER. BLCK</li>
				<li class="text_li">Business registration number. 121-19-46932</li>
				<li class="text_li">MAIL-ORDER LICENSE. 2024-서울시 신촌-0143</li>
				<li class="text_li">Copyright ©I’amCapTop All rights reserved.</li>
			</ul>
		</div>
		<div class="text_box">
			<ul class="text_ul text_ul2">
				<li class="text_li"><a href="qa_list.do" class="a_qa">Q/A</a></li>
				<li class="text_li"><a href="complain_list.do" class="a_qa">불편사항</a></li>
				<li class="text_li"><a href="faq.do" class="a_qa">자주묻는질문</a></li>
				<li class="text_li">AGREEMENT</li>
				<li class="text_li">PRIVACY POLICY</li>
			</ul>
			<div class="btn_images">
				<a href="https://www.instagram.com/" class="btn_1"><img src="${path}/resources/img/bt_insta.png"></a> 
				<a href="https://www.facebook.com/?locale=ko_KR" class="btn_1"><img src="${path}/resources/img/facebook.png" style="width: 1.7rem; height: 1.7rem;"></a>
				<a href="https://www.kakaocorp.com/page/service/service/KakaoTalk" class="btn_1"><img src="${path}/resources/img/bt_kakao.png"></a>
			</div>
		</div>
	</div>
</body>
</html>