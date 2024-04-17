<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .popup {
        display: none;
        position: fixed;
        left: 25%;
        top: 40%;
        transform: translate(-50%, -50%);
        width: 521.63px;
        height: 500px;
        z-index: 5000;
    }

    .popup-content {
        display: flex;
        flex-direction: column;
        position: relative;
        background-color: lightgray;
        padding: 1.2rem;
        border-radius: 10px;
        width: 100%;
        height: 100%;
    }

    .close {
        position: absolute;
        top: 2px;
        right: 17px;
        font-size: 30px;
        cursor: pointer;
        font-weight: bold;
    }
    .close2 {
        position: absolute;
        font-size: 20px;
        cursor: pointer;
    }
    .closediv {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .popupImgSizeP img { /* 이미지 스타일 수정 */
        width: 100%;
        height: auto; /* 가로 및 세로 비율 유지 */
    }
    .close3{
    	border: none;
    	cursor: pointer;
    	background: lightgray;
    	font-size: 1rem;
    }
</style>
<script type="text/javascript">
function openPopup() {
	let popup = document.getElementById("popup");
    popup.style.display = "block";
}

function closePopup() {
	let popup = document.getElementById("popup");
    popup.style.display = "none";
}
function closePopup2() {
	let popup = document.getElementById("popup");
    popup.style.display = "none";

    let checkBox = document.getElementById("closeCheckbox");
    if (checkBox.checked) {
        let now = new Date();
        let expires = new Date();
        expires.setTime(now.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = "popupClosed=true;expires=" + expires.toUTCString() + ";path=/";
    }
}

window.onload = function() {
    if (!checkCookie("popupClosed")) {
        openPopup();
    }
}

function checkCookie(cookieName) {
	let cookies = document.cookie.split("; ");
    for (let i = 0; i < cookies.length; i++) {
    	let cookie = cookies[i].split("=");
        if (cookie[0] === cookieName) {
            return true;
        }
    }
    return false;
}
</script>
</head>
<body>
	<div id="popup" class="popup">
	    <div class="popup-content">
	        <span class="close" onclick="closePopup()">&times;</span>
	        <p class="popupImgSizeP"><img src="${path}/resources/img/popup2.png" class="popupImgSize"></p>
	        <div class="closediv">
		        <input type="checkbox" class="close2" id="closeCheckbox" value=""><span>&nbsp;&nbsp;&nbsp;&nbsp;24시간동안 보지않기</span>
		        <input type="button" class="close3" onclick="closePopup2()" value="닫기">
	        </div>
	    </div>
	</div>
</body>
</html>