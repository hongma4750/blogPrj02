<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

    <fmt:requestEncoding value="utf-8"/>
    <%-- <tiles:insertAttribute name="common"/> --%>
     
<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
</head>
<body>
<div id="wrap">

	<!-- 맨 위 헤더 -->
	<div id="header" >
		<div id="header_logo">
			<tiles:insertAttribute name="header_logo"/>
		</div>
		
		<div id="header_nav"><!-- id="header_nav" --> 
			<tiles:insertAttribute name="header_nav"/>
		</div>
	</div>
	<!-- 맨 위 헤더 -->

	<br>
	<!-- 중간 위 스팟 내용들 바뀌는 부분 -->
	
	<div id="spot" style="background-color:#fff;border: 5px solid #666;">
		<tiles:insertAttribute name="spot"/>
	</div>
	
	
	<!-- 중간 위 스팟 내용들 바뀌는 부분 -->
	<br>
	
	<!-- 중간 제일 중요한 부분 -->
	<div id="container" >
		<!-- 중간-왼쪽  <블로그 추천 부분> -->
		<div id="blogArea" style="background-color:red;">
			<tiles:insertAttribute name="blogArea"/>
		</div>
		<!-- 중간-왼쪽  <블로그 추천 부분> -->
		
		
		<!-- 중간-중간  <이웃소식,글 추천> -->
		<div id="content"  >
			<tiles:insertAttribute name="content"/>
		    
		    <div id="main"  >
			  <tiles:insertAttribute name="main"/>
		    </div>
		    
		</div>
		<!-- 중간-중간  <이웃소식,글 추천> -->
		
		
		
		<!-- 중간-오른쪽  <로그인박스, 공지사항> -->
		<div id="template_aside" style="background-color:#FFB2D9;">
			<div id="login_box" >
				<tiles:insertAttribute name="login_box"/>
			</div>
			
			<div id="noticeArea">
				<tiles:insertAttribute name="noticeArea"/>
			</div>
		</div>
		<!-- 중간-오른쪽  <로그인박스, 공지사항> -->
	</div>
	
	<!-- 중간 제일 중요한 부분 -->
	<br><br><br><br>
	
	
	<!-- 맨 아래 푸터 부분 -->
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	<!-- 맨 아래 푸터 부분 -->
	
</div>

</body>
</html>