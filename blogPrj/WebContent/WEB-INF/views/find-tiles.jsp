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

<style>
	html,body{
		margin:0; padding:0; height:100%;
	}
</style>
<body>

<div id="fint_wrap" style="height:100%;" >
	<div id="find_header" style="height:10%;">
		<div >
			<tiles:insertAttribute name="find_header"/>
		</div>
		
		<div >
			<tiles:insertAttribute name="find_nav"/>
		</div>
		
	</div>
	
	<div id="find_content" style="height:88%">
		<tiles:insertAttribute name="find_content"/>
	</div>
	
	<div id="find_footer" style="height:15px;">
		<tiles:insertAttribute name="find_footer"/>
	</div>

</div>






</body>
</html>