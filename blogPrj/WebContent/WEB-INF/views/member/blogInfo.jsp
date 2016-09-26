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

<form action="updateBlog.do" method="post" >
<div style="width:90%; height:100%; margin:10px; padding:10px;">

	<div style="width:100%; height:100%; text-align:left;">
		<h2>블로그 정보</h2>
	
		<table class="table table-hover" style="">
			<col style="width:15%;"/>
			<col style="width:27%;"/>
			<col style="width:auto"/>
			
	  		<tr>
	  			<th >
					<p class="lead">제목</p>
				</th>
	  			<td>
	  				<input type="hidden" name="m_id" value="${blogInfo.m_id }">
	  				<input type="hidden" name="blog_seq" value="${blogInfo.blog_seq }">
	  				<input type="text" size="50" maxlength="25" value="${blogInfo.blog_title }" name="blog_title">
	
	  			</td>
	  			<td>
	  			<small style="color:gray;">한글, 영문, 숫자 혼용가능 (한글 기준 25자 이내)</small>
	  			</td>
	  		</tr>
	  		
	  		<tr>
	  			<th >
					<p class="lead">별명</p>
				</th>
	  			<td>
	  				<input type="text" size="50" maxlength="10" value="${blogInfo.blog_nickname }" name="blog_nickname">	
	  			</td>
	  			<td><small style="color:gray;">한글, 영문, 숫자 혼용가능 (한글 기준 10자 이내)</small></td>
	  		</tr>
	  		
	  		<tr>
	  			<th >
					<p class="lead">소개글</p>
				</th>
	  			<td>
	  				<textarea rows="10" cols="50" name="blog_introduce">${blogInfo.blog_introduce }</textarea>
	  				&nbsp;
	  				
	  			</td>
	  			
	  			<td><small style="color:gray; vertical-align:top">
	  				블로그 프로필 영역의<br>
					프로필사진 아래에 반영됩니다.<br>
					(한글 기준 200자 이내)
					</small></td>
	  		</tr>

	  		
	  		<tr>
	  			<td colspan="3" style="text-align:center;">
	  				<input type="submit" value="저장">
	  			</td>
	  		</tr>
	  		
	  		
	  		
	  		
		</table>
	</div>
</div>
</form>
