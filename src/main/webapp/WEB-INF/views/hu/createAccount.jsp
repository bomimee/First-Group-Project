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
<%@ include file="../js/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/public/css/hu/createAccount.css">
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="${path}/resources/public/js/hu/myOrders.js"></script>
<script defer src="${path}/resources/public/js/hu/createAccount.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/public/js/hu/daumPostalCode.js" defer></script>
<script type="text/javascript">
	function save1_go(f) {
		if(f.acc_id.value == ""){
			 alert("아이디를 입력하세요.");
			 f.acc_id.focus();
			 return;
		 }
		 
		 if(f.acc_name.value == ""){
			 alert("이름을 입력하세요.");
			 f.acc_name.focus();
			 return;
		 }
		 
		 if(f.acc_bday.value == ""){
			 alert("생일을 입력하세요.");
			 f.acc_bday.focus();
			 return;
		 }
		 
		 if(f.acc_email.value == ""){
			 alert("이메일을 입력하세요.");
			 f.acc_email.focus();
			 return;
		 }
		 
		//(알파벳,숫자)@(알파벳,숫자).(알파벳,숫자)
		 var valid_txt = /[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*/; 
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
		 
		 if(f.sample6_postcode.value == ""){
			 alert("우편번호를 입력하세요.");
			 f.sample6_postcode.focus();
			 return;
		 }
		 
		 if(f.sample6_address.value == ""){
			 alert("주소를 입력하세요.");
			 f.sample6_address.focus();
			 return;
		 }
		 
		 if(f.sample6_detailAddress.value == ""){
			 alert("상세주소를 입력하세요.");
			 f.sample6_detailAddress.focus();
			 return;
		 }

		 if(f.acc_tel.value == ""){
			 alert("전화번호를 입력하세요.");
			 f.acc_tel.focus();
			 return;
		 }
		 
		 var valid_phone = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/; 
		 if(valid_phone.test(f.acc_tel.value)==false){ 
			 alert("핸드폰 번호 형식이 올바르지 않습니다."); 
			 f.acc_tel.focus();
			 return;
		 }
		 
		 if(f.gender.value == ""){
			 alert("성별을 입력하세요.");
			 f.gender.focus();
			 return;
		 }
		f.action="sign_up_go.do";
		f.submit();
	}
</script>
<script type="text/javascript">
//중복확인
$(document).ready(function() {
	$("#acc_id").keyup(function() {
		$.ajax({
			url: "getIdChk.do",
			data : "m_id="+$("#acc_id").val(),
			method : "post", 
			dataType: "text",
			success : function(data) {
				if(data == '1'){
					// 사용가능
					$("#btn1").removeAttr("disabled");
					$("span").text("사용가능");
				}else if(data == '0'){
					// 사용불가능
					$("#btn1").attr("disabled","disabled");
					$("span").text("사용불가");
				}
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
});
</script>

</head>
<body>
	<div class="container">
		<main class="main">
			<form id="signup">
				<h2 class="maintitle">회원가입</h2>
				<div class="accountbody">
					<ul>
						<li>
							<label for="acc_id">아이디<sup>*</sup></label> 
							<input type="text" id="acc_id" name="acc_id" required><br><span>중복여부</span>
						</li>
						<li>
							<label for="acc_name">이름<sup>*</sup></label> 
							<input type="text" id="acc_name" name="acc_name" required>
						</li>
						<li>
							<label for="acc_bday">생년월일<sup>*</sup></label> 
							<input
							type="text" id="acc_bday" name="acc_bday" required>
						</li>
						<li>
							<label for="acc_email">이메일<sup>*</sup></label> 
							<input type="email" id="acc_email" name="acc_email" placeholder="예) ict@naver.com" required>
						</li>
						<li>
							<label for="acc_pwd">비밀번호<sup>*</sup></label> 
							<input type="password" id="acc_pwd" name="acc_pwd" required>
						</li>
						<li>
							<label for="acc_pwd_check">비밀번호 확인<sup>*</sup></label> 
							<input type="password" id="acc_pwd_check" name="acc_pwd_check" required>
						</li>
											
					 	<li><label for="acc_postalcode">우편번호<sup>*</sup></label> 
					 	<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호"> 
					 	<input type="button" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></li>
											
						<li><label for="acc_addr">주소<sup>*</sup></label> 
							<input type="text" id="sample6_address" name="sample6_address" placeholder="주소"><br>
							<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목"> 
						</li>
						
						<li>
						<label for="acc_tel">전화번호</label> 
							<input type="text" id="acc_tel" name="acc_tel" placeholder="예) 010-1111-1004" required>
						</li>
						<li>
							<label for="m_gender">성별<sup>*</sup></label>
							<div class="gender-options">
								<label for="m_gender">남 <input type="radio" id="gender"
									name="gender" value="남" checked>
								</label> <label for="f_gender">여 <input type="radio" id="gender"
									name="gender" value="여">
								</label>
							</div>
						</li>
					</ul>
				</div>
				<div class="btn">
					<ul>
						<li><input type="button" id="btn1" name="btn1" value="저장" onclick="save1_go(this.form)" /></li>
						<li><input type="reset" id="btn2" value="취소"></li>
					</ul>
				</div>
			</form>
		</main>
		<%@ include file="../hj/footer.jsp"%>
</body>
</html>