<%@ page contentType="text/html; charset=UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<fmt:requestEncoding value="utf-8"/>

<script src="js/go_url.js"></script>

<style>
<%-- .menu_table 
li.menu_item 
a:hover{
	background-image:url("<%=request.getContextPath()%>/image/arrow.gif");
	background-repeat:no-repeat;
	background-position:5px 7px;
	background-color:#ffffff;
} --%>
</style>

<div class="menu_table">
	<ul style="width:100%;">
		<li class="title">답변형게시판</li>
		<li class="subtitle">답변형게시판</li>
		<li class="menu_item">
			<a href="#none" onclick="url_bbslist()" title="글목록">글목록</a>
		</li>
		<li class="menu_item">
			<a href="#none" onclick="url_bbswrite()" title="글쓰기">글쓰기</a>
		</li>
		
	</ul>
</div>