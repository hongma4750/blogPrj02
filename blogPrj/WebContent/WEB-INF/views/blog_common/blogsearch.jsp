<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.*" %>
    <%@ page import="sist.co.Model.*" %>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog_srch.css"/>
<!-- css  -->

<!--  페이징 -->
		  <%
			String pageobj = request.getParameter("page");
			int currentpage;
			if (pageobj == null) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(pageobj);
			}
			
			List<SistBlogPageDTO> plist = (List<SistBlogPageDTO>)request.getAttribute("blogSearPageList");
			List<SistBlogDTO> reList = (List<SistBlogDTO>)request.getAttribute("searchList");
			
			int pnum;
			int pageblock = 20;
			int block = (int) Math.ceil((double) currentpage / pageblock);
			int bstartpage = (block - 1) * pageblock + 1;
			int bendpage = bstartpage + pageblock - 1;
			pnum = (int) Math.ceil((double) reList.size() / 5);
		%>
	<!--  페이징 -->
	
	


<div id="scon">
	 <div class="navbar-form navbar-left" role="search">
	   <div class="form-group">
	     <input type="text" class="form-control" placeholder="Search">
	   </div>
	   <button type="submit" class="btn btn-default">Submit</button>
	 </div>
	

	<div class="search_con">
		<div class="s_top">
			<strong>검색결과</strong>
			<strong style="color: #FF7700;">[ ${fn:length(searchList)} ]건</strong>
			<div class="right_cat">
				<span style="color: #FF7700; font-weight: bold;">전체</span>&nbsp;
				<span class="sp2">|</span>
				<span>블로그</span>&nbsp;
				<span class="sp2">|</span>
				<span>안부</span>
			</div>
		</div>
		
		<c:forEach items="${searchList }" var="searchItem">
		<div class="srch_result">
			<div class="s_con">
				<a href="#none">정확도</a>&nbsp;&nbsp; |
				<a href="#none">최근작성일</a>&nbsp;&nbsp;
				<select style="width:138px; height: 20px;">
				   <option value="ca1">카테고리1</option>
				   <option value="ca2">카테고리2</option>
				   <option value="ca3">카테고리3</option>
				   <option value="ca4">카테고리4</option>
				</select> 
			</div>
			
			<div class="srch_content">
				<span class="s1">
					<a href="BbbsDetail.do">${searchItem.bbs_title}</a>
				</span>
				<span class="s2">&nbsp;|&nbsp;신촌</span>
				<span class="s3">${fn:substring(searchItem.bbs_date,0,12)}</span>
				<span class="s4">${searchItem.bbs_content }</span>
			</div>
		</div>
		</c:forEach>
		
		
	</div>
	
	
	
	
	<div class="srch_paginglist">
		  <nav>
							<ul class="pagination">
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">처음</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blogsearch.do?page=1">처음</a></li>
								<%
									}
								%>
			
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Previous"
									href="blogsearch.do?page=<%=currentpage - 1%>"><span
										aria-hidden="true">&laquo;</span></a></li>
								<%
									}
								%>
			
								<%
									if (bendpage > pnum) {
										bendpage = pnum;
									}
									for (int i = bstartpage; i <= bendpage; i++) {
										if (currentpage == i) {
								%>
								<li class='active'><a href="#"><%=i%></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blogsearch.do?page=<%=i%>"><%=i%></a></li>
								<%
									}
									}
								%>
			
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">&raquo;</span></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Next"
									href="blogsearch.do?page=<%=currentpage + 1%>"><span
										aria-hidden="true">&raquo;</span></a></li>
								<%
									}
								%>
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">끝</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blogsearch.do?page=<%=pnum%>">끝</a></li>
								<%
									}
								%>
							</ul>
						</nav> 
	</div>
</div>