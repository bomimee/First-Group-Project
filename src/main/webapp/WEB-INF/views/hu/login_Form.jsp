<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%@ include file="../js/header.jsp" %>
<script type="text/javascript">
	function sign_up_go(f) {
		f.action ="term_of_use.do";
		f.submit();
	}
	function login_go(f) {
		if(f.member_id.value == ""){
			 alert("아이디를 입력하세요.");
			 f.member_id.focus();
			 return;
		 }
		 if(f.member_pwd.value == ""){
			 alert("패스워드 확인를 입력하세요.");
			 f.member_pwd.focus();
			 return;
		 }
		f.action ="login_go_ok.do";
		f.submit(); 
	}
	function logout_go(f) {
		 f.action ="login_out_ok.do";
		 f.submit(); 
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#res").empty();
		$.ajax({
			url : "kakaoUser2.do",
			method : "post",
			dataType : "text",
			success : function(data) {
				let users = data.split("/");
				$("#res").append(users[1]+ "(" + users[2] + ")" + "님 환영합니다.")
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
	
	
</script>	
<link rel="stylesheet" href="${path}/resources/public/css/hu/login_Form.css">
</head>
<body>
	<div class="login-container">
		<c:choose>
			<c:when test="${memberUser != null }">
				<h2>Member Logout</h2>
				<form method="post">
					<input type="submit" value="Logout"  onclick="logout_go(this.form)">
				</form>
<!-- 				 	<a href="https://kauth.kakao.com/oauth/logout?client_id=4a601447a1662d2919cfc432b342bc38&logout_redirect_uri=http://localhost:8090/kakaologout.do"> -->
<!-- 						로그아웃 -->
<!-- 					</a> -->
			</c:when >
			<c:otherwise>
				<h2>Member Login</h2>
				<form method="post">
				<label for="username">ID 
					<input type="text" name="member_id" required>
				</label><br> 
				<label for="password">PW 
					<input type="password" id="member_pwd" name="member_pwd" required>
				</label>
<!-- 				<label for="password"> -->
<!-- 					<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=4a601447a1662d2919cfc432b342bc38&redirect_uri=http://localhost:8090/kakaologin.do"> -->
<!-- 							<img src="resources/images/kakao_login_large_narrow.png" width="150px"> -->
<!-- 					</a> -->

<!-- 				</label> -->
				<div class="text_chk">
					<div class="ip_chk">
						<a href="find_user_pwd.do">Find User & Password</a>
					</div>
				</div>
					<input type="submit" value="Login"  onclick="login_go(this.form)">
					<input type="submit" value="Sign-up" name="signup" onclick="sign_up_go(this.form)">
			</form>
			</c:otherwise>
		</c:choose>
	</div>
	 <%@ include file="../hj/footer.jsp" %> 	
</body>
</html>