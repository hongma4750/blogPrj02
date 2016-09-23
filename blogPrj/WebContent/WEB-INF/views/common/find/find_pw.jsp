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
                비밀번호 찾기
       		 </div>
       		 
       		 <hr>
       		 
        <div class="panel panel-success"> 
            <div class="panel-body">
                
                <input type="text" class="form-control" name="m_id" placeholder="아이디" autofocus id="m_id">
                
                
            </div>			
        </div>
        
        <div style="text-align:center;">
			<input type="button" value="다음" onclick="return getId()">
		</div>
		
    </div>
    
</div>




<script>

function getId(){
	if($("#m_id").val().length == 0){
		alert("아이디를 입력해주세요");
		return false;
	}
	
	var m_id = $("#m_id").val();
	
	$.ajax({
		type:"POST",
		url:"getId.do",
		data:"m_id="+m_id,
		success:function(msg){
			findId(msg);
		}
		
	});
}

function findId(msg){
	
	if(msg.message == "Suc"){
		//아이디가 있을경우
		location.href='find_pw_se.do?menu=pw&m_id='+$("#m_id").val();
	}else{
		//아이디가 없을 경우
		alert("일치하는 아이디가 없습니다.");
		$("#m_id").val("");
		
	}
}



</script>