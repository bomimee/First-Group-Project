<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String today = java.time.LocalDate.now().toString();
    pageContext.setAttribute("today", today);
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>payment</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/js/q_a_list.css">
</head>
<script type="text/javascript">
 	function qa_write() {
 		location.href = "qa_write.do";
	}
</script>
<body>
	<div class="qcontainer">
		<div class="qwrapper">
			<h3 class="qtitle">Q & A</h3>
			<ul class="qau">
				<li class="qal q1">NO</li>
				<li class="qal q1">TYPE</li>
				<li class="qal q2">SUBJECT</li>
				<li class="qal q1">NAME</li>
				<li class="qal q1">DATE</li>
			</ul>
			<c:choose>
				<c:when test="${empty qa_list }">
					<ul class="empty_qa_ul"><li>게시물이 존재하지 않습니다.</li></ul>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${qa_list }" varStatus="vs">
						<ul class="qau">
								<c:choose>
									<c:when test="${k.qa_active == 1}">
										<li class="q1"><span class="qa11" style="color: #cacaca">${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index) }</span></li>
										<li class="q1"><span class="qa11" style="color: #cacaca">${k.qa_type }</span></li>
										<li class="q2"><span class="qa11" style="color: #cacaca">삭제된 게시물입니다</span></li>
										<li class="q1"><span class="qa11" style="color: #cacaca">${k.member_name }</span></li>
										<c:choose>
								            <c:when test="${k.qa_regdate.substring(0, 10) == pageContext.getAttribute('today')}">
								                <li class="q1"><span class="qa11" style="color: #cacaca">${k.qa_regdate.substring(0, 16) }</span></li>
								            </c:when>
								            <c:otherwise>
								                <li class="q1"><span class="qa11" style="color: #cacaca">${k.qa_regdate.substring(0, 10) }</span></li>
								            </c:otherwise>
								        </c:choose>
							        </c:when>
									<c:otherwise>
										<li class="q1"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index) }</a></li>
										<li class="q1"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${k.qa_type }</a></li>
										<li class="q2"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${k.qa_subject }</a></li>
										<li class="q1"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${k.member_name }</a></li>
										<c:choose>
								            <c:when test="${k.qa_regdate.substring(0, 10) == pageContext.getAttribute('today')}">
								                <li class="q1"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${k.qa_regdate.substring(0, 16) }</a></li>
								            </c:when>
								            <c:otherwise>
								                <li class="q1"><a href="qa_detail.do?qa_idx=${k.qa_idx}&cPage=${paging.nowPage}" class="qa11">${k.qa_regdate.substring(0, 10) }</a></li>
								            </c:otherwise>
								        </c:choose>
									</c:otherwise>
								</c:choose>
<!-- 							</li> -->
						</ul>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<p class="qwrite">
			<input type="button" class="qwrite1" value="작성하기" onclick="qa_write()"> 
		</p>
		<div class="qwrapper">
			<ul class="qa_paging">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						<li class="qa_disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="qa_list.do?cPage=${paging.beginBlock - paging.pagePerBlock }" class="qa_able">이전으로</a>
						</li>
					</c:otherwise>
				</c:choose>
	
				<!-- 페이지번호들 -->
				<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
					<c:choose>
						<c:when test="${k == paging.nowPage }">
							<li class="nowpagecolor">${k }</li>
						</c:when>
						<c:otherwise>
							<li><a href="qa_list.do?cPage=${k }" class="nowpage">${k }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 이후 버튼 -->
				<c:choose>
					<c:when test="${paging.endBlock >= paging.totalPage }">
						<li class="qa_disable">다음으로</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="qa_list.do?cPage=${paging.beginBlock + paging.pagePerBlock }" class="qa_able">다음으로</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>	
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>