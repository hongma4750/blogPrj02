<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:requestEncoding value ="utf-8"/> 

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->


<link href="css/topic.css" rel="stylesheet">
<style>

</style>

<!-- 여기는 주제별글보기 전체메뉴 영역 -->


<!-- 주제별 글보기 세부 메뉴(전체, 음악, 영화, 세계여행, 스포츠, 일상·생각) -->
<div id="topic_menu" class="topic_menu" style="position:relative; z-index:1; margin: 0; padding: 10px;" >

  <a href ='topiclist.do'>전체</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=1">음악</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=2">영화</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=3">세계여행</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=4">스포츠</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=5"> 일상·생각</a>
 
</div>
<hr class="topic_hr">

<!-- 주제별글보기 리스트 -->

<c:forEach items="${blist }" var="blog" varStatus="blogvar">
<div style="height: 142px;">
<table style="width:500px; " >
<col width="464px;">
	<tr>
	<td colspan="2">
	<!-- 제목[댓글수] -->
	<h5>
	<a href="BbbsDetail.do?${blog.bbs_seq }" class="main_topic_title">${blog.bbs_title }</a>
	<span style="color:#ff0000; font-size: 12px;">
	[
	<em>n</em>
	]
	</span>
	
	</h5>
	</td>
	</tr>
	
	<tr>
	<td colspan="2">
	<!-- 별명,작성일,공감수 -->
	<a class="main_topic_blgname">블로그 이름</a>&nbsp;
	<span class="main_topic_blgdate">${fn:substring(blog.bbs_date,0,16) }</span>&nbsp;
	<span class="main_topic_like">공감 ${blog.bbs_like_count }</span>
	</td>
	</tr>
	
	
	<tr>
	<td colspan="2" style="padding-right: 20px;">
	<!-- 내용 -->
	<a href="#" class="main_topic_con" >
	<c:if test="${fn:length(blog.bbs_content) >=110}" >
		${fn:substring( blog.bbs_content,0,90)}···
	</c:if> 
		
	<c:if test="${fn:length(blog.bbs_content)< 110}" >
		${blog.bbs_content }
	</c:if> 	
	</a>
	</td>
	<td colspan="2" style=>
	<a href="#">
		<img class="main_topic_img" src="./image/나의영화.jpg" alt="이미지없음"  style="width:70px;height:70px;"/>
	</a>
	</td>
	</tr>
	</table>
</div>
</c:forEach>

<!-- 주제별글보기 리스트 -->


<script>
$(function () {
    $('#myTab a:last').tab('show')
});
</script>