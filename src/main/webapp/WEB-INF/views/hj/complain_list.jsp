<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String today = java.time.LocalDate.now().toString();
    pageContext.setAttribute("today", today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../js/header.jsp"%>
<link rel="stylesheet"
	href="${path}/resources/public/css/hj/complain_list.css">
</head>
<script type="text/javascript">
	function cp_write() {
		location.href = "complain_write.do";
	}
</script>
<body>
	<div class="cpcontainer">
		<div class="cpwrapper">
			<h3 class="cptitle">COMPLAIN</h3>
			<ul class="cpu">
				<li class="cpl c1">NO</li>
				<li class="cpl c1">TYPE</li>
				<li class="cpl c2">SUBJECT</li>
				<li class="cpl c1">NAME</li>
				<li class="cpl c1">DATE</li>
			</ul>
			<c:choose>
				<c:when test="${empty complain_list }">
					<ul class="empty_cp_ul">
						<li>게시물이 존재하지 않습니다.</li>
					</ul>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${complain_list }" varStatus="vs">
						<ul class="cpu">
							<c:choose>
								<c:when test="${k.complain_active == 1 }">
									<li class="q1"><span class="qa11" style="color: #cacaca">${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index) }</span></li>
										<li class="q1"><span class="qa11" style="color: #cacaca">${k.complain_type }</span></li>
										<li class="q2"><span class="qa11" style="color: #cacaca">삭제된 게시물입니다</span></li>
										<li class="q1"><span class="qa11" style="color: #cacaca">${k.member_name }</span></li>
										<c:choose>
								            <c:when test="${k.complain_reg.substring(0, 10) == pageContext.getAttribute('today')}">
								                <li class="q1"><span class="qa11" style="color: #cacaca">${k.complain_reg.substring(0, 16) }</span></li>
								            </c:when>
								            <c:otherwise>
								                <li class="q1"><span class="qa11" style="color: #cacaca">${k.complain_reg.substring(0, 10) }</span></li>
								            </c:otherwise>
								        </c:choose>
								</c:when>
								<c:otherwise>
										<li class="q1"><a href="cp_detail.do?complain_idx=${k.complain_idx}&cPage=${paging.nowPage}"class="qa11">${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index) }</a></li>
										<li class="q1"><a href="cp_detail.do?complain_idx=${k.complain_idx}" class="qa11">${k.complain_type }</a></li>
										<li class="q2"><a href="cp_detail.do?complain_idx=${k.complain_idx}" class="qa11">${k.complain_subject }</a></li>
										<li class="q1"><a href="cp_detail.do?complain_idx=${k.complain_idx}" class="qa11">${k.member_name }</a></li>
									<c:choose>
										<c:when test="${k.complain_reg.substring(0, 10) == pageContext.getAttribute('today')}">
								                <li class="q1"><a href="cp_detail.do?complain_idx=${k.complain_idx}&cPage=${paging.nowPage}" class="qa11">${k.complain_reg.substring(0, 16) }</a></li>
								            </c:when>
								            <c:otherwise>
								                <li class="q1"><a href="cp_detail.do?complain_idx=${k.complain_idx}&cPage=${paging.nowPage}" class="qa11">${k.complain_reg.substring(0, 10) }</a></li>
								            </c:otherwise>
									</c:choose>
								
								</c:otherwise>
						
						</c:choose>
						
						
						</ul>
					</c:forEach>
					
				</c:otherwise>
			</c:choose>
		</div>
		<p class="cpwrite">
			<input type="button" class="cpwrite1" value="작성하기"
				onclick="cp_write()">
		</p>
		<div class="cpwrapper">
			<ul class="cp_paging">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						<li class="cp_disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li><a
							href="complain_list.do?cPage=${paging.beginBlock - paging.pagePerBlock }"
							class="cp_able">이전으로</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 페이지번호들 -->
				<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }"
					step="1" var="k">
					<c:choose>
						<c:when test="${k == paging.nowPage }">
							<li class="nowpagecolor">${k }</li>
						</c:when>
						<c:otherwise>
							<li><a href="complain_list.do?cPage=${k }" class="nowpage">${k }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 이후 버튼 -->
				<c:choose>
					<c:when test="${paging.endBlock >= paging.totalPage }">
						<li class="cp_disable">다음으로</li>
					</c:when>
					<c:otherwise>
						<li><a
							href="complain_list.do?cPage=${paging.beginBlock + paging.pagePerBlock }"
							class="cp_able">다음으로</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<%@ include file="../hj/footer.jsp"%>
</body>
</html>