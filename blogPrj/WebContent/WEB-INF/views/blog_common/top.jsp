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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog.css"/>
<!-- css  -->

<div class="topwrap">
	<!-- 프사 -->
	<div class="row"  style="display:inline-block; float:left;">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img src="image/see.jpg" class="img-responsive" alt="Responsive image">
	      <div class="caption">
	        <p>...자기소개</p>
	        <p><a href="bbswrite.do">포스트쓰기</a> &nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; <a href="#none">관리</a></p>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- 카테고리 -->
	<div class="category" style="display:inline-block;">
		<strong>카테고리</strong> <br>
			<ul class="cat">
				<li><a href="#none" title="total"><strong>전체보기(24)</strong></a></li>
				<li><a href="#none" title="java">java</a></li>
				<li><a href="#none" title="jsp">jsp</a></li>
				<li><a href="#none" title="spring">spring</a></li>
				<li><a href="#none" title="css">css</a></li>	
			<hr>
				<li><a href="pictype.do" title="pictype">앨범형</a></li>
				<li><a href="#none" title="sin">신촌</a></li>
				<li><a href="#none" title="hong">홍대</a></li>
			<hr>
				<li><a href="#none" title="test">test</a></li>		
			</ul>
	</div>
	
	<div class="lreple">
		<strong>최근 댓글</strong>
		<p>1111</p>
		<p>2222</p>
	</div>
</div>
