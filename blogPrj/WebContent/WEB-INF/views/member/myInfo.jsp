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

<script src="js/myInfo.js"></script>
    
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
    

<!-- Morris Charts JavaScript -->
<!--     <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script> -->
    
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
	
	<div id="container">
		<div id="content">
			<div class="column">
				<div class="sh_group">
				<input type=hidden value="${login.m_id }" id="m_id">
				
					<div style="height:100%;">
						<h2><bold>정보 수정</bold></h2>
						
						<div style="height:100%; width:100%; ">
						<table class="table" style="text-align:center;">
							<col style="width:30%;"/>
							<col style="width:70%;"/>
						  <tr>
						  	<td style="">이름</td>
						  	<td style=" text-align:left;">
						  		<div style="position:relative; width:90%; height:100%; ">
						  			<h4>${login.m_name }</h4>
						  			<br>
						  			<div>
						  				<input type="button" value="이름 변경" id="nameChangeBtn">
						  			</div>
						  			<br><br>
						  			<div style=" display:none;" id="nameBox">
						  				<input type="text" class="form-control" name="m_name" placeholder="이름" id="m_name">
						  				<div id="checkName"></div>
						  				<br>
						  				<button type="button" class="form-control btn btn-primary" 
						  				id="nameChangeBtns" style="height:50px; width:100px;" disabled onclick="changeName()">변경</button>
						  				
						  				<button type="button" class="form-control btn btn-primary" 
						  				id="nameCancelBtn" style="height:50px; width:100px;">취소</button>
						  			</div>
						  		</div>
						  	</td>
						  </tr>
						  
						  <tr>
						  	<td style="">이메일</td>
						  	<td style=" text-align:left;">
						  		<div style="position:relative; width:90%; height:100%; ">
						  			<h4>${login.m_email }</h4>
						  			<br>
						  			<div>
						  				<input type="button" value="이메일 변경" id="emailChangeBtn">
						  			</div>
						  			<br><br>
						  			<div style=" display:none;" id="emailCheckBox">
						  				<input type="email" class="form-control" name="m_email" placeholder="이메일" id="m_email">
						  				<div id="checkEmail"></div>
						  				<button type="button" class="form-control btn btn-primary" 
						  				id="emailChangeBtns" style="height:50px; width:100px;" disabled onclick="changeEmail()">변경</button>
						  				<button type="button" class="form-control btn btn-primary" id="emailCancelBtn" style="height:50px; width:100px;">취소</button>
						  			</div>
						  		</div>
						  	</td>
						  </tr>
						  
						  <tr>
						  	<td style="">휴대전화</td>
						  	<td style=" text-align:left;">
						  		<div style="position:relative; width:90%; height:100%; ">
						  			<h4>${login.m_phone }</h4>
						  			<br>
						  			<div>
						  				<input type="button" value="휴대전화 변경" id="phoneChangeBtn">
						  			</div>
						  			<br><br>
						  			<div style=" display:none;" id="phoneCheckBox">
						  				<input type="text" class="form-control" name="m_phone" 
						  				placeholder="휴대전화" id="m_phone" maxlength="11" onkeydown="return showKeyCode(event)">
						  				<button type="button" class="form-control btn btn-primary" 
						  				id="phoneChangeBtns" style="height:50px; width:100px;" disabled onclick="changePhone()">변경</button>
						  				<button type="button" class="form-control btn btn-primary" id="phoneCancelBtn" style="height:50px; width:100px;">취소</button>
						  			</div>
						  		</div>
						  	</td>
						  </tr>
						  
						  <tr>
						  	<td colspan="2">
						  		
						  		<button type="button" class="form-control-1 btn btn-primary" id="cancelBtn" style="height:50px; width:100px;" onclick="location.href='myPage.do'">취소</button>
						  	</td>
						  </tr>
						</table>
	
					</div>
					
					
				</div>
			</div>

		</div>
	</div>
	
	
	<!-- 회원 정보 -->
	
	
	
	
	<!-- 푸터!!! -->
	<div id="footer">
		
	</div>
</div>





<script>

