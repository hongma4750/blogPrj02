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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/calstyle.css"/>
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

	
	<!-- 중간-->
	<div id="container" >
		<div id="left_callist" style="background-color:white;">
			<tiles:insertAttribute name="left_callist"/>	
		</div>
			
		<div id="section_cen" style="">
			<tiles:insertAttribute name="section_cen"/>
		</div>
		
	</div>

	
	<%-- <div id="footer" style="background-color:skyblue;">
		<tiles:insertAttribute name="footer"/>
	</div> --%>
	
</div>

</body>
</html>