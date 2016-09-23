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
<script src="js/regi.js"></script>

<!-- 암호화 -->
<script type="text/javascript" src="js/rsa/jsbn.js"></script>
<script type="text/javascript" src="js/rsa/rsa.js"></script>
<script type="text/javascript" src="js/rsa/prng4.js"></script>
<script type="text/javascript" src="js/rsa/rng.js"></script>

<!-- 암호화 -->


<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
    
    
    #regiBtn{
    	 background-color: #1FBC02;
    	 border-color: #1FBC02;
    	 color:white;
    }
    
    .form-control:focus{
   		  outline: none !important;
    border-color: #1FBC02;
    box-shadow: 0 0 10px #1FBC02;
    }
    
	.btn-primary {
		color: #999999;
		background-color: white;
		border-color: #999999
	}
    
    .btn-primary.active, .btn-primary.focus, .btn-primary:active,
	.btn-primary:focus, .btn-primary:hover, .open>.dropdown-toggle.btn-primary{
		border-color:#1FBC02;
    	color:#1FBC02;
    	background-color:white;
	}
    
    

</style>



<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
    
    	<div class="panel-heading">
                <div class="panel-title" style="text-align:center; font-size:80px;">
                	<a href="index.do" style="text-decoration: none; color:#1FBC02;">꽃밭에 블로그</a>
                </div>
        </div>
        
       <form id="login-form" action="regiAF.do" method="post">
       <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
       <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
       <input type="hidden" id="rsaChangePw" name="m_pw">
            
        <div class="panel panel-success">
        
            <div class="panel-body">
                    <div>
                        <input type="text" class="form-control" name="m_id" placeholder="아이디" id="m_id" >
                        <div id = "chekedId" style="display:none;">
                        </div>
                        <input type="hidden" id="m_id_checked">
                    </div>
                   
                    <div>
                        <input type="password" class="form-control" placeholder="비밀번호" id="m_pw">
                        <div id="checkPw" style="display:none;"></div>
                    </div>
                    
                    <div>
                        <input type="password" class="form-control" placeholder="비밀번호 확인" id="m_pwChecked">
                        <div id="checkPwed" style="display:none;"></div>
                    </div>
            </div>
            
        </div><!-- class="panel panel-success" -->
            
            <div class="panel panel-success">
            <div class="panel-body">
                
                    <div>
                        <input type="text" class="form-control" name="m_name" placeholder="이름" id="m_name">
                        <div id="checkName"></div>
                    </div>
                    

                        <div class="btn-group" data-toggle="buttons" style="width:100%;">

						  <label class="btn btn-primary" id="genderChk01" style="width:50%;">
						    <input type="radio" name="m_gender" id="option1"  value="m"> 남자
						  </label>

						  <label class="btn btn-primary" id="genderChk02" style="width:50%; ">
						    <input type="radio" name="m_gender" id="option2"  value="w"> 여자
						  </label>
 							 
						</div>	
						<br>
						<div id="row" style="text-align:center;">
							<div class="col-md-2" style="font-size:20px; ">
								<p class="text-muted" style="margin:auto; padding:auto;">생일</p>
							</div>
							
							<div class="col-md-10">
								<div class="col-md-4">
									<div>
				                        <input type="text" class="form-control" name="b_year" 
				                        placeholder="년(4자)" id="b_year" maxlength="4" onkeydown="return showKeyCode(event)" >
				                    </div>
								</div>
								<div class="col-md-4">
									<select class="form-control" name="b_month" id="b_month">
									  <option selected value="월">월</option>
									  <option value="01">1</option>
									  <option value="02">2</option>
									  <option value="03">3</option>
									  <option value="04">4</option>
									  <option value="05">5</option>
									  <option value="06">6</option>
									  <option value="07">7</option>
									  <option value="08">8</option>
									  <option value="09">9</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>
								</div>
								<div class="col-md-4">
									<div>
				                        <input type="text" class="form-control" name="b_day" 
				                        placeholder="일" id="b_day" maxlength="2" onkeydown="return showKeyCode(event)">
				                    </div>
								</div>	
								
								<div id="checkBirth"></div>
						</div><!-- class="col-md-10" -->
						
            		</div><!-- id="row" -->

            </div>
            
        </div><!-- class="panel panel-success" -->
            
            
            <div class="panel panel-success">
            <div class="panel-body">
                    <div>
                        <input type="email" class="form-control" name="m_email" placeholder="이메일" id="m_email">
                        <div id="checkEmail"></div>
                    </div>
                   
                    <div>
                        <input type="text" class="form-control" name="m_phone" placeholder="휴대전화" 
                        id="m_phone" onkeydown="return showKeyCode(event)" maxlength="11">
                        <div id="checkPhone"></div>
                    </div>   
            </div>    <!-- class="panel-body" -->
        </div><!-- class="panel panel-success" -->

    		<div>
                <button type="submit" class="form-control btn btn-primary" 
                id="regiBtn" style="height:50px;" onclick="return go_submit()">가입하기</button>
            </div>
            
           </form>
            
        </div>
        
    </div>
    



<script>
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