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

<title>이웃추가</title>
</head>
<body>
<%String blogId=request.getParameter("blogId"); %>

<!-- 이웃추가 팝업 (이웃그룹지정) -->

<!-- 그룹지정, 그룹추가, 공개여부 -->

<h5><b>&nbsp;&nbsp;이웃 추가</b></h5>
<hr/>

<form action="addfriendAF.do" method="post" id="_myform" name="myform">

<div style="margin:20px;">
    <span style="color:#2eaa08;"><b><%=blogId %></b></span> 을 추가할 그룹을 선택해주세요.
  <br><br>
  
  <input type="hidden" name="fnd_fndid" value="<%=blogId %>"/>
  <input type="hidden" name="fnd_myid" value="${login.m_id }"/>
  <input type="hidden" name="fnd_chk" value="1"/>

  
  <div style="float: left;">그룹선택&nbsp;</div>

			<select id="_selgroup" name="fnd_groupname" class="form-control input-sm" style="width: 200px; float: left;">
			  <c:forEach items="${glist }" var="gl">
				<option value="${gl.fg_groupname }">${gl.fg_groupname }</option>
				
			  </c:forEach>
			</select> 
		&nbsp;<a id="_addG" class="btn btn-default btn-xs" onclick="newgroup();">그룹추가</a>
		<br><br>
  
  <div id="newgroup" style="display:none">
  &nbsp;&nbsp;<input id="_chkg" name="chkg" type="checkbox"/> <input type="text" id="_gname" name="" data-msg="그룹명을" value="새 그룹"/>
  
  <select name="fg_openchk"><option selected="selected" value="0">공개</option><option value="1">비공개</option></select>
  </div>
  
</div>

</form>
  
<hr/>
<div align="center">
<button type="button" id="_btnOk" onclick="popupClose();" class="btn btn-default btn-sm">확인</button>
<a class="btn btn-default btn-sm" onclick="popupClose();">취소</a>
</div>


<script>
//탭클릭하면 밸류값을...?적다말음
$(function(){
	$("li").click(function(value){
		$("li").value(this)
	});
});

//서로이웃받기여부 확인버튼
$("#_btnOk").click(function name(){
	if($("#_gname").val()==""){
		alert($("#_gname").attr("data-msg") + " 입력하세요");
		$("#_gname").focus();
	}else{
		$("#_myform").attr({"target":"_self", "action":"addfriendAF.do"}).submit();
	}
	
});

//팝업창닫기
function popupClose(){
	window.close();
}

//그룹추가 버튼클릭시 그룹생성 영역 생김
function newgroup(){
	if(document.all.newgroup.style.display=="none"){
		document.all.newgroup.style.display="block";
		
		$("#_gname").focus();
	}else{
		document.all.newgroup.style.display="none";
	}
}


//ajax로 바꾸기
function checkChk(){
	$.ajax({
		type:"POST",
		url:"./.do", //controller로
		async:true,
		data:"",
		success:function(a){
			outputList(a);
	}
		
});
	
function outputList(a){	
	//그룹추가 버튼클릭시//그룹추가 버튼클릭시
}

}
/* if($("input:checkbox[id='_chkg']").prop("checked",false)){
			//체크false일때
			
}
$("#_addG").click(function(){
		alert('ok');
		if($("input:checkbox[id='_chkg']").prop("checked",false)){
			//체크false일때
			
		}else{
			//체크true일때
			alert(ok);
			//기존 그룹 name값을 변경하고
			$("#_selgroup").attr('name','');
			alert($("#_selgroup").attr('name'));
			
			//input type=text의 name을 넘기기
			$("#_gname").attr('name','fnd_groupname');
			alert($("#_gname").attr('name'));
		}
}); */
</script>

</body>
</html>