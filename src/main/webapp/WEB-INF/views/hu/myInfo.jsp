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
<link rel="stylesheet" href="${path}/resources/public/css/hu/myInfo.css">
<script type="text/javascript">
	function updateAccount(f) {
		f.action="update_go.do";
		f.submit();
	}
	function deleteAccount(f) {
		f.action="delete_go.do";
		f.submit();
	}
</script>
</head>
<body>
<div class="container">
	
		 <main class="main">
				<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				<form id="editMyPage">
					 <h2 class="maintitle">회원정보</h2>
					 <p></p>
					<table>
						<tbody>
							<c:choose>
								<c:when test="${empty my_info}">
									<tr>
										<td><h2>회원 정보가 없습니다.</h2></td>
									</tr>
								</c:when>
								<c:otherwise>
										<tr>
											<th>이름</th>
											<td>${my_info.member_name}</td> 
										</tr>
										<tr>
											<th>생년월일</th>
											<td>${my_info.member_dob}</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>${my_info.member_email}</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>${my_info.member_phone}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												${my_info.member_addr}
												${my_info.member_detailAddr}
												${my_info.member_extraAddr}
												${my_info.member_postalCode}
											</td>
										</tr>
										<tr>
											<th>적립금</th>
											<td>${my_info.member_points }</td>
										</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<!-- <div class="btn">
						<input type="button" id="int1" name="edit" value="수정하기">
						<input type="reset"  id="int2" value="취소">
					</div> -->
					<div class="btn">
						<ul>
							<li>
								<input type="submit" id="int2" name="quit" value=" 탈퇴하기" onclick="deleteAccount(this.form)">
								<input type="hidden" name="member_idx" value="${my_info.member_idx}">
							</li>
							<li>
								<input type="submit" id="int1" name="edit" value="수정하기" onclick="updateAccount(this.form)">
								<input type="hidden" name="member_idx" value="${my_info.member_idx}">
							</li>

						</ul>
					</div>
				</form>
			</div>
	</main>
	<%@ include file="../hj/footer.jsp" %> 
	</div>
</body>
</html>