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

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog2.css"/>
<!-- css  -->


<!-- 블로그 제목 -->
<div class="wheader">
  <div class="navbar-header">
  	<a class="navbar-brand" href="index.do">꽃밭에 홍미니</a> | 
    <a class="navbar-brand" href="blog.do">ssun블로그</a>
  </div>

	<!-- 상단 이동 메뉴  - 로그인,블로그홈-->
	<div class="head_move" style="float:right;">
		<a href="#none" title="friend">이웃블로그</a> | 
		<a href="index.do" title="index">블로그 홈</a> | 
		<a href="#none" title="idmenu">아이디</a> 
	</div>
</div>



