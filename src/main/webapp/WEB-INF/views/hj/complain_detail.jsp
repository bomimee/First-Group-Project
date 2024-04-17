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
<title>complain_detail</title>
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<%@ include file="../js/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/public/css/hj/complain_detail.css">
<script src="${path}/resources/public/js/js/q_a_modal.js" defer></script>
<script type="text/javascript">
	/* function complain_update(f) {
		f.action="complain_update.do";
		f.submit();
	} */
	function complain_list() {
		location.href = "complain_list.do";
	}
	function complain_update(f) {
		f.action = "complain_update.do";
		f.submit();
	}
	function cp_comment_insert(f) {
		f.action="cp_comment_insert.do";
		f.submit();
	}
	
	function complain_delete(f) {
		 setTimeout(function(){
		    let result = confirm("정말 삭제하시겠습니까?");
		    if (result) {
		    	//console.log(f.complain_idx.value);
		    	//return;
		        f.action="complain_delete_ok.do";
		        f.submit();
		    }
		    else{
		    	f.action="cp_detail.do?complain_idx=" + complain_idx;
		    	f.submit();
		    } 
		 }, 200);
		
	}
	function complain_update(f) {
		f.action="complain_update.do";
		f.submit();
	}
	// 수정 폼을 표시하는 함수
    function showupdateform(commentIdx) {
        let updateForm = document.getElementById('updateForm_' + commentIdx);
        if (updateForm.style.display === 'none' || updateForm.style.display === '') {
            updateForm.style.display = 'grid';
        } else {
            updateForm.style.display = 'none';
        }
    }
	function cp_update_comment(f) {
		f.action="cp_update_comment_ok.do";
		f.submit();
		
	}
	
</script>
</head>
<body>
	<div class="cpdetailcontainer">
		<div class="cpdetailtitlediv">
			<h3 class="cpdetailtitle">COMPLAIN 게시글</h3>
		</div>
		<div class="cpdetailwrapper">
			<div class="cpdetaildiv">
				<c:choose>
					<c:when test="${not empty detailMessage}">
						<ul class="cpdetailul">
							<li class="cpdetailli">
								<p class="cpdetailitem1">항목</p>
								<p class="cpdetailitem" style="background-color: lightgray;" >&nbsp;${cpvo.complain_type }</p>
							</li>
							<li class="cpdetailli">
								<p class="cpdetailitem1">이름</p>
								<p class="cpdetailitem">&nbsp;${cpvo.member_name }</p>
							</li>
							<li class="cpdetailli">
								<p class="cpdetailitem1">제목</p>
								<p class="cpdetailitem1-1" id="cpdetailitem1-1">&nbsp;${cpvo.complain_subject }</p>
							</li>
							<li class="detailMsgcontent">
								<p class="cpcontent">${detailMessage}</p>
							</li>
						</ul>
						<div class="cpdetail">
							<div class="cpdetailupdel">
								<input type="hidden" name="complain_idx" value="${cpvo.complain_idx }"> 
								<input type="hidden" name="cPage" value="${cPage }"> 
								<input type="button" class="cpdetail1" value="수정하기" style="display: none;" onclick="complain_update(this.form)">  
								<input type="button" class="cpdetail1" value="삭제하기" style="display: none;" onclick="complain_delete(this.form)">
							</div>
							<div class="cpdetaillist">
								<input type="button" class="cpdetail2" value="목록" onclick="complain_list()">
							</div>
						</div>
					</c:when>
					<c:when test="${empty detailMessage }">
					<form method="post">
						<ul class="cpdetailul">
							<li class="cpdetailli">
								<p class="cpdetailitem1">항목</p>
								<p class="cpdetailitem">&nbsp;${cpvo.complain_type }</p>
							</li>
							<li class="cpdetailli">
								<p class="cpdetailitem1">이름</p>
								<p class="cpdetailitem">&nbsp;${cpvo.member_name }</p>
							</li>
							<li class="cpdetailli">
								<p class="cpdetailitem1">제목</p>
								<p class="cpdetailitem1-1" id="cpdetailitem1-1">&nbsp;${cpvo.complain_subject }</p>
							</li>
							<li class="cpdetailli">
								<p class="cpdetailitem1">첨부파일</p> 
								<c:choose>
									<c:when test="${empty cpvo.f_name }">
										<p>첨부파일 없음</p>
									</c:when>
									<c:otherwise>
										<p class="cpdetailitem1-1" id="cpdetailitem1-1">
										<a href="cp_down.do?f_name=${cpvo.f_name }">
											<%-- &nbsp;${cpvo.f_name } --%>
											<img src="/resources/upload/${cpvo.f_name }" style="width: 100px;"></a>
										</p>
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								<p class="cpcontent">&nbsp;${cpvo.complain_content }</p>
							</li>

						</ul>
						<div class="cpdetail">
							<div class="cpdetailupdel">
								<input type="hidden" name="complain_idx" value="${cpvo.complain_idx }"> 
								<input type="hidden" name="cPage" value="${cPage }"> 
								<input type="button" class="cpdetail1" value="수정하기" onclick="complain_update(this.form)">
								<input type="button" class="cpdetail1" value="삭제하기" onclick="complain_delete(this.form)">
							</div>
							<div class="cpdetaillist">
								<input type="button" class="cpdetail2" value="목록" onclick="complain_list()">
							</div>
						</div>
					</form>
					
					<%-- 댓글 입력 --%>
						<div class="cp_commentdiv">
							<form method="post" class="cp_comment_form">
