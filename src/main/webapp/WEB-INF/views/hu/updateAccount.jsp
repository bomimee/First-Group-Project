<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/public/css/hu/createAccount.css">
<script src="${path}/resources/public/js/hu/daumPostalCode.js" defer></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function update_go_ok(f) {
		
		 if(f.acc_email.value == ""){
			 alert("이메일을 입력하세요.");
			 f.acc_email.focus();
			 return;
		 }
		//(알파벳,숫자)@(알파벳,숫자).(알파벳,숫자)
		 var valid_txt = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
		 if(valid_txt.test(f.acc_email.value)==false){ 
			 alert("이메일 주소가 올바르지 않습니다."); 
			 f.acc_email.focus();
			 return;
		 }
		 
		  if(f.acc_pwd.value == ""){
			 alert("패스워드 확인를 입력하세요.");
			 f.acc_pwd.focus();
			 return;
		 }
		 
		 if(f.acc_pwd_check.value == ""){
			 alert("패스워드 확인를 입력하세요.");
			 f.acc_pwd_check.focus();
			 return;
		 } 
		 
		 if(f.acc_pwd.value != f.acc_pwd_check.value){
			 alert("패스워드 패스워드 확인이 동일하지 않습니다.");
			 f.acc_pwd_check.focus();
			 return;
		 } 
		 
		f.action="update_go_ok.do";
		f.submit();
	}
</script>
</head>
<body>
<main class="main">
			<form id="signup">
				<h2 class="maintitle">내 정보수정</h2>
				<div class="accountbody">
					<ul>
						<li>
							<label for="acc_name">이름</label>
							<input type="text" id="acc_name" name="member_name" value="${up_list.member_name}">
						</li>		
						<li>
							<label for="acc_email">이메일</label>
							<input type="text" id="acc_email" name="member_email" value="${up_list.member_email}">
						</li>
						<li>
							<label for="acc_pwd">비밀번호</label> 
							<input type="password" id="acc_pwd" name="member_pwd" value="${up_list.member_pwd}">
						</li>
						<li>
							<label for="acc_pwd_check">비밀번호 확인</label> 
							<input type="password" id="acc_pwd_check" name="acc_pwd_check">
						</li>
						<li>
							<label for="acc_postalcode">우편번호</label>
							<input type="text" id="sample6_postcode" name="member_postalCode" value="${up_list.member_postalCode}" placeholder="우편번호">
							<input type="button" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</li>
					    <li>
							<label for="acc_postalcode">주소</label>
							<input type="text" id="sample6_address" name="member_addr" value="${up_list.member_addr}" placeholder="주소"><br>
							<input type="text" id="sample6_detailAddress" name="member_detailAddr" value="${up_list.member_detailAddr}" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="member_extraAddr" value="${up_list.member_extraAddr}" placeholder="참고항목">
					    </li>
						<li>
							<label for="acc_tel">전화번호</label>
							<input type="text" id="acc_tel" name="member_phone" value="${up_list.member_phone}" required>
						</li>
					</ul>
				</div>
				<div class="btn">
				<ul>
					<li>
						<input type="button" id="btn1" name ="btn1" value="수정완료" onclick="update_go_ok(this.form)"/>
						<input type="hidden" id="btn1" name ="member_idx" value="${up_list.member_idx}" />
					</li>
					<li>
						<input type="reset"  id="btn2" value="수정취소">
					</li>
				</ul>
			</div>
			</form>
	</main>
	<%@ include file="../hj/footer.jsp"%>
</body>
</html>