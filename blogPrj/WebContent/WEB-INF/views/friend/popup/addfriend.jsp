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

<!-- 이웃추가 팝업 (이웃, 서로이웃 선택 가능한 팝업) -->

<%String sblogid=request.getParameter("blogid"); %>

<h5><b>&nbsp;&nbsp;이웃 추가</b></h5>

<hr/>

<pre style="margin: 20px;">
<b><%=sblogid%></b> 님과 <input type="radio" id="chkf" name="addFriend" checked="checked" value="follow"/> <label for="chkf"><b>이웃</b></label> <input type="radio" id="chkdblf" name="addFriend" onclick="" value="dbfollow"/> <label for="chkdblf"><b>서로이웃</b></label> 을 맺습니다
</pre>

<hr/>
<br>
<div align="center">

<button type="button" class="btn btn-default btn-sm" onclick="popNext();">다음</button>
<button type="button" class="btn btn-default btn-sm" onclick="popupClose();">취소</button>
</div>


<script>
function popupClose(){
	window.close();
}

function popNext(){
	
	if($('input:radio[name="addFriend"]:checked').val()=="follow"){
		location.href="addfollowGroup.do?blogId=<%=sblogid %>";
	}else{
		location.href="adddblfollowGroup.do?blogId=<%=sblogid %>";
	}	
}
</script>


</body>
</html>