<%-- 									<p>${member_name }<input type="text" name="writer"></p> --%>
								<textarea class="complain_comment" name="complain_comment"></textarea>
								<input type="button" value="입  력" class="cp_comment_button" onclick="cp_comment_insert(this.form)">
								<!-- 댓글 저장시 어떤 원글의 댓글인지 알아야하니까 원글의 idx 필요 -->
								<input type="hidden" name="complain_idx" value="${cpvo.complain_idx }">
								<input type="hidden" name="member_idx" value="${memberUser.member_idx }">
							</form>
							<%-- 댓글 출력 --%>
							<c:forEach var="k" items="${cp_comm_list }">
								<div class="cp_comment_list">
<%-- 									<c:forEach begin="1" end="${k.qa_step }"><span>&nbsp;<i class="fa-solid fa-arrows-turn-right fa-flip-vertical"></i></span></c:forEach> --%>
									<c:choose>
										<c:when test="${k.complain_active == 1}">
											<div class="cp_comment_formdiv">
												<span class="complain_comment_name" style="color: #cacaca">${member_name } : </span>
												<span class="complain_content_delete" style="color: #cacaca">삭제된 댓글입니다</span>
<%-- 												<span style="color: #cacaca">${k.qa_regdate.substring(0,16) }</span> --%>
												<c:choose>
										            <c:when test="${k.complain_reg.substring(0, 10) == pageContext.getAttribute('today')}">
										               <span style="color: #cacaca">${k.complain_reg.substring(0, 16) }</span>
										            </c:when>
										            <c:otherwise>
										               <span style="color: #cacaca">${k.complain_reg.substring(0, 10) }</span>
										            </c:otherwise>
										        </c:choose>
												<div class="cp_comment_updel"></div>
											</div>
										</c:when>
										<c:otherwise>
											<form method="post" class="cp_comment_formdiv">
												<span class="complain_comment_name">${member_name } : </span>
												<span>${k.complain_comment }</span>
												<c:choose>
										            <c:when test="${k.complain_reg.substring(0, 10) == pageContext.getAttribute('today')}">
										               <span>${k.complain_reg.substring(0, 16) }</span>
										            </c:when>
										            <c:otherwise>
										                <span>${k.complain_reg.substring(0, 10) }</span>
										            </c:otherwise>
										        </c:choose>
												<!-- 실제 삭제 처리는 로그인해서 본인 댓글만 삭제할 수 있어야 한다. -->
												<div class="cp_comment_updel">
													<c:if test="${cpvo.member_idx == memberUser.member_idx }">
														<input type="hidden" name="complain_idx" value="${k.complain_idx }">
<%-- 														<input type="hidden" name="cPage" value="${cPage }"> --%>
														<input type="button" value="수정" class="cp_comment_button2" onclick="showupdateform(${k.complain_idx})">&nbsp;
														<input type="button" value="삭제" class="cp_comment_button2" onclick="complain_delete(this.form)">
													</c:if>
												</div>
											</form>
	<!-- 											<div class="qa_commentdiv" > -->
<%-- 			                                <form method="post" id="updateForm_${k.qa_idx}" class="qa_comment_form2" style="display: none;"> --%>
<%-- 			                                    <textarea class="qa_comment" name="qa_comment">${k.qa_comment}</textarea> --%>
<%-- 			                                    <input type="button" value="수정 완료" class="qa_comment_button" onclick="updateComment(${k.qa_idx}, this.form)"> --%>
<%-- 	<%-- 				                                    <input type="hidden" name="cPage" value="${cPage }"> --%>
<%-- 			                                    <input type="hidden" name="qa_idx" value="${k.qa_idx}"> --%>
<%-- 			                                    <input type="hidden" name="member_idx" value="${memberUser.member_idx}"> --%>
<!-- 			                                </form> -->
			                                <form method="post" id="updateForm_${k.complain_idx}" class="cp_comment_form2" style="display: none;">
			                                    <textarea class="complain_comment" name="complain_comment">${k.complain_comment}</textarea>
			                                    <input type="button" value="수정 완료" class="cp_comment_button" onclick="cp_update_comment(this.form)">
	<%-- 				                                    <input type="hidden" name="cPage" value="${cPage }"> --%>
			                                    <input type="hidden" name="complain_idx" value="${k.complain_idx}">
			                                    <input type="hidden" name="complain_cidx" value="${k.complain_cidx}">
			                                    <input type="hidden" name="member_idx" value="${memberUser.member_idx}">
			                                </form>
<!-- 				                            </div> -->
<!-- 											<input type="button" value="답글" class="qa_comment_button2 qa_comment_button3" onclick="qa_comment_reply(this)"> -->
<!-- 										<div class="qa_comment_formdiv2"> -->
<!-- 											<form method="post" class="qa_comment_form2"> -->
			<%-- 									<p>${member_name }<input type="text" name="writer"></p> --%>
<!-- 												<textarea class="qa_comment" name="qa_comment"></textarea> -->
<!-- 												<input type="button" value="입  력" class="qa_comment_button" onclick="qa_comment_insert2(this.form)"> -->
<!-- 												댓글 저장시 어떤 원글의 댓글인지 알아야하니까 원글의 idx 필요 -->
<%-- 												<input type="hidden" name="qa_cidx" value="${qavo.qa_cidx }"> --%>
<%-- 												<input type="hidden" name="member_idx" value="${memberUser.member_idx }"> --%>
<!-- 											</form> -->
<!-- 										</div> -->
										</c:otherwise>
									</c:choose>
									
								</div>
							</c:forEach>
						</div>
						
						
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../hj/footer.jsp"%>
</body>
</html>