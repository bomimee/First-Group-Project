<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>payment</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/js/q_a_write.css">
<script type="text/javascript">
	function qa_write_ok(f) {
		f.action="qa_write_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<div class="qawritercontainer">
		<div class="qawritertitlediv">
			<h3 class="qawritertitle">Q & A 작성하기</h3>
		</div>	
		<div class="qawriterwrapper">
			<form method="post" class="qawriterform">
				<ul class="qawriterul">
					<li class="qawriterli">
						<label for="qawriteritem" class="qawriteritem1 qawriteritem3">항목</label>
						<select name="qa_type" class="qawriteritem">
							<option value="주문/결제">주문/결제</option>
							<option value="취소/환불">취소/환불</option>
							<option value="출고/배송">출고/배송</option>
							<option value="반품/교환">반품/교환</option>
							<option value="재입고문의">재입고문의</option>
							<option value="제품문의">제품문의</option>
							<option value="기타문의">기타문의</option>
						</select>
					</li>
					<li class="qawriterli">
						<label for="qawriteritem1-1" class="qawriteritem1 qawriteritem3">제목</label>
						<input type="text" class="qawriteritem1-1" name="qa_subject" required>
					</li>
					<li>
						<textarea class="qawiter" name="qa_content" required></textarea>
<!-- 						<input type="text" class="qawiter" name="qa_content" required> -->
					</li>
				</ul>
				<div class="qawrite">
					<input type="reset" class="qawrite1" value="취소">
					<input type="button" class="qawrite2" value="작성하기" onclick="qa_write_ok(this.form)"> 
				</div>
			</form>
		</div>
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>