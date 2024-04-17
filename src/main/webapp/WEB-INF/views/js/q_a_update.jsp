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
	function qa_update_ok(f) {
		f.action="qa_update_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<div class="qawritercontainer">
		<div class="qawritertitlediv">
			<h3 class="qawritertitle">Q & A 수정하기</h3>
		</div>	
		<div class="qawriterwrapper">
			<form method="post" class="qawriterform">
				<ul class="qawriterul">
					<li class="qawriterli">
						<label for="qawriteritem" class="qawriteritem1 qawriteritem3">항목</label>
						<select name="qa_type" class="qawriteritem">
							<option value="주문/결제" ${qavo.qa_type == '주문/결제' ? 'selected' : ''}>주문/결제</option>
							<option value="취소/환불" ${qavo.qa_type == '취소/환불' ? 'selected' : ''}>취소/환불</option>
							<option value="출고/배송" ${qavo.qa_type == '출고/배송' ? 'selected' : ''}>출고/배송</option>
							<option value="반품/교환" ${qavo.qa_type == '반품/교환' ? 'selected' : ''}>반품/교환</option>
							<option value="재입고문의" ${qavo.qa_type == '재입고문의' ? 'selected' : ''}>재입고문의</option>
							<option value="제품문의" ${qavo.qa_type == '제품문의' ? 'selected' : ''}>제품문의</option>
							<option value="기타문의" ${qavo.qa_type == '기타문의' ? 'selected' : ''}>기타문의</option>
						</select>
					</li>
					<li class="qawriterli">
						<label for="qawriteritem1-1" class="qawriteritem1 qawriteritem3">제목</label>
						<input type="text" class="qawriteritem1-1" name="qa_subject" value="${qavo.qa_subject }" required>
					</li>
					<li>
						<textarea class="qawiter" name="qa_content" required>${qavo.qa_content }</textarea>
					</li>
				</ul>
				<div class="qawrite">
					<input type="reset" class="qawrite1" value="취소">
					<input type="button" class="qawrite2" value="수정하기" onclick="qa_update_ok(this.form)"> 
					<input type="hidden" name="qa_idx" value="${qavo.qa_idx }">
					<input type="hidden" name="cPage" value="${cPage }">
				</div>
			</form>
		</div>
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>