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


		<c:if test="${login.m_id ne null }">
			<c:if test="${login.m_id eq finfo.m_id}"> <!-- 같으면 내 블로그. -->
				<div class="topwrap">
					<!-- 프사 -->
					<div class="row"  style="display:inline-block; float:left;">
					  <div class="col-sm-6 col-md-4">
					    <div class="thumbnail">
					      <img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
					      <div class="caption">
					      	<p style="font-weight: bold; font-size: 9pt;">${login.m_id }</p>
					        <span>...자기소개</span>
					         <!-- 마이페이지로 갈때 아이디 전달해줘야함 -->
			        		<span><button class="btn btn-warning" style="font-size:7px; width:25px; height:13px; padding:0;" onclick="location.href='myPage.do'">EDIT</button></span>
					        <p><a href="bbswrite.do">포스트쓰기</a> &nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; <a href="#none">관리</a></p>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					<!-- 카테고리 -->
					<div class="category" style="display:inline-block;">
						<strong>카테고리</strong> <br>
							<ul class="cat">
								<li><a href="#none" title="total"><strong>전체보기(20)</strong></a></li>
								<li><a href="#none" title="mymy">내블로그야</a></li>
								<li><a href="#none" title="hi">안녕</a></li>
								<li><a href="#none" title="spring">spring</a></li>
								<li><a href="#none" title="summber">summber</a></li>
							<hr>
								<li><a href="pictype.do" title="pictype">앨범형</a></li>
								<li><a href="#none" title="sin">신촌</a></li>
								<li><a href="#none" title="hong">홍대</a></li>
							<hr>
								<li><a href="#none" title="test1">test1</a></li>		
							</ul>
					</div>
					
					<div class="lreple">
						<strong>최근 댓글</strong>
						<p>1111</p>
						<p>2222</p>
					</div>
				</div>
			</c:if>
			<c:if test="${login.m_id ne finfo.m_id}"> <!-- 다르면 다른사람 블로그. -->
				<div class="topwrap">
					<!-- 프사 -->
					<div class="row"  style="display:inline-block; float:left;">
					  <div class="col-sm-6 col-md-4">
					    <div class="thumbnail">
					      <img src="${finfo.m_photo }" class="img-responsive" alt="Responsive image">
					      <div class="caption">
					      	<p style="font-weight: bold; font-size: 9pt;">${finfo.m_id }</p>
					        <p>...자기소개</p>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					<!-- 카테고리 -->
					<div class="category" style="display:inline-block;">
						<strong>카테고리</strong> <br>
							<ul class="cat">
								<li><a href="#none" title="total"><strong>전체보기(10)</strong></a></li>
								<li><a href="#none" title="other">other</a></li>
								<li><a href="#none" title="winter">winter</a></li>
								<li><a href="#none" title="hello">hello</a></li>
								<li><a href="#none" title="ha">ha</a></li>
							<hr>
								<li><a href="pictype.do" title="pictype">앨범형</a></li>
								<li><a href="#none" title="md">명동</a></li>
								<li><a href="#none" title="lee">이대</a></li>
							<hr>
								<li><a href="#none" title="test3">test3</a></li>	
								<li><a href="#none" title="test4">test4</a></li>	
							</ul>
					</div>
					
					<div class="lreple">
						<strong>최근 댓글</strong>
						<p>3333</p>
						<p>4444</p>
					</div>
				</div>
			</c:if>  
		</c:if>
		<c:if test="${login.m_id eq null }">
			<div class="topwrap">
					<!-- 프사 -->
					<div class="row"  style="display:inline-block; float:left;">
					  <div class="col-sm-6 col-md-4">
					    <div class="thumbnail">
					      <img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
					      <div class="caption">
					     	<p style="font-weight: bold; font-size: 9pt;">세션아웃됐오</p>
					        <p>...세션아웃</p>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					
					<!-- 카테고리 -->
					<div class="category" style="display:inline-block;">
						<strong>카테고리</strong> <br>
							<ul class="cat">
								<li><a href="#none" title="total"><strong>전체보기(30)</strong></a></li>
								<li><a href="#none" title="sout">세션아웃</a></li>
								<li><a href="#none" title="out">아웃됐어</a></li>
								<li><a href="#none" title="comelog">로그인하고와</a></li>
							<hr>
								<li><a href="pictype.do" title="pictype">앨범형</a></li>
								<li><a href="#none" title="ma">메인</a></li>
								<li><a href="#none" title="getout">갔다와</a></li>
							<hr>
								<li><a href="#none" title="test5">test55</a></li>	
							</ul>
					</div>
					
					<div class="lreple">
						<strong>최근 댓글</strong>
						<p>5555</p>
						<p>6666</p>
					</div>
				</div>	
		</c:if>