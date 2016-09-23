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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
<!-- 암호화 -->
<script type="text/javascript" src="js/rsa/jsbn.js"></script>
<script type="text/javascript" src="js/rsa/rsa.js"></script>
<script type="text/javascript" src="js/rsa/prng4.js"></script>
<script type="text/javascript" src="js/rsa/rng.js"></script>

<!-- 암호화 -->
    
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
    
    
<style type="text/css">
html {
    
    background-color:#F5F6F8;
}
	body {
    width: 100%;
    height: 100%;
    background-color:#F5F6F8;
    margin:0;
    padding:0;
}
	#wrap {
    position: relative;
    min-width: 700px;
    height: 100%;
    background-color:#F5F6F8;
        margin:0;
    padding:0;
    
}
	#header {
    position: relative;
    width: 100%;
    margin: 0 ;
    padding: 0 ;
    background-color: #00c73c;
    font-size:12px;
}
#container {
    position: relative;
    z-index: 20;
    max-width: 954px;
    height: 100%;
    margin: 0 auto;
}
	#footer {
    clear: both;
    position: relative;
    z-index: 10;
    max-width: 914px;
    margin: 0 auto;
    padding: 0 20px;
}

.top {
    position: relative;
    max-width: 914px;
    height: 55px;
    margin: 0 auto;
    padding: 0;
    
}


#content.section_home {
    padding: 16px 12px 94px;
    line-height: 14px;
    zoom: 1;
}
#content {
    position: relative;
    padding: 32px 51px 95px;
    /* background-color:red; */
}

div {
    display: block;
}

.section_home .column {
    float: left;
    width: 50%;
}

.sh_group {
    min-height: 185px;
}
.sh_group, .sh_group2, .sh_group3, .sh_group4 {
    margin: 16px 8px 0;
    padding: 31px 29px 32px;
    border: 1px solid #dadada;
    border-radius: 2px;
    background: #fff;
    text-align: left;
}


.navbar-default {
	background-color: #00c73c;
	border-color: #00c73c;
}

<!-- 오른쪽 사람 정렬 css-->
.top-nav>li>a {
    padding-top: 15px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #999;
   
}

.top-nav>li>a:hover,
.top-nav>li>a:focus,
.top-nav>.open>a,
.top-nav>.open>a:hover,
.top-nav>.open>a:focus {
    color: #fff;
    background-color: #00c73c;
}

.top-nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    border: 1px solid rgba(0,0,0,.15);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.top-nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

ul.message-dropdown {
    padding: 0;
    max-height: 250px;
    overflow-x: hidden;
    overflow-y: auto;
}

li.message-preview {
    width: 275px;
    border-bottom: 1px solid rgba(0,0,0,.15);
}

li.message-preview>a {
    padding-top: 15px;
    padding-bottom: 15px;
}





</style>


<div id="wrap">
	<div id="header">
		<div class="top">

		<nav class="navbar navbar-default" >
		
			<a class="navbar-brand" href="index.do" style="color:white;font-size:30px;">꽃밭에 블로그</a>
			
		<ul class="nav navbar-right top-nav" >	
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                    	
                        <li class="message-preview">
                            <a href="#">
                            
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                        
                    </ul>
                    
                    
                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
		</nav>



		</div>
	</div>
	
	<!-- 회원 정보 -->
	<form id="changeMyForm" method="POST" action="finalChange.do">
	
	
	<div id="container">
		<div id="content">

			<div class="panel panel-success">
            <div class="panel-body">

				  <label>
				    회원 아이디 : <span>${login.m_id }</span>
				    <input type="hidden" value="${login.m_id }" name="m_id" id="m_id">
				    <c:remove var="find_user_pw" scope="session" />
				  </label>
				  
				  <div id="newPw">
				  <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
			       <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
			       <input type="hidden" id="rsaChangePw" name="m_pw">
       
       				<input type="password" class="form-control"  placeholder="현재 비밀번호" style="width:30%;" id="now_pw">
				  	<div id="nowPw" style="display:none"></div>
				  	
				  	<hr>
				  
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
	
	<!-- 회원 정보 -->
	
	
	
	
	<!-- 푸터!!! -->
	<div id="footer">
		
	</div>
</div>


<script>
var submitCheck = new Array(false,false,false);


$(document).ready(function(){
	
	$("#now_pw").blur(function(){
		BaseCheckNow();
	});
	$("#m_pw").blur(function(){
		BaseCheckPw();
	});
	
	$("#m_pwChk").blur(function(){
		BaseCheckedPw();
	});
	

});

//비밀번호

function BaseCheckNow(){
	var now_pw = $("#now_pw").val();
	
	if(now_pw.length==0){
		//비밀번호 입력 x
		putYourNow(0);
	}else {
		var pwCheck01 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,16}$/;
		var pwCheck02 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+-=/,.<>]).{6,16}$/;
		var pwCheck03 = /^(?=.*[0-9])(?=.*[!@#$%^&*()_+-=/,.<>]).{6,16}$/;
		
		if(pwCheck01.test(now_pw) || pwCheck02.test(now_pw) || pwCheck03.test(now_pw)){
			findPw();
		}else{
			putYourNow(1);
		}

	}
}


function putYourNow(a){
	
	if(a == "0"){
		$("#nowPw").show();
		$("#nowPw").html("필수 항목 입니다.");
		$("#nowPw").css("color","#FF0000");
	}else if(a == "1" ){
		$("#nowPw").show();
		$("#nowPw").html("6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		$("#nowPw").css("color","#FF0000");
	}else if(a == "2"){
		$("#nowPw").show();
		$("#nowPw").html("일치합니다.");
		$("#nowPw").css("color","#1DDB16");
		submitCheck[0] = true;

	}
}


function findPw(){
	
	var m_id = $("#m_id").val();
	
	var password = $("#now_pw").val();
	
	try{
		var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
	}catch(err){
		alert(err);
	}

	$.ajax({
		type:"POST",
		url:"checkPw.do",
		data:"m_id="+m_id+"&m_pw="+$("#rsaChangePw").val(),
		success:function(msg){
			printCheckPw(msg);
		}
		
	});
}


function printCheckPw(msg){
	if(msg.message  == "Suc"){
		putYourNow(2);
		
	}else{
		$("#nowPw").show();
		$("#nowPw").html("비밀번호가 일치하지 않습니다.");
		$("#nowPw").css("color","#FF0000");

	}
}




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
		submitCheck[1] = true;
		
		
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
		submitCheck[2] = true;
		
	}
}
function go_submti(){
	if($("#m_pw").val().length==0){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if($("#m_pwChk").val() != $("#m_pw").val()){
		alert("비밀번호가 일치 하지 않습니다.")
		return false;
	}
	
	var password = $("#m_pw").val();
	
	for(var j=0; j<submitCheck.length;j++){
		if(!submitCheck[j]){
			alert("확인"+j)
			return false;
		}
	}
	
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
    var securedLoginForm = document.getElementById("changeMyForm");
    securedLoginForm.rsaChangePw.value = securedPassword;
    
}

	 
</script>



