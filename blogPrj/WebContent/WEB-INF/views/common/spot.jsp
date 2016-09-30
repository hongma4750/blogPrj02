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
<style>
.img-responsive{
width: 200px;
height: 200px;
}
</style>

<script>
$(function(){
	
});


// 핫 토픽 부분
function hot1_over(){
	var a;
	
	$("#a1").css("display", "");
	$("#a2").css("display", "none");
	$("#a3").css("display", "none");
	
	$("#b1").css("display", "none");
	$("#b2").css("display", "none");
	$("#b3").css("display", "none");
}

function hot2_over(){
	var a;
	$("#a2").css("display", "");
	$("#a1").css("display", "none");
	$("#a3").css("display", "none");
	
	$("#b1").css("display", "none");
	$("#b2").css("display", "none");
	$("#b3").css("display", "none");
}

function hot3_over(){
	var a;
	$("#a3").css("display", "");
	$("#a1").css("display", "none");
	$("#a2").css("display", "none");
	
	$("#b1").css("display", "none");
	$("#b2").css("display", "none");
	$("#b3").css("display", "none");
}


// 오늘의 탑 부분
function top1_over(){
	var b;
	
	/* location.href="todaytop.do?=1"; */
	
	
	$("#b1").css("display", "");
	$("#b2").css("display", "none");
	$("#b3").css("display", "none");
	
	$("#a1").css("display", "none");
	$("#a2").css("display", "none");
	$("#a3").css("display", "none");
}

function top2_over(){
	var b;
	$("#b2").css("display", "");
	$("#b1").css("display", "none");
	$("#b3").css("display", "none");
	
	$("#a1").css("display", "none");
	$("#a2").css("display", "none");
	$("#a3").css("display", "none")
}

function top3_over(){
	var b;
	$("#b3").css("display", "");
	$("#b1").css("display", "none");
	$("#b2").css("display", "none");
	
	$("#a1").css("display", "none");
	$("#a2").css("display", "none");
	$("#a3").css("display", "none")
}



</script>

<div class="row" style="z-index:1;">
  <table>
  <col width="200px"/><col width="800px"/>
    <tr>
    <td>
	  <div style="margin-left: 15px;  width:138px; height:218px; background-color: #45B914; position: absolute;" >
	  <br><br>
	  <strong>Hot Topic</strong>
	    <ul>
	      <li><a href="#" onmouseover="hot1_over()">내가 만들었던 잼</a>
	      </li>
	      <li><a href="#" onmouseover="hot2_over()">인생샷</a> 
	      </li>
	      <li><a href="#" onmouseover="hot3_over()">건조한 가을에</a> 
	      </li>
	    </ul>
	    <strong>오늘의 TOP</strong>
	    <ul>
	      <li><a href="#" onmouseover="top1_over()">음악</a></li>
	      <li><a href="#" onmouseover="top2_over()">영화</a></li>
	      <li><a href="#" onmouseover="top3_over()">스포츠</a></li>      
	    </ul>
	  </div>
	  </td>
  
  <td>
  <div id="a1" style="padding: 30px; background-color: yellow; width: 700px; height: 218px;">
  	<!-- 사진 -->
    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
       	아무개님의 블로그
	</a>
	<!-- 글 내용 -->
    <ol  style="padding: 30px;">
			<li><a href="#">첫번째다</a></li>
			<li><a href="#">덕혜옹주(The Last Princess) [영화후기]</a></li>
			<li><a href="#">최근 본 영화 몇 편</a></li>
			<li><a href="#">인생영화 원스 어폰 어 타임 인 아메리카, 스크린으로 만나고 왔어요</a></li>
			<li><a href="#"><부산행> 좀비 생존 극기훈련 체험</a></li>
	</ol>
	
  </div>
  
  
  <div id="a2" style="padding: 30px; display: none; background-color: pink; width: 700px; height: 218px;">
  	<!-- 사진 -->
    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
		아무개님의 블로그
	</a>
	
	<!-- 글 내용 -->
    <ol  style="padding: 30px;">
			<li><a href="#">투번째다</a></li>
			<li><a href="#">덕혜옹주(The Last Princess) [영화후기]</a></li>
			<li><a href="#">최근 본 영화 몇 편</a></li>
			<li><a href="#">인생영화 원스 어폰 어 타임 인 아메리카, 스크린으로 만나고 왔어요</a></li>
			<li><a href="#"><부산행> 좀비 생존 극기훈련 체험</a></li>
	</ol>
	
  </div>
  
  
  <div id="a3" style="padding: 30px; display: none; background-color: lightblue; width: 700px; height: 218px;">
 	<!-- 사진 -->
    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
		아무개님의 블로그
	</a>
	
	<!-- 글 내용 -->
    <ol  style="padding: 30px;">
			<li><a href="#">삼번째다</a></li>
			<li><a href="#">덕혜옹주(The Last Princess) [영화후기]</a></li>
			<li><a href="#">최근 본 영화 몇 편</a></li>
			<li><a href="#">인생영화 원스 어폰 어 타임 인 아메리카, 스크린으로 만나고 왔어요</a></li>
			<li><a href="#"><부산행> 좀비 생존 극기훈련 체험</a></li>
	</ol>
	
  </div>
 
<c:if test="toplist"></c:if>


<!-- top 부분 시작 -->
	<div id="b1" style="padding: 30px; display: none; background-color: yellow; width: 700px; height: 218px;">
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<%-- <c:if test="${ }" --%>
	 	<!-- 사진 -->
	    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
	      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
			아무개님의 블로그
		</a>
	
	<ol style="padding: 30px;" type="disk">	
	<strong>음악</strong>
	
	 <c:forEach items="${toplist }" var="top" varStatus="topgvar">
		<!-- 글 내용 -->
		<li><a href="#">${top.bbs_title }</a></li>
	 </c:forEach>
	</ol>
  	</div>
  	
  	
  	<div id="b2" style="padding: 30px; display: none; background-color: pink; width: 700px; height: 218px;">
	 	<!-- 사진 -->
	    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
	      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
			아무개님의 블로그
		</a>
		
		<!-- 글 내용 -->
	    <ol  style="padding: 30px;">
		<strong>영화</strong>
		 <c:forEach items="${top_mlist }" var="top" varStatus="topgvar">
			<!-- 글 내용 -->
			<li><a href="#">${top.bbs_title }</a></li>
		 </c:forEach>
		</ol>
  	</div>
  	
  	
  	<div id="b3" style="padding: 30px; display: none; background-color: lightblue; width: 700px; height: 218px;">
	 	<!-- 사진 -->
	    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
	      <img src="image/see.jpg" class="img-responsive" alt="Responsive image"/>
			아무개님의 블로그
		</a>
		
		<!-- 글 내용 -->
	    <ol  style="padding: 30px;">
		<strong>스포츠</strong>
		 <c:forEach items="${top_slist }" var="top" varStatus="topgvar">
			<!-- 글 내용 -->
			<li><a href="#">${top.bbs_title }</a></li>
		 </c:forEach>
		</ol>
  	</div>

<!-- top 부분 끝 -->
  </td>
  
  </tr>
  </table>
</div>




