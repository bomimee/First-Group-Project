<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
document.addEventListener("DOMContentLoaded", function() {
// 	const addrListJson = '${addrListJson}';
// 	const addr_list = JSON.parse(addrListJson);
	const memberPhone = "${sessionScope.memberUser.member_phone}";

    const phoneParts = memberPhone.split("-");

    const countryNum = document.getElementById("uphone");
    const firstNum = document.getElementById("uphone1");
    const secondNum = document.getElementById("uphone2");

    countryNum.value = phoneParts[0];
    firstNum.value = phoneParts[1];
    secondNum.value = phoneParts[2];
    
    
    const memberEmail = "${memberUser.member_email}";
    
    const emailParts = memberEmail.split("@");
    
    const frontEmail = document.getElementById("uemail");
    const backEmail = document.getElementById("uemail2");
    
    frontEmail.value = emailParts[0];
    backEmail.value = emailParts[1];
    
    
    let sameD = document.getElementById("dc4");
    
    // 주문자 정보 입력란 요소들
    let nameInput = document.getElementById("uid");
    let postcodeInput = document.getElementById("sample6_postcode1");
    let addressInput = document.getElementById("sample6_address1");
    let detailadressInput = document.getElementById("sample6_detailAddress1");
    let phoneInput = document.getElementById("uphone");
    let phoneInput1 = document.getElementById("uphone1");
    let phoneInput2 = document.getElementById("uphone2");
    
    // 배송 정보 입력란 요소들
    let snameInput = document.getElementById("uname2");
    let spostcodeInput = document.getElementById("sample6_postcode2");
    let saddressInput = document.getElementById("sample6_address2");
    let sdetailadressInput = document.getElementById("sample6_detailAddress2");
    let sphoneInput = document.getElementById("uphone3");
    let sphoneInput1 = document.getElementById("uphone4");
    let sphoneInput2 = document.getElementById("uphone5");

    function clearInputs() {
    	snameInput.value = "";
        spostcodeInput.value = "";
        saddressInput.value = "";
        sdetailadressInput.value = "";
        sphoneInput.value = "";
        sphoneInput1.value = "";
        sphoneInput2.value = "";
	}
    
    let defaultPhoneSelect = sphoneInput.value;
    sameD.addEventListener("change", function() {
    	deliveryList.style.display = "none";
        if (sameD.checked) {
        	snameInput.value = nameInput.value;
        	spostcodeInput.value = postcodeInput.value;
        	saddressInput.value = addressInput.value;
        	sdetailadressInput.value = detailadressInput.value;
        	
        	for (let i = 0; i < sphoneInput.options.length; i++) {
                if (sphoneInput.options[i].value === countryNum.value) {
                	sphoneInput.selectedIndex = i;
                    break;
                }
            }
        	sphoneInput1.value = phoneInput1.value;
        	sphoneInput2.value = phoneInput2.value;
        } else {
        	clearInputs();
        	if (deliveryCheckbox.checked) {
                clearInputs();
            }
        }
    });
    
    
    let deliveryCheckbox = document.getElementById("dc5");
    let deliveryList = document.getElementById("deliveryList");
    let deliveryAddressList = document.getElementById("deliveryAddressList");
    
    
    
    deliveryCheckbox.addEventListener("change", function() {
    	clearInputs();
        if (deliveryCheckbox.checked) {
            deliveryList.style.display = "block";
            deliveryAddressList.selectedIndex = 0;
        } else {
            deliveryList.style.display = "none";
            clearInputs();
        }
    });
    
    deliveryAddressList.addEventListener("change", function() {
        let selectedAddress = deliveryAddressList.value;
        if(selectedAddress){
        	const array = selectedAddress.split(",");
        	const phoneArr = array[4].split("-");
        	snameInput.value = array[0];
        	spostcodeInput.value = array[1];
        	saddressInput.value = array[2];
        	sdetailadressInput.value = array[3];
        	sphoneInput.value = phoneArr[0];
        	sphoneInput1.value = phoneArr[1];
        	sphoneInput2.value = phoneArr[2];
        }else{
        	clearInputs();
        }
    });
    
    
	document.querySelector('#pp').addEventListener('click', function() {
		let pointValue = document.getElementById("pointValue");
		if (pointValue.style.display === 'none') {
			pointValue.style.display = 'block';
	    } else {
	    	pointValue.style.display = 'none';
	    }
	});
	
const pointPaymentCheckbox = document.getElementById("pay2");
const paymentButton = document.querySelector(".ppay1");
paymentButton.addEventListener("click", function(e) {
    if (!pointPaymentCheckbox.checked) {
        e.preventDefault();
        alert("결제 방식을 선택해주세요.");
    }else {
        const memberPointsStr = "${member_points}".replace(/,/g, '');
        const memberPoints = parseInt(memberPointsStr);
        const totalPriceElement = document.querySelector(".total_price");
        const totalPriceStr = totalPriceElement.value.replace(/,/g, '');
        const totalPrice = parseInt(totalPriceStr);
        console.log(totalPrice);
        console.log(memberPoints);
        if (memberPoints < totalPrice) {
            e.preventDefault();
            alert("포인트 잔액이 부족합니다.");
        }else{
        	payment_go(this.form);
        }
    }
});
});
function payment_go(f) {
    f.action="payment_go.do";
    f.submit();
}

