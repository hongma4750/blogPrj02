<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

    <fmt:requestEncoding value="utf-8"/>
    <%-- <tiles:insertAttribute name="common"/> --%>
   <!-- 블로그 글 작성 타일즈 -->  
<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header2"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
	
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog2.css"/>
<!-- css  -->
	
	
</head>


<body>
<div id="wrap2">

	<!-- 맨 위 헤더. 블로그 게시판들.. 로그아웃...이런거 -->
	<div id="2header" >
		<div id="header_logo2">
			<tiles:insertAttribute name="header_logo2"/>
		</div>
	</div>
	<!-- 맨 위 헤더 -->
	
	<br>
	
	
	<!-- 주요 포스팅 부분. 순서는 전체보기 / 글 리스트 순으로 보임 -->
	
	<div id="container2">
		<tiles:insertAttribute name="content2"/>
	</div>	
	<!-- 상단 프로필, 카테고리 부분 -->
	
	

	<br><br><br><br>
	
</div>

</body>
</html>