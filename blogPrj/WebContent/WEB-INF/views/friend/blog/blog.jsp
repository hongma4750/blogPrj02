<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value ="utf-8"/>  

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->


<!-- 기본적으로 로그인했을때 뜨는 페이지임 -->
<%-- <c:if test="${login.id not eq null}"> --%>
<!-- 블로그(로그인 여부에따라 내블로그 또는 이웃블로그, 추천블로그) -->

   <!-- 내 블로그이면 -->
<%-- <c:if test="${bbs.id eq login.id }"> --%>
<a href='settingmain.do'>관리</a>
<%-- </c:if> --%>

<!-- 이웃블로그이면 -->
<%-- <c:if test="${bbs.id not eq login.id }"> --%>

<%-- </c:if> --%>

<%-- </c:if> --%>