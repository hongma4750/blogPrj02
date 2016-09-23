<%@ page contentType="text/html; charset=UTF-8"%>
     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>

<div id="top_menu_wrap">
	<div id="_top_menu">
		<ul class="navi">
			<li><a href="bbslist.do" title="Home">Home</a></li>
			<li><a href="bbslist.do" title="답변형게시판">답변형게시판</a></li>
			<li><a href="calendar.do" title="일정">일정</a></li>
			<li><a href="calendar2.do" title="아작스일정">아작스일정</a></li>
			<li><a href="pdslist.do" title="자료실">자료실</a></li>
			<c:if test="${login.auth == 1 }">
				<li><a href="pollmake.do" title="자료실">투표만들기</a></li>
			</c:if>
			<li><a href="polllist.do" title="자료실">투표하기</a></li>
			
		</ul>
	</div>

</div>