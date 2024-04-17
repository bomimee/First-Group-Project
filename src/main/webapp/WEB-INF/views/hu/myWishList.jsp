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
<link rel="stylesheet" href="${path}/resources/public/css/hu/myWishList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

function DeleteWishList2(pro_idx){
	$.ajax({
		url: "delete_my_wish_list2.do",
	    data : "pro_idx="+pro_idx,
		method : "post",
		dataType: "text",
		success : function(data){
			location.reload();
		},
		error:function(){
			location.reload();
		}
	});
}; 

function name() {
	
}
</script>
</head>
<body>
<div class="container">
		 <main class="main">
			<%@ include file="../bm/sidebar.jsp"%>
			<div class="mainMenu">
				 <h2 class="maintitle">찜목록</h2>
					<table>
						<thead> 
							<tr> 
								<th>상품명</th> 
								<th>가격</th>
								<th>이미지</th>
								<th>삭제</th>    
							</tr> 
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty wish_list}">
									<tr>
										<td colspan="5"><h2>고객님께서 찜하신 목록이 없습니다.</h2>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="k" items="${wish_list}">									
											<tr>
												<td>${k.pro_name}</td> 
												<td>${k.price}</td>															
												<td><a href="pro_detail.do?pro_idx=${k.pro_idx }"><img src="resources/img/${k.pro_type}/${k.pro_img1}" style="width: 50px"></a></td>
										   <form>
												<td><input type="button" value="삭제" id="pro_idx" onclick="DeleteWishList2(${k.pro_idx})"></td>
												<input type="hidden" value="${k.pro_idx}" id="pro_idx"/>
											</tr>
										  </form>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
			</div>
	</main>
	<%@ include file="../hj/footer.jsp"%>
	</div>
</body>
</html>