</script>
</head>
<body>
	<div class="pcontainer">
		<div class="pwrapper">
			<h3 class="sub1">쇼핑백</h3>
			<c:forEach var="item" items="${cartItems}">
			    <c:forEach var="sizeEntry" items="${item.size}" varStatus="v">
			        <c:set var="sizeIndex" value="${v.index}" />
			        <c:set var="quantity" value="${sizeEntry}" />
			        <c:if test="${quantity > 0}">
			            <div class="sbag">
			                <img src="${path}/resources/img/${item.pvoData.pro_type}/${item.pvoData.pro_img1}" class="s1 imgsize">
			                <span class="s1">${item.pvoData.pro_name}</span>
			                <span class="s1">
			                    <c:choose>
			                        <c:when test="${sizeIndex == 0}">Small</c:when>
			                        <c:when test="${sizeIndex == 1}">Medium</c:when>
			                        <c:when test="${sizeIndex == 2}">Large</c:when>
			                    </c:choose>
			                </span>
			                <span class="s1">${quantity}</span>
			                <span class="s1">${item.price}</span>
			            </div>
			        </c:if>
			    </c:forEach>
			</c:forEach>
			<h3 class="sub2">주문자 정보</h3>
			<form method="post" class="pform">
				<ul class="pform2">
					<li>
						<label for="uid">주문자</label> 
						<input type="text" class="ip1" id="uid" name="uid" value="${memberUser.member_name}" required readonly>
					</li>
					<li>
						<label for="upostcode" >우편번호</label> 
						<input type="text" id="sample6_postcode1" class="ip2" value="${memberUser.member_postalCode }" readonly>
						<input type="button" class="ip2" id="sb1" onclick="sample6_execDaumPostcode1()" value="검색하기" style="display: none;"><br>
					</li>
					<li>
						<label for="uaddr">주소</label> 
						<input type="text" id="sample6_address1" class="ip1" value="${memberUser.member_addr }" readonly ><br>
						<input type="text" id="sample6_detailAddress1" class="ip1" value="${memberUser.member_detailAddr }" readonly>
					</li>
