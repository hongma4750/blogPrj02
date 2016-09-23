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

<title>이웃맺기 승낙</title>
</head>
<body>

<!-- 서로이웃맺기 -->

<%String blogId=request.getParameter("blogId"); 
String seq=request.getParameter("seq");%>

<h5><b>&nbsp;&nbsp;서로이웃 맺기</b></h5>
<hr/>

	<form action="acceptSucs.do?blogId=<%=blogId %>&seq=<%=seq%>" method="post" id="_myform" name="myform">

		<div style="margin: 20px;">
			<span style="color: #2eaa08;"><b><%=blogId%></b></span> 님의 서로이웃 신청을
			수락합니다.<br>등록할 그룹을 선택해 주세요. <br>

			<div style="float: left;">그룹선택&nbsp;</div>

			<select id="_selgroup" name="fnd_groupname"
				class="form-control input-sm" style="width: 200px; float: left;">
				<c:forEach items="${glist }" var="gl">
					<option value="${gl.fg_groupname }">${gl.fg_groupname }</option>
					<input type="hidden" name="gname" value="${gl.fg_groupname }"/>

				</c:forEach>
			</select> &nbsp;<a id="_addG" class="btn btn-default btn-xs"
				onclick="newgroup();">그룹추가</a> <br>
			<br>

			<div id="newgroup" style="display: none">
				&nbsp;&nbsp;<input id="_chkg" name="chkg" type="checkbox" /> <input
					type="text" id="_gname" name="" data-msg="그룹명을" value="새 그룹" /> <select
					name="fg_openchk"><option selected="selected" value="0">공개</option>
					<option value="1">비공개</option></select>
			</div>

		</div>
	</form>


	<hr />
	<br>


	<div align="center">
		<button type="button" class="btn btn-default btn-sm"
			id="_Ok" onclick="popupNext();">다음</button>
		<button type="button" class="btn btn-default btn-sm"
			onclick="popupClose();">취소</button>
	</div>


	<script>
function popupClose(){
	window.close();
}


//서로이웃승낙팝업으로 이동
<%-- function popupNext(){
	location.href="acceptSucs.do?blogId=<%=blogId %>&seq=<%=seq%>";
} --%>
$("#_Ok").click(function name(){
	$("#_myform").attr({"target":"_blank", "action":"acceptSucs.do?blogId=<%=blogId %>&seq=<%=seq%>"}).submit();	
});

//그룹추가 버튼클릭시 그룹생성 영역 생김
function newgroup(){
	if(document.all.newgroup.style.display=="none"){
		document.all.newgroup.style.display="block";
		
		$("#_gname").focus();
	}else{
		document.all.newgroup.style.display="none";
	}
}

</script>


</body>
</html>