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


<div style="height:100%; ">
    
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">   
    <br><br>  
    		<div>
                아이디 찾기
       		 </div>
       		 
       		 <hr>
       		 
        <div class="panel panel-success">
        
        	
       		 
            <div class="panel-body">
                
                <div class="radio">
				  <label>
				    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
				    회원정보에 등록한 휴대전화로 인증
				  </label>
				  
				  
				  
				  
				  <div id="usePhone">
				  	<input type="text" class="form-control" name="m_name" placeholder="이름" style="width:30%;" id="e_m_name">
				  	<input type="text" class="form-control" name="m_phone" 
				  	placeholder="휴대전화" style="width:30%;" id="e_m_phone" maxlength="11" onkeydown="return showKeyCode(event)">
				  </div>
				  
				  
				</div>
				
				
				<div class="radio">
				  <label>
				    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
				    본인 확인 이메일로 인증
				  </label>
				  
				  <div id="useEmail" style="display:none;">
				  	<input type="text" class="form-control" name="m_name" placeholder="이름" style="width:30%;"id="p_m_name">
				  	<div id="row">
				  	<input type="email" class="form-control" name="m_email" placeholder="이메일" 
				  	style="width:30%; float:left; display:inline-block;" id="p_m_email">
				  	&nbsp;&nbsp;
				  	<input type="button" class="" value="인증번호받기" style="height:35px;" onclick="return checkEmail()">
				  	</div>
				  	<br>
				  	<input type="text" name="emailChk" placeholder="인증번호" disabled style="width:30%" id="e_m_emailChk">
				  </div>
				  
				</div>
                
            </div>
 			
 			
        </div>
        
        <div style="text-align:center;">
			<input type="button" value="다음" onclick="return find_id()">
		</div>
		
    </div>
    
</div>







<script>

	var my_confirmNum = "0";
	
	$("#optionsRadios1").click(function(){
		$("#usePhone").show();
		$("#useEmail").hide();
		
		$("#p_m_name").val("");
		$("#p_m_email").val("");
	})
	
	$("#optionsRadios2").click(function(){
		
		$("#usePhone").hide();
		$("#useEmail").show();
		
		$("#e_m_name").val("");
		$("#e_m_phone").val("");
		
	})
	
	function find_id(){
		radio_temp = document.getElementById("optionsRadios1").checked;
		
		if(radio_temp){
			//휴대전화 사용시
			if($("#e_m_name").val().length==0){
				alert("이름을 입력해주세요");
				return false;
			}else if($("#e_m_phone").val().length == 0){
				alert("휴대전화를 입력해주세요");
				return false;
			}
			
			//$("#idUsePhone").submit();
			go_db(0);
		}else{
			//이메일 사용시
			//인증번호 확인

			if($("#e_m_emailChk").val() == my_confirmNum){
				location.href="find_id_ok.do?menu=id";
			}else{
				alert("인증번호를 다시 확인해 주세요");
			}
		}
	}
	
	function checkEmail(){
		if($("#p_m_name").val().length == 0){
			alert("이름을 입력해주세요");
			return false;
		}else if($("#p_m_email").val().length==0){
			alert("이메일을 입력해주세요");
			return false;
		}
		
		go_db(1);
	}
	
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
		{
			return;
		}
		else
		{
			return false;
		}
	}
	
	function go_db(a){
		
		if(a=="0"){
			var m_name = $("#e_m_name").val();
			var m_phone = $("#e_m_phone").val();
			
			 $.ajax({
				type:"GET",
				url:"idUsePhone.do",
				data:"m_name="+m_name+"&m_phone="+m_phone,
				success:function(msg){
					outputList(msg);
				}
				
			});
		}else{
			//이메일 사용시
			
			var m_name = $("#p_m_name").val();
			var m_email = $("#p_m_email").val();
			
			
			
			for(var j =0;j<5;j++){
				my_confirmNum += Math.floor(Math.random() * 10);
			}
			
			alert(my_confirmNum);
			
			$.ajax({
				type:"GET",
				url:"idUseEmail.do",
				data:"m_name="+m_name+"&m_email="+m_email+"&my_confirmNum="+my_confirmNum,
				success:function(msg){
					noEmail(msg);
				}
				
			});
			
			
		}
		
	}
	
	function outputList(msg){
		
		if(msg.message == "Suc"){
			location.href="find_id_ok.do?menu=id";
		}else{
			alert("일치하는 회원이 없습니다.");
			$("#e_m_name").val("");
			$("#e_m_phone").val("");
		}
	}
	
	function noEmail(msg){
		
		if(msg.message == "Suc"){
			alert("인증번호를 입력해주세요");
			$("#e_m_emailChk").attr("disabled",false);
		}else{
			alert("일치하는 회원이 없습니다.");
			$("#e_m_name").val("");
			$("#e_m_email").val("");
		}
	}
	
	
	
</script>