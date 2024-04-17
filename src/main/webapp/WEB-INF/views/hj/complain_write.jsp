<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>불편사항</title>
<%@ include file="../js/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/hj/complain_write.css">
<script type="text/javascript">
	function complain_write_ok(f) {
		f.action="complain_write_ok.do";
		f.submit();
	}
	/* function complain_list(f) {
		f.action="complain_list.do";
		f.submit();
	} */
</script>
</head>
<body>
	<div class="cpwritercontainer">
		<div class="cpwritertitlediv">
			<h3 class="cpwritertitle">COMPLAIN 작성하기</h3>
		</div>	
		<div class="cpwriterwrapper">
			<form method="post" class="cpwriterform" enctype="multipart/form-data">
				<ul class="cpwriterul">
					<li class="cpwriterli">
						<label for="cpwriteritem" class="cpwriteritem1 cpwriteritem3">항목</label>
						<select name="complain_type" class="cpwriteritem">
							<option value="주문/결제">주문/결제</option>
							<option value="상품/배송관련">상품/배송관련</option>
							<option value="고객센터문의">고객센터문의</option>
							<option value="환불처리">환불처리</option>
							<option value="개인정보">개인정보</option>
							<option value="쇼핑몰 정책">쇼핑몰 정책</option>
							<option value="기타문의">기타문의</option>
						</select>
					</li>
					<li class="cpwriterli">
						<label for="cpwriteritem1-1" class="cpwriteritem1 cpwriteritem3">제목</label>
						<input type="text" class="cpwriteritem1-1" name="complain_subject" required>
					</li>
					<li class="cpwriterli2">
						<label for="cpwriteritem1-1" class="cpwriteritem1 cpwriteritem3">첨부파일</label>
						<input type="file" class="cpwriteritem1-2" name="file_name" required>
					</li>
					<li>
						<textarea class="cpwiter" name="complain_content" required></textarea>
<!-- 						<input type="text" class="qawiter" name="qa_content" required> -->
					</li>
				</ul>
				<div class="cpwrite">
					<input type="reset" class="cpwrite1" value="취소">
					<input type="button" class="cpwrite2" value="작성하기" onclick="complain_write_ok(this.form)">
					<!-- <input type="button" value="목록" onclick="complain_list(this.form)">  -->
				</div>
			</form>
		</div>
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>