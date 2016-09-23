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
String seq=request.getParameter("seq");
String gname=request.getParameter("gname");
%>

<h5><b>&nbsp;&nbsp;서로이웃 맺기</b></h5>

<hr/>

<b><%=blogId%></b> 님과 서로이웃이 맺어졌습니다.<br>

	<hr />
	<br>


	<div align="center">
		<button type="button" class="btn btn-default btn-sm"
			onclick="popupClose();">확인</button>
	</div>


	<script>
function popupClose(){
	window.close();
}

</script>


</body>
</html>