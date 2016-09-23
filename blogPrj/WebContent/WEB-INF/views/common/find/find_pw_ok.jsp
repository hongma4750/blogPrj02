<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<fmt:requestEncoding value="utf-8"/>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<!-- 부트스트랩 링크 -->

<!-- 암호화 -->
<script type="text/javascript" src="js/rsa/jsbn.js"></script>
<script type="text/javascript" src="js/rsa/rsa.js"></script>
<script type="text/javascript" src="js/rsa/prng4.js"></script>
<script type="text/javascript" src="js/rsa/rng.js"></script>

<!-- 암호화 -->


<style type="text/css">
/* 	 a{
		height:70px;
		color:white;
	}
	a:hover{
		background-color:#5AB81A;
		color:yellow;
	}
	
	li:hover{
		background-color:#5AB81A;
	} */
	
	.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0;
	font-size: 30px;
	color:white;
}

.nav-tabs>li>a:hover {
	background-color:#5AB81A;
	border-color: #5AB81A #5AB81A #5AB81A;
	color:yellow;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: yellow;
	cursor: default;
	background-color: #5AB81A;
	border: 1px solid #5AB81A;
	border-bottom-color: transparent
}


</style>

<form action="changePW.do" id="changePW" method="POST">
<div style="height:100%; ">
    
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">     
    <br><br>
    		<div>
                비밀번호 찾기
       		 </div>
       		 
       		 <hr>
       		 
       		 
       		 
       		 
        <div class="panel panel-success">
        
        	
       		 
            <div class="panel-body">
                
                
				  <label>
				    회원 아이디 : <span>${find_user_pw.m_id }</span>
				    <input type="hidden" value="${find_user_pw.m_id }" name="m_id">
				    <c:remove var="find_user_pw" scope="session" />
				  </label>
				  
				  <div id="newPw">
				  <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
			       <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
			       <input type="hidden" id="rsaChangePw" name="m_pw">
       
				  
				  	<input type="password" class="form-control"  placeholder="새로운 비밀번호" style="width:30%;" id="m_pw">
				  	<div id="checkPw" style="display:none"></div>
				  	
				  	<input type="password" class="form-control" name="pwChk" placeholder="새로운 비밀번호 확인" 
				  	style="width:30%;" id="m_pwChk">
				  	<div id="checkPwed" style="display:none"></div>
				  	
				  </div>
				

				
				<div >
				  <div id="checkNoauto">

				  </div>
				  
				</div>
                
            </div>
            
            
 			
 			
        </div>
        
        <div style="text-align:center;">
			<input type="submit" value="확인" onclick="return go_submti()">
		</div>
		
		
    </div>
    
</div>
</form>


<script>
$(document).ready(function(){
	
	$("#m_pw").blur(function(){
		BaseCheckPw();
	});
	
	$("#m_pwChk").blur(function(){
		BaseCheckedPw();
	});
	

});

//비밀번호
function BaseCheckPw(){
	var m_pw = $("#m_pw").val();
	
	if($("#m_pw").val().length==0){
		//비밀번호 입력 x
		putYourPw(0);
	}else {
		var pwCheck01 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,16}$/;
		var pwCheck02 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+-=/,.<>]).{6,16}$/;
		var pwCheck03 = /^(?=.*[0-9])(?=.*[!@#$%^&*()_+-=/,.<>]).{6,16}$/;
		
		if(pwCheck01.test(m_pw) || pwCheck02.test(m_pw) || pwCheck03.test(m_pw)){
			putYourPw(2);
			return;
		}else{
			putYourPw(1);
		}

	}
}


function putYourPw(a){
	
	if(a == "0"){
		$("#checkPw").show();
		$("#checkPw").html("필수 항목 입니다.");
		$("#checkPw").css("color","#FF0000");
		
		$("#checkPwed").show();
		$("#checkPwed").html("필수 항목 입니다.");
		$("#checkPwed").css("color","#FF0000");
		
	}else if(a == "1" ){
		$("#checkPw").show();
		$("#checkPw").html("6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		$("#checkPw").css("color","#FF0000");
	}else if(a == "2"){
		$("#checkPw").hide();
		
		
	}
}

//비밀번호 확인
function BaseCheckedPw(){
	var m_pwChk = $("#m_pwChk").val();
	
	if(m_pwChk.length==0){
		//아이디를 아무것도 입력 x
		putYourPwed(0);
	}else if($("#m_pw").val() != m_pwChk){
		putYourPwed(1);
	}else if($("#m_pw").val() == m_pwChk){
		putYourPwed(2);
	}
}

function putYourPwed(a){
	if(a=="0"){
		$("#checkPwed").show();
		$("#checkPwed").html("필수 항목 입니다.");
		$("#checkPwed").css("color","#FF0000");
	}else if(a=="1"){
		$("#checkPwed").show();
		$("#checkPwed").html("비밀번호가 일치하지 않습니다.");
		$("#checkPwed").css("color","#FF0000");
	}else if(a=="2"){
		$("#checkPwed").hide();
		
	}
}
function go_submti(){
	if($("#m_pw").val().length==0){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if($("m_pwChk").val() != $("m_pw").val()){
		alert("비밀번호가 일치 하지 않습니다.")
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
    var securedLoginForm = document.getElementById("changePW");
    securedLoginForm.rsaChangePw.value = securedPassword;
    
}

	 
</script>



