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


#loginBtn{
    	 background-color: #1FBC02;
    	 border-color: #1FBC02;
    	 color:white;
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
                
                <div class="panel-heading">
		                <div class="panel-title" style="text-align:center; font-size:80px;">
		                	${find_user_id.m_id }
		                	<c:remove var="find_user_id" scope="session" />
		                	
		                </div>
		        </div>
      
            </div>	
        </div>
        
        <div class="col-md-6" style="text-align:center;">
             <button type="button" class="form-control btn btn-primary" id="loginBtn" style="height:50px; 
             width:30%;" onclick="location.href='login.do'">로그인</button>
             
        </div>	
        <div class="col-md-6" style="text-align:center;">
        	<input type="button" style="height:50px;width:40%;" value="비밀번호 찾기"/>
        </div>
    </div>
    
</div>