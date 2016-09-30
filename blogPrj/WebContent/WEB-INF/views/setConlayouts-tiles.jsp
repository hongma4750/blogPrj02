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

	
	
		
	<!-- 중간 제일 중요한 부분 -->
	<div id="container" >


		<!-- 이웃설정 -->
		<div id="content" style="width:750px;background-color: #fff;">
			<tiles:insertAttribute name="content" />
			<!-- 탭내용 -->
			<div id="main" style="background-color: #fff;">
				<tiles:insertAttribute name="main" />
			</div>
			<!-- 탭내용 -->
		</div>
		<!-- 이웃설정 -->
		
	</div>
	
	<br><br><br><br>
	
	
	<!-- 맨 아래 푸터 부분 -->
	<div id="footer" style="background-color:skyblue;">
		<tiles:insertAttribute name="footer"/>
	</div>
	<!-- 맨 아래 푸터 부분 -->
	
</div>

</body>
</html>