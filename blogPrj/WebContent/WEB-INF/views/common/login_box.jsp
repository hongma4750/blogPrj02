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

<div style="width:100%; background-color:white; height:100%; text-align:center; ">

	
	
	
	<c:choose>
		<c:when test="${login.m_id ne null }">
			<a href="blog.do" title="내 블로그 가기">내 블로그 가기</a>
			
			<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active" data-target="#layerpop" data-toggle="modal"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">내 블로그 소식</a></li>
  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">내가 남긴 글</a></li>
</ul>
<a href="blog.do">오늘 방문수 n</a>&nbsp;&nbsp;&nbsp;<a href="setdblfollow.do">서로이웃 신청 n</a> 
<br><br>
홍마님이 서로이웃 신청을 했습니다. X
어제
<hr>
<strong>댓글</strong> 2016년 8월 30일 오후5...[1]
by홍마 어제
<br>
<br>

<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active" ><a href="settingmain.do" >내B이웃설정</a></li>
  <li role="presentation" class="active" ><a href="#none" >글쓰기</a></li>
  <li role="presentation" class="active" ><a href="blog.do" >이웃B</a></li>
</ul>

<!-- 이웃블로그 버튼 클릭_이웃리스트 div -->
<div id="friendlist" style="position:absolute; top:40px; z-index:3; 
     background-color: #fff; border:1px solid #000;width:300px; display: none;">
  <button type="button" id="btnClose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <select><option selected="selected">그룹전체</option></select>
</div>

		</c:when>
		<c:otherwise>
			<div class="row" style="text-align:left; margin:auto; padding:auto;">
		<small>내 블로그에 글을 남기려면</small>
	</div>
	<br>
	
	<div class="row" style="">
		<div class="col-md-12" style="">
			<button type="button" class="form-control btn btn-primary" style="" onclick="location.href='login.do'">로그인</button>
		</div>
	</div>
	
	
	<div>
		<div style="text-align:left; display:inline-block; float:left;">
			<small ><a href="idfind.do?menu=id" style="color:#A6A6A6; text-decoration: none;">아이디 찾기</a></small>
			<small>|</small>
			<small><a href="pwfind.do?menu=pw" style="color:#A6A6A6; text-decoration: none;">비밀번호 찾기</a></small>
		</div>
		
		<div style="text-align:right; display:inline-block;">
			<small><a href="regi.do" style="color:#A6A6A6; text-decoration: none;">회원가입</a></small>
		</div>
	</div>
		</c:otherwise>
	</c:choose>
	
</div>
