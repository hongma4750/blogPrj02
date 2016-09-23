<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value ="utf-8"/> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->


<title>서로이웃 추가</title>
</head>
<body>
<%String blogId= request.getParameter("blogId"); %>

<!-- 이웃추가 팝업 (이웃그룹지정) -->

<h5><b>&nbsp;&nbsp;서로이웃 맺기</b></h5>
<hr/>

<form action="adddblfriendAF.do" method="post" id="_myform" name="myform">

<div style="margin:20px;">
<span style="color:#2eaa08;"><b><%=blogId %></b></span> 님에게 <b>서로이웃</b> 을 신청합니다.
<br><br> 

           <input type="hidden" name="df_receive" value="<%=blogId%>" /> 
           <input type="hidden" name="df_send" value="${login.m_id }" /> 

			<div style="float: left;">그룹선택&nbsp;</div>

		<select name="fnd_groupname" class="form-control input-sm" style="width: 200px; float: left;">
			  <c:forEach items="${glist }" var="gl">
				<option value="${gl.fg_groupname }">${gl.fg_groupname }</option>
				
			  </c:forEach>
			</select> 
		&nbsp;<a class="btn btn-default btn-xs" onclick="newgroup();">그룹추가</a>
		<br><br>
		
		
<div id="newgroup" style="display:none">
&nbsp;&nbsp;<input id="_chkg" name="chkg" type="checkbox" checked=""/> <input type="text" id="_gname" name="" data-msg="그룹명을" value="새 그룹"/>
<select name="openChk"><option selected="selected">공개</option><option>비공개</option></select>
</div>
<br>
신청 메시지를 입력해주세요.
<textarea rows="5" placeholder="우리 서로이웃해요~"
cols="40" name="df_msg" id="_dblmsg">
</textarea>
</div>

</form>

<hr/>
<div align="center">
<button type="button" id="_btnOk" onclick="popupClose();" class="btn btn-default btn-sm" >확인</button>
<button type="button" onclick="popupClose();" class="btn btn-default btn-sm">취소</button>
</div>

<script>
$(function(){
	$("li").click(function(value){
		$("li").value(this)
	});
});

$("#_btnOk").click(function name(){
	if($("#_gname").val()==""){
		alert($("#_gname").attr("data-msg")+" 입력하세요");
		$("#_gname").focus();
	}else{
		$("#_myform").attr({"target":"_self","action":"adddblfriendAF.do"}).submit();
	}
});

function popupClose(){
	window.close();
}

//그룹추가 버튼클릭시 그룹생성 영역 생김
function newgroup(){
	if(document.all.newgroup.style.display=="none"){
		document.all.newgroup.style.display="block";
		document.all.newgroup.chkg.checked="checked";
		$("#_gname").focus();
	}else{
		document.all.newgroup.style.display="none";
	}
}

</script>


</body>
</html>