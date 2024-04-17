<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hu/findUserPwd.css">
</head>
<body>
<main class="main">
			<div class="mainMenu">
				 <h2 class="maintitle">아이디 & 비밀번호 찾기</h2>
				 <form action="email_send_ok.do" id="signup" method="post">
				 	<fieldset id="f1">
				 	<legend>비밀번호 찾기</legend>
					<div class="accountbody">
						<ul>
							<li>
							   <p>회원님의 이메일을 입력해 주세요</p>
							   <input type="email" name="email" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식">					
							</li>
							<li>							
								<p>회원님의 아이디를 입력해 주세요</p>
								<input type="text" name="member_id" title="맴버아이디">							
							</li>
						</ul>
						</div>
						<div class="btn">
							 <input id="btn1" type="submit" value="전송">
						</div>
					 </fieldset>
				</form>
			   
				<form action="id_send_ok.do" id="signup" method="post">
					 <fieldset id="f2">
					 <legend>아이디 찾기</legend>
						<div class="accountbody">
							<ul>
								<li>
								   <p>회원님의 이메일을 입력해 주세요</p>
								   <input type="email" name="email" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">				
								</li>
								<li>							
									<p>회원님의 이름을 입력해 주세요</p>
									<input type="text" name="member_name" title="맴버이름">							
								</li>
							</ul>
						</div>
						<div class="btn">
							 <input id="btn2" type="submit" value="전송">
						</div>
					</fieldset>
				</form>		
			</div>
	</main>
	<%@ include file="../hj/footer.jsp" %>
</body>
</html>