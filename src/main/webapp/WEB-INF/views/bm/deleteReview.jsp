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
<%@ include file="../js/header.jsp" %>


<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	let pwdchk = "${pwdchk}";
	if (pwdchk == "fail") {
		alert("wrong password");
		return;
	}
})
</script>
<script type="text/javascript">

	function delete_review(f) {

		f.action ="delete_review.do";
		f.submit(); 			 
	}

	
</script>
<link rel="stylesheet" href="${path}/resources/public/css/bm/deleteReview.css">
</head>
<body>
<%@ include file="../js/header.jsp"%>
<%@ include file="../bm/sidebar.jsp"%>
	  <form method="post" >
    <h2 class="heading">password</h2>
          <div class="form-box">
				
					<input type="password" name="pwd" class="pwd">

          <input type="hidden" name="review_idx" value="${review_idx }" >
					<input type="submit" value="삭제"  onclick="delete_review(this.form)" class="btn">
        </div>
   
			</form>
	 <%@ include file="../hj/footer.jsp" %> 	
</body>
</html>