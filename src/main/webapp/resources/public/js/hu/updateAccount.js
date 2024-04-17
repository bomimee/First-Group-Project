	function update_go(f) {
		const name = document.getElementById("acc_name");
		const email = document.getElementById("acc_email");
		const postalcode = document.getElementById("sample6_postcode");
		const addr = document.getElementById("sample6_address");
		const tel = document.getElementById("acc_tel");
		const gender = document.getElementById("m_gender");

		alert("회원님 수정정보 \n" +
			  "이름: " + name.value + "\n" +
			  "이메일: " + email.value + "\n" +
			  "우편번호: " + postalcode.value + "\n" +
			  "주소: " + addr.value + "\n" +
			  "전화번호: " + tel.value + "\n" +
			  "수정 완료 되었습니다."
			);
	}