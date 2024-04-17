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
<link rel="stylesheet" href="${path}/resources/public/css/js/payment.css">
<script src="${path}/resources/public/js/js/payment.js" defer></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function address_update(f) {
		f.action="address_update.do";
		f.submit();
	}
	function address_delete(f) {
		 setTimeout(function(){
		    let result = confirm("정말 삭제하시겠습니까?");
		    if (result) {
		        f.action="address_delete_ok.do";
		        f.submit();
		    }else{
		    	f.action="address_detail.do?address_idx=" + address_idx;
		    	f.submit();
		    }
		 }, 200);
	}
	
	function splitPhoneNumber(phoneNumber) {
        let parts = phoneNumber.split("-");
        return {
            send_phone1: parts[0],
            send_phone2: parts[1],
            send_phone3: parts[2]
        };
    }

    window.onload = function() {
        var phoneNumber = "${avo.send_phone}";
        var phoneParts = splitPhoneNumber(phoneNumber);

        document.getElementById("uphone3").value = phoneParts.send_phone1;
        document.getElementById("uphone4").value = phoneParts.send_phone2;
        document.getElementById("uphone5").value = phoneParts.send_phone3;
    };
</script>
</head>
<body>
	<div class="pcontainer">
		<div class="pwrapper">
			<h3 class="sub2">배송지 상세보기</h3>
			<form method="post" class="pform">
				<ul class="pform2">
					<li>
						<label for="uname2">수령자</label> 
						<input type="text" class="ip1" id="uname2" name="send_name" value="${avo.send_name }" required readonly>
					</li>
					<li>
						<label for="upostcode2">우편번호</label> 
						<input type="text" id="sample6_postcode2" class="ip2" value="${avo.send_postcode }" name="send_postcode" readonly>
						<input type="button" class="ip2" id="sb1" onclick="sample6_execDaumPostcode2()" value="검색하기" disabled><br>
					</li>
					<li>
						<label for="uaddr2">주소</label> 
						<input type="text" id="sample6_address2" class="ip1" value="${avo.send_addr }" name="send_addr" readonly><br>
						<input type="text" id="sample6_detailAddress2" class="ip1" value="${avo.send_addrdetail }" name="send_addrdetail" readonly>
					</li>
					<li class="ip3">
						<label for="uphone3" class="ip4">휴대전화</label> 
						<select name="send_phone1" class="ip2 ts1" id="uphone3" disabled>
							<option value="011" ${avo.send_phone1 == '011' ? 'selected' : ''}>011</option>
							<option value="010" ${avo.send_phone1 == '010' ? 'selected' : ''}>010</option>
							<option value="018" ${avo.send_phone1 == '018' ? 'selected' : ''}>018</option>
						</select>
						<input type="tel" class="ip2 ts1" id="uphone4" name="send_phone2" maxlength="4" value="" required readonly>
						<input type="tel" class="ip2 ts1" id="uphone5" name="send_phone3" maxlength="4" value="" required readonly>
					</li>
					<li>
						<label for="uemail3">배송메시지</label> 
						<input type="text" class="ip1 ts1" id="uemail3" name="send_msg" value="${avo.send_msg }" style="text-align: left;" required readonly>
					</li>
				<p class="ppay3">
					<input type="button" class="ppay5" value="삭제" onclick="address_delete(this.form)"> 
					<input type="button" class="ppay4" value="수정" onclick="address_update(this.form)"> 
					<input type="hidden" name="member_idx" value="${member_idx }" > 
					<input type="hidden" name="address_idx" value="${avo.address_idx }" > 
				</p>
				</ul>
			</form>
		</div>
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>