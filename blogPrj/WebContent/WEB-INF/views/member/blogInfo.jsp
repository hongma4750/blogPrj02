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

<h1>여기는 블로그 정보</h1>

<div style="width:80%; height:100%; text-align:left;">
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
  				<input type="text" size="50" maxlength="25">

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
  				<input type="text" size="50" maxlength="10">	
  			</td>
  			<td><small style="color:gray;">한글, 영문, 숫자 혼용가능 (한글 기준 10자 이내)</small></td>
  		</tr>
  		
  		<tr>
  			<th >
				<p class="lead">소개글</p>
			</th>
  			<td>
  				<textarea rows="10" cols="50"></textarea>
  				&nbsp;
  				
  			</td>
  			
  			<td><small style="color:gray; vertical-align:top">
  				블로그 프로필 영역의<br>
				프로필사진 아래에 반영됩니다.<br>
				(한글 기준 200자 이내)
				</small></td>
  		</tr>
  		
  		<tr>
  			<th >
				<p class="lead">블로그 이미지</p>
			</th>
  			<td>
  				<img src="image/12.jpg" alt="..." class="img-rounded" style="width:350px;">	
  			</td>
  			<td>
  				<button>등록</button>
  				<button>삭제</button>
  			</td>
  		</tr>
  		
  		<tr>
  			<td colspan="3" style="text-align:center;">
  				<button>저장</button>
  			</td>
  		</tr>
  		
  		
  		
  		
	</table>
</div>