$(document).ready(function(){
	
	$("#m_name").click(function(){
		 $(document).mousedown(function(e){
			 $('#m_name').each(function(){
			         if( $(this).css('display') == 'block' )
			         {
			        	 var l_position = $(this).offset();
			             l_position.right = parseInt(l_position.left) + ($(this).width());
			             l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());
			             
			             if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
				                 && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
				             {
				                 //alert( 'popup in click' );
				             }
				             else
				             {
				                 //alert( 'popup out click' );
				                 BaseCheckName();
				             }   
			         }
			     });
			 });
	 	});
	
	
		$("#m_email").click(function(){
			 $(document).mousedown(function(e){
				 $('#m_email').each(function(){
				         if( $(this).css('display') == 'block' )
				         {
				        	 var l_position = $(this).offset();
				             l_position.right = parseInt(l_position.left) + ($(this).width());
				             l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());
				             
				             if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
					                 && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
					             {
					                 //alert( 'popup in click' );
					             }
					             else
					             {
					                 //alert( 'popup out click' );
					                 BaseCheckEmail();
					             }   
				         }
				     });
				 });
		 	});
		
		$("#m_phone").click(function(){
			 $(document).mousedown(function(e){
				 $('#m_phone').each(function(){
				         if( $(this).css('display') == 'block' )
				         {
				        	 var l_position = $(this).offset();
				             l_position.right = parseInt(l_position.left) + ($(this).width());
				             l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());
				             
				             if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
					                 && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
					             {
					                 //alert( 'popup in click' );
					             }
					             else
					             {
					                 //alert( 'popup out click' );
					                 BaseCheckPhone();
					             }   
				         }
				     });
				 });
		 	});
		
	
	

});


//이름 변경~
function BaseCheckName(){
	
	var m_name = $("#m_name").val();
	var regExp02 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var regExp01 = /\s/g;
	var regExp03 = /^[0-9]*$/;
	
	if($("#m_name").val().length==0){
		putYourName(0);
	}else if(regExp01.test(m_name)){
		putYourName(2);
	}else if(regExp02.test(m_name)){
		putYourName(2);
	}else if(regExp03.test(m_name)){
		putYourName(2);
	}else{
		putYourName(1);
	}
}


function putYourName(a){
	
	if(a=="0"){
		$("#checkName").show();
		$("#checkName").html("필수 항목 입니다.");
		$("#checkName").css("color","#FF0000");
		$("#nameChangeBtns").attr("disabled",true);
	}else if(a=="1"){
		$("#checkName").hide();
		$("#nameChangeBtns").attr('disabled',false);
	}else if(a=="2"){
		$("#checkName").show();
		$("#checkName").html("이름에는 한글, 영문 대소문자를 이용해 주세요.");
		$("#checkName").css("color","#FF0000");
		$("#nameChangeBtns").attr("disabled",true);
	}
}

function changeName(){
	var m_name = $("#m_name").val();
	var m_id = $("#m_id").val();
	location.href="changeName.do?m_name="+m_name+"&m_id="+m_id;
}
//이름 변경~


//이메일변경~
function BaseCheckEmail(){
	var m_email = $("#m_email").val();
	
	if(m_email.length==0){
		putYourEmail(0);
	}else if(m_email.length>0){
		putYourEmail(1);
	}
}

function putYourEmail(a){
	if(a == "0"){
		$("#checkEmail").show();
		$("#checkEmail").html("필수 정보입니다.");
		$("#checkEmail").css("color","#FF0000");
		$("#emailChangeBtns").attr('disabled',true);
	}else if(a=="1"){
		$("#checkEmail").hide();
		$("#emailChangeBtns").attr('disabled',false);
	}
}

function changeEmail(){
	var m_email = $("#m_email").val();
	var m_id = $("#m_id").val();
	location.href="changeEmail.do?m_email="+m_email+"&m_id="+m_id;
}

//이메일변경~


//휴대전화변경~~

function BaseCheckPhone(){
	var m_phone = $("#m_phone").val();

	if(m_phone.length==0){
		putYourPhone(0);
	}else if(m_phone.length==11){
		putYourPhone(1);
	  }
}

function putYourPhone(a){
	if(a=="0"){
		$("#checkPhone").show();
		$("#checkPhone").html("필수 정보입니다.");
		$("#checkPhone").css("color","#FF0000");
		$("#phoneChangeBtns").attr('disabled',true);
	}else if(a=="1"){
		$("#checkPhone").hide();
		$("#phoneChangeBtns").attr('disabled',false);
		
	}
}

function changePhone(){
	var m_phone = $("#m_phone").val();
	var m_id = $("#m_id").val();
	location.href="changePhone.do?m_phone="+m_phone+"&m_id="+m_id;
}

//휴대전화변경~~
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



</script>








<script type="text/javascript">
$("#nameChangeBtn").click(function(){
	$("#nameBox").show();
	$("#nameChangeBtn").hide();
})

$("#nameCancelBtn").click(function(){
	$("#nameinput").html(" ");
	$("#nameBox").hide();
	$("#nameChangeBtn").show();
})

$("#emailChangeBtn").click(function(){
	$("#emailCheckBox").show();
	$("#emailChangeBtn").hide();
})

$("#emailCancelBtn").click(function(){
	$("#emailCheckBox").hide();
	$("#emailChangeBtn").show();
})

$("#phoneChangeBtn").click(function(){
	$("#phoneCheckBox").show();
	$("#phoneChangeBtn").hide();
})
$("#phoneCancelBtn").click(function(){
	$("#phoneCheckBox").hide();
	$("#phoneChangeBtn").show();
})


</script>