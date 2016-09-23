/**
 * 
 */



function go_submit(){
	
	if($("#m_id").val().length==0){
		alert("아이디를 입력해주세요");
		return false;
	}else if($("#m_pw").val().length==0){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	var password = $("#m_pw").val();
	try{
		var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
 
	}catch(err){
		alert(err);
	}
	return true;
	
}


function submitEncryptedForm(password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedPassword = rsa.encrypt(password);

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var securedLoginForm = document.getElementById("login-form");
    securedLoginForm.rsaChangePw.value = securedPassword;
    
}