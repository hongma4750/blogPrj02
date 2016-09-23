<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

    <fmt:requestEncoding value="utf-8"/>
    <%-- <tiles:insertAttribute name="common"/> --%>
   <!-- 블로그 레이아웃 타일즈 -->  
<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog.css"/>
<!-- css  -->
</head>

<body>
<div id="wrap">

	<!-- 맨 위 헤더. 블로그 게시판들.. 로그아웃...이런거 -->
	<div id="header" >
		<div id="header_logo"">
			<tiles:insertAttribute name="header_logo"/>
		</div>
		<div id="header_line">
			<tiles:insertAttribute name="header_line"/>
		</div>
	</div>
	<!-- 맨 위 헤더 -->

	
	<!-- 상단 프로필, 카테고리 부분 -->
	
	<div id="top">
		<tiles:insertAttribute name="top"/>
	</div>	
	<!-- 상단 프로필, 카테고리 부분 -->
	
	<br>
		
	<!-- 주요 포스팅 부분. 순서는 전체보기 / 글 리스트 순으로 보임 -->
	
	<div id="container">
		<tiles:insertAttribute name="content"/>
	</div>	
	<!-- 상단 프로필, 카테고리 부분 -->
	
	

	<br><br><br><br>
	
	
	<!-- 맨 아래 푸터 부분. 다녀간 블로거, 검색 부분이 들어옴-->
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	<!-- 맨 아래 푸터 부분 -->
	
</div>

</body>
</html>