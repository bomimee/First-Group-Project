function save_go(f) {
        const id = document.getElementById("acc_id");
        const name = document.getElementById("acc_name");
        const bday = document.getElementById("acc_bday");
        const email = document.getElementById("acc_email");
        const postalcode = document.getElementById("sample6_postcode");
        const addr = document.getElementById("sample6_address");
        const tel = document.getElementById("acc_tel");
        const gender = document.getElementById("gender");

        alert("회원님 정보 \n" +
              "아이디: " + id.value + "\n" +
              "이름: " + name.value + "\n" +
              "생년월일: " + bday.value + "\n" +
              "이메일: " + email.value + "\n" +
              "우편번호: " + postalcode.value + "\n" +
              "주소: " + addr.value + "\n" +
              "전화번호: " + tel.value + "\n" +
              "성별: " + gender.value
            );
}   