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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog_srch.css"/>
<!-- css  -->


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
			<strong style="color: #FF7700;">0건</strong>
			<div class="right_cat">
				<span style="color: #FF7700; font-weight: bold;">전체</span>&nbsp;
				<span class="sp2">|</span>
				<span>블로그</span>&nbsp;
				<span class="sp2">|</span>
				<span>안부</span>
			</div>
		</div>
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
					<a href="BbbsDetail.do">안녕 네이버 검색기준 왜 자기 멋대로?</a>
				</span>
				<span class="s2">&nbsp;|&nbsp;신촌</span>
				<span class="s3">2016.08.31. 17:49</span>
				<span class="s4">내용이 여기룽우 들어온당^^</span>
			</div>
		</div>
	</div>
	
	<div class="srch_paginglist">
		<span class="sp1">1</span>&nbsp;
		<span class="sp2">|</span>
	</div>
</div>