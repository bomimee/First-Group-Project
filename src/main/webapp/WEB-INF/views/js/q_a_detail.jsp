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
<title>q_a_detail</title>
<script src="https://kit.fontawesome.com/80123590ac.js" crossorigin="anonymous"></script>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${path}/resources/public/css/js/q_a_detail.css">
<script src="${path}/resources/public/js/js/q_a_modal.js" defer></script>
<script type="text/javascript">
	function qa_list() {
		location.href="qa_list.do"
	}
	function qa_update(f) {
		f.action="qa_update.do";
		f.submit();
	}
	function qa_comment_insert(f) {
		f.action="qa_comment_insert.do";
		f.submit();
	}
	function qa_delete(f) {
		 setTimeout(function(){
		    let result = confirm("정말 삭제하시겠습니까?");
		    if (result) {
		        f.action="qa_delete_ok.do";
		        f.submit();
		    }else{
		    	f.action="qa_detail.do?qa_idx=" + qa_idx;
		    	f.submit();
		    }
		 }, 200);
	}
	function qa_update(f) {
		f.action="qa_update.do";
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

    function qa_update_comment(f) {
    	f.action="qa_update_comment_ok.do"
    	f.submit();
    }
// function qa_comment_reply(f) {
//     let form = f.parentNode.nextElementSibling; // 해당 형제 요소 내부에서 폼 선택
//     if (form.style.display === "none" || form.style.display === "") {
//         form.style.display = "grid"; // 폼을 보이게 함
//     } else {
//         form.style.display = "none"; // 폼을 숨김
//     }
// }
// function qa_comment_insert2(f) {
// 	f.action="qa_comment_insert2.do";
// 	f.submit();
// }
</script>
</head>
<body>
	<div class="qadetailcontainer">
		<div class="qadetailtitlediv">
			<h3 class="qadetailtitle">Q & A 게시글</h3>
		</div>
		<div class="qadetailwrapper">
			<div class="gadetaildiv">
				<c:choose>
		            <c:when test="${not empty detailMessage}">
						<ul class="qadetailul">
							<li class="qadetailli">
								<p class="qadetailitem1">항목</p>
								<p class="qadetailitem">&nbsp;${qavo.qa_type }</p>
							</li>
							<li class="qadetailli">
								<p class="qadetailitem1">이름</p>
								<p class="qadetailitem">&nbsp;${qavo.member_name }</p>
							</li>
							<li class="qadetailli">
								<p class="qadetailitem1">제목</p>
								<p class="qadetailitem1-1" id="qadetailitem1-1">&nbsp;${qavo.qa_subject }</p>
							</li>
							<li class="detailMsgcontent">
								<p class="qacontent">${detailMessage}</p>
							</li>
						</ul>
						<div class="qadetail">
							<div class="qadetailupdel">
								<input type="hidden" name="qa_idx" value="${qavo.qa_idx }">
								<input type="hidden" name="cPage" value="${cPage }">
								<input type="button" class="qadetail1" value="수정하기" style="display: none;" onclick="qa_update(this.form)">
								<input type="button" class="qadetail1" value="삭제하기" style="display: none;" onclick="qa_delete(this.form)">
							</div>
							<div class="qadetaillist">
								<input type="button" class="qadetail2" value="목록" onclick="qa_list()"> 
							</div>
						</div>
		            </c:when>
		            <c:when test="${empty detailMessage }">
		            <form method="post">
						<ul class="qadetailul">
							<li class="qadetailli">
								<p class="qadetailitem1">항목</p>
								<p class="qadetailitem">&nbsp;${qavo.qa_type }</p>
							</li>
							<li class="qadetailli">
								<p class="qadetailitem1">이름</p>
								<p class="qadetailitem">&nbsp;${member_name }</p>
							</li>
							<li class="qadetailli">
								<p class="qadetailitem1">제목</p>
								<p class="qadetailitem1-1" id="qadetailitem1-1">&nbsp;${qavo.qa_subject }</p>
							</li>
							<li>
								<pre><p class="qacontent">&nbsp;${qavo.qa_content }</p></pre>
							</li>
						</ul>
						<div class="qadetail">
							<div class="qadetailupdel">
								<input type="hidden" name="qa_idx" value="${qavo.qa_idx }">
								<input type="hidden" name="cPage" value="${cPage }">
								<input type="button" class="qadetail1" value="수정하기" onclick="qa_update(this.form)">
								<input type="button" class="qadetail1" value="삭제하기" onclick="qa_delete(this.form)">
							</div>
							<div class="qadetaillist">
								<input type="button" class="qadetail2" value="목록" onclick="qa_list()"> 
							</div>
						</div>
					</form>
<!-- 						모달 다이얼로그 -->
<!-- 						<div id="myModal" class="modal"> -->
<!-- 						    <div class="modal-content"> -->
<!-- 						        <span class="close" onclick="closeModal()">&times;</span> -->
<!-- 						        <div class="realdelete"> -->
<!-- 							        <p>정말 삭제하시겠습니까?</p> -->
<!-- 						        </div> -->
<!-- 						        <div class="deleteselect"> -->
<%-- 							        <input type="hidden" name="qa_idx" value="${qavo.qa_idx }"> --%>
<%-- 									<input type="hidden" name="cPage" value="${cPage }"> --%>
<!-- 							        <input type="button" class="deleteok" onclick="confirmDelete()">확인</button> -->
<!-- 							        <input type="button" class="deleteok" onclick="closeModal()">취소</button> -->
<!-- 						        </div> -->
<!-- 						    </div> -->
<!-- 						</div> -->
						<%-- 댓글 입력 --%>
						<div class="qa_commentdiv">
							<form method="post" class="qa_comment_form">
<%-- 									<p>${member_name }<input type="text" name="writer"></p> --%>
								<textarea class="qa_comment" name="qa_comment"></textarea>
								<input type="button" value="입  력" class="qa_comment_button" onclick="qa_comment_insert(this.form)">
								<!-- 댓글 저장시 어떤 원글의 댓글인지 알아야하니까 원글의 idx 필요 -->
								<input type="hidden" name="qa_idx" value="${qavo.qa_idx }">
								<input type="hidden" name="member_idx" value="${memberUser.member_idx }">
							</form>
							<%-- 댓글 출력 --%>
							<c:forEach var="k" items="${qa_comm_list }">
								<div class="qa_comment_list">
<%-- 									<c:forEach begin="1" end="${k.qa_step }"><span>&nbsp;<i class="fa-solid fa-arrows-turn-right fa-flip-vertical"></i></span></c:forEach> --%>
									<c:choose>
										<c:when test="${k.qa_active == 1}">
											<div class="qa_comment_formdiv">
												<span class="qa_comment_name" style="color: #cacaca">${member_name } : </span>
												<span class="qa_content_delete" style="color: #cacaca">삭제된 댓글입니다</span>
<%-- 												<span style="color: #cacaca">${k.qa_regdate.substring(0,16) }</span> --%>
												<c:choose>
										            <c:when test="${k.qa_regdate.substring(0, 10) == pageContext.getAttribute('today')}">
										               <span style="color: #cacaca">${k.qa_regdate.substring(0, 16) }</span>
										            </c:when>
										            <c:otherwise>
										               <span style="color: #cacaca">${k.qa_regdate.substring(0, 10) }</span>
										            </c:otherwise>
										        </c:choose>
												<div class="qa_comment_updel"></div>
											</div>
										</c:when>
										<c:otherwise>
											<form method="post" class="qa_comment_formdiv">
												<span class="qa_comment_name">${member_name } : </span>
												<span>${k.qa_comment }</span>
												<c:choose>
										            <c:when test="${k.qa_regdate.substring(0, 10) == pageContext.getAttribute('today')}">
										               <span>${k.qa_regdate.substring(0, 16) }</span>
										            </c:when>
										            <c:otherwise>
										                <span>${k.qa_regdate.substring(0, 10) }</span>
										            </c:otherwise>
										        </c:choose>
												<!-- 실제 삭제 처리는 로그인해서 본인 댓글만 삭제할 수 있어야 한다. -->
												<div class="qa_comment_updel">
													<c:if test="${qavo.member_idx == memberUser.member_idx }">
														<input type="hidden" name="qa_idx" value="${k.qa_idx }">
<%-- 														<input type="hidden" name="cPage" value="${cPage }"> --%>
														<input type="button" value="수정" class="qa_comment_button2" onclick="showupdateform(${k.qa_idx})">&nbsp;
														<input type="button" value="삭제" class="qa_comment_button2" onclick="qa_delete(this.form)">
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
			                                <form method="post" id="updateForm_${k.qa_idx}" class="qa_comment_form2" style="display: none;">
			                                    <textarea class="qa_comment" name="qa_comment">${k.qa_comment}</textarea>
			                                    <input type="button" value="수정 완료" class="qa_comment_button" onclick="qa_update_comment(this.form)">
	<%-- 				                                    <input type="hidden" name="cPage" value="${cPage }"> --%>
			                                    <input type="hidden" name="qa_idx" value="${k.qa_idx}">
			                                    <input type="hidden" name="qa_cidx" value="${k.qa_cidx}">
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
<%@ include file="../hj/footer.jsp" %>
</body>
</html>