<!-- 					<li class="ip3"> -->
<!-- 						<label for="utelephone" class="ip4">일반전화</label> -->
<!-- 						<select name="utelephone1" class="ip2 ts1"> -->
<!-- 							<option value="">02</option> -->
<!-- 							<option value="">031</option> -->
<!-- 							<option value="">051</option> -->
<!-- 							<option value="">010</option> -->
<!-- 							<option value="">011</option> -->
<!-- 							<option value="">018</option> -->
<!-- 						</select> -->
<!-- 						<input type="tel" class="ip2 ts1" id="utelephone" name="utelephone1" maxlength="4" required> -->
<!-- 						<input type="tel" class="ip2 ts1" id="utelephone2" name="utelephone2" maxlength="4" required> -->
<!-- 					</li> -->
					<li class="ip3">
						<label for="uphone" class="ip4">휴대전화</label> 
						<input type="tel" class="ip2 ts1" id="uphone" name="uphone1" required readonly>
						<input type="tel" class="ip2 ts1" id="uphone1" name="uphone1" maxlength="4" required readonly>
						<input type="tel" class="ip2 ts1" id="uphone2" name="uphone2" maxlength="4" required readonly>
					</li>
					<li class="ip3">
						<label for="uemail" class="ip4">이메일</label> 
						<input type="text" class="ip2 ts1" id="uemail" name="uemail1" required readonly>
						<input type="text" class="ip2 ts1" id="uemail2" name="uemail2" required readonly>
						<select name="uemail3" class="ip2 ts1" disabled>
							<option value="naver">직접입력</option>
							<option value="naver">naver</option>
							<option value="daum">daum</option>
							<option value="google">google</option>
							<option value="nate">nate</option>
						</select>
					</li>
				</ul>
			</form>
			<h3 class="sub2">배송 정보</h3>
			<form method="post" class="pform" modelAttribute="orderForm">
				<div>
					<div class="deldiv">
						<div class="deldiv2">
							<span class="checkboxspan">
								<input type="checkbox" id="dc4" class="dc1">
							    <label for="dc4" class="dc3">&nbsp;주문자 정보와 동일</label>
							    <input type="checkbox" id="dc5" class="dc1">
							    <label for="dc5" class="dc3">&nbsp;배송지 목록</label>
						    </span>
							<div id="deliveryList" style="display: none;">
							    <select id="deliveryAddressList">
							        <option value="">배송지 선택</option>
							        <c:forEach var="addr" items="${addr_list}">
							            <option value="${addr.send_name },${addr.send_postcode},${addr.send_addr},${addr.send_addrdetail},${addr.send_phone}">${addr.send_name } / ${addr.send_addr }, ${addr.send_addrdetail}</option>
							        </c:forEach>
							    </select>
						    </div>
						</div>
						<ul class="pform2">
							<li>
								<label for="uname2">수령자</label> 
								<input type="text" class="ip1" id="uname2" name="send_name" value="" required>
							</li>
							<li>
								<label for="upostcode2">우편번호</label> 
		<!-- 						<input type="text" class="ip2" id="upostcode2" name="upostcode2"> -->
		<!-- 						<input type="button" class="ip2" id="sb1" onclick="DaumPostcode2" value="검색하기"> -->
								<input type="text" id="sample6_postcode2" class="ip2" value="" name="send_postcode">
								<input type="button" class="ip2" id="sb1" onclick="sample6_execDaumPostcode2()" value="검색하기"><br>
							</li>
							<li>
								<label for="uaddr2">주소</label> 
								<input type="text" id="sample6_address2" class="ip1" name="send_addr" value=""><br>
								<input type="text" id="sample6_detailAddress2" class="ip1" name="send_addrdetail" value="">
							</li>
							<li class="ip3">
								<label for="uphone3" class="ip4">휴대전화</label> 
								<select name="send_phone1" class="ip2 ts1" id="uphone3">
									<option value="011" selected>011</option>
									<option value="010" >010</option>
									<option value="018">018</option>
								</select>
								<input type="tel" class="ip2 ts1" id="uphone4" name="send_phone2" maxlength="4" value="" required>
								<input type="tel" class="ip2 ts1" id="uphone5" name="send_phone3" maxlength="4" value="" required>
							</li>
							<li>
								<label for="uemail3">배송메시지</label> 
								<input type="text" class="ip1 ts1" id="uemail3" name="send_msg" style="text-align: left;" required>
							</li>
						</ul>
					</div>
					<h3 class="sub2">결제 방식</h3>
					<div class="paydiv">
						<div class="pay1">
							<input type="checkbox" id="pay2">
							<label for="pay2" class="pay3">&nbsp;포인트 결제</label>
							<input type="button" class="pp1" id="pp" value="포인트 잔액"><br>
			    			<span id="pointValue" style="display: none;">&nbsp;&nbsp;${member_points } 포인트</span>
						</div>
						<div class="text5">
							<p>최소 결제 가능 금액은 결제 금액에서 배송비를 제외한 금액입니다.</p>
							<p>제품 택에 동봉되어 있는 마크를 인증하시면 정품 등록과 A/S 서비스를 받으실 수 있습니다.</p>
						</div>	
						<div class="lastprice">
							<span class="s1">최종 결제 금액</span>
							<c:set var="totalPrice" value="0" />
							<c:forEach var="item" items="${cartItems}">
								<c:forEach var="sizeEntry" items="${item.size}" varStatus="v">
						        <c:set var="sizeIndex" value="${v.index}" />
						        <c:set var="quantity" value="${sizeEntry}" />
								<c:set var="totalPrice" value="${totalPrice + item.price * quantity}" />
								</c:forEach>
							</c:forEach>
							<fmt:formatNumber var="total_Price" value="${totalPrice}" pattern="#,###" />
		   					<input type="text" class="s1 total_price" name="total_price" value="${total_Price}" readonly>
						</div>
						<p class="ppay">
<!-- 							<input type="submit" class="ppay1" value="결제하기" onclick="payment_go(this.form)">  -->
							<input type="submit" class="ppay1" value="결제하기" > 
							<input type="hidden" name="member_idx" value="${member_idx }" > 
							<input type="hidden" name="member_points" value="${member_points }" > 
							<c:forEach var="item" items="${cartItems}" varStatus="status">
							    <c:forEach var="sizeEntry" items="${item.size}" varStatus="v">
							        <c:set var="sizeIndex" value="${v.index}" />
							        <c:set var="quantity" value="${sizeEntry}" />
							        <c:if test="${quantity > 0}">
							            <input type="hidden" name="orderItems[${status.index}].pro_idx" value="${item.pvoData.pro_idx}" />
							            <input type="hidden" name="orderItems[${status.index}].price" value="${item.pvoData.price}" />
							            <c:choose>
							                <c:when test="${sizeIndex == 0}">
							                    <input type="hidden" name="orderItems[${status.index}].pro_size" value="Small" />
							                </c:when>
							                <c:when test="${sizeIndex == 1}">
							                    <input type="hidden" name="orderItems[${status.index}].pro_size" value="Medium" />
							                </c:when>
							                <c:when test="${sizeIndex == 2}">
							                    <input type="hidden" name="orderItems[${status.index}].pro_size" value="Large" />
							                </c:when>
							            </c:choose>
						         	   <input type="hidden" name="orderItems[${status.index}].pro_quantity" value="${quantity}" />
							        </c:if>
							    </c:forEach>
							</c:forEach>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
<%@ include file="../hj/footer.jsp" %>
</body>
</html>