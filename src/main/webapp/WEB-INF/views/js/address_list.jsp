<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/js/address_list.css">
<script type="text/javascript">
	function addr_insert() {
		location.href="address_write.do?member_idx=${memberUser.member_idx}";
	}
</script>
</head>
<body>
<div class="container">
		 <main class="main">
			<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				<form id="editMyPage">
					 <h2 class="maintitle">배송지 목록</h2>
					 <p></p>
					<table>
						<tbody>
							<c:choose>
								<c:when test="${empty addr_list }">
									<tr>
										<td><h2>배송지 목록이 없습니다.</h2></td>
									</tr>
								</c:when>
								<c:otherwise>
										<tr>
											<th>수령자</th><th>우편번호</th><th>주소</th><th>휴대전화</th>
										</tr>
										<c:forEach var="address" items="${addr_list}">
										    <tr>
										        <td><a href="address_detail.do?member_idx=${member_idx}&address_idx=${address.address_idx}" class="addr_list_a">${address.send_name}</a></td>
										        <td><a href="address_detail.do?member_idx=${member_idx}&address_idx=${address.address_idx}" class="addr_list_a">${address.send_postcode}</a></td>
										        <td><a href="address_detail.do?member_idx=${member_idx}&address_idx=${address.address_idx}" class="addr_list_a">${address.send_addr}, ${address.send_addrdetail}</a></td>
										        <td><a href="address_detail.do?member_idx=${member_idx}&address_idx=${address.address_idx}" class="addr_list_a">${address.send_phone}</a></td>
										    </tr>
										</c:forEach>
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
								<input type="button" id="int1" name="edit" value="추가하기" onclick="addr_insert()">
							</li>
							<li>
								<input type="reset"  id="int2" value="취소">
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