<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hu/deleteAccount.css">
<script type="text/javascript">
	function deleteGoOK(f) {
		f.action="delete_go_ok.do";
		f.submit();
	}
</script>
</head>
<body>
<main class="main">
			<div class="sideMenu">
				<ul>
					<li><a href="get_my_wish_list.do">찜목록</a></li>
					<li><a href="my_info.do">회원정보</a></li>
					<li><a href="my_lists.do">전체주문내역</a></li>
					<li><a href="my_orders.do">구매내역조회</a></li>
					<li><a href="#">배송지관리</a></li>
					<li><a href="my_points.do">적립금</a></li>
				</ul>
			</div>
			<div class="mainMenu">
				 <h2 class="maintitle">회원탈퇴</h2>
				 <form id="signup">
					<div class="accountbody">
						<ul>
							<li>
								<label for="acc_id">아이디</label>
								<input type="text" id="acc_id" name="member_id" required>
							</li>
							<li>
								<label for="acc_pwd">비밀번호</label>
								<input type="password" id="acc_pwd" name="member_pwd" required>
							</li>
						</ul>
					</div>
					<div class="btn">
						<ul>
							<li>
								<input type="button" id="btn1" name="quit" value="탈퇴하기" onclick="deleteGoOK(this.form)">
								<input type="hidden" id="btn1" name="member_idx" value="${member_idx}" >
							</li>
							<li>
								<input type="reset"  id="btn2" value="취소">
							</li>
						</ul>
					</div>
				</form>		
			</div>
	</main>
	<%@ include file="../hj/footer.jsp" %>
</body>
</html>