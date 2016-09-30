<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
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

<!-- 여기는 전체 메뉴 영역 -->
  <script type="text/javascript">
  $(function () {
	    $('#myTab a:first').tab('show')
	});
  </script>

<c:forEach items="${blist }" var="blog" varStatus="blogvar">
<div style="height: 124px; width: 713xp;" >
<table style="width:713px; " >
<col width="100px;"><col width="464x;">
	<tr>
		<td rowspan="3">
		<a href="#">
			<img class="main_topic_img" src="./image/나의영화.jpg" alt="이미지없음" />
		</a>
		</td>
		
		<td height="20px;">
		<!-- 제목[댓글수] -->
			<h5>
			<a class="main_topic_title">${blog.bbs_title }</a>
			<span style="color:#ff0000; font-size: 12px;">
			[
			<em>n</em>
			]
			</span>
			</h5>
		<!-- 제목[댓글수] 끝-->
		</td>
	</tr>
	
	<tr>
		<td height="20px;">
		<!-- 별명,작성일,공감수 -->
		<a class="main_topic_blgname">블로그 이름</a>&nbsp;
		<span class="main_topic_blgdate"> ${fn:substring(blog.bbs_date,0,16) }</span>&nbsp;
		<span class="main_topic_like">공감 ${blog.bbs_like_count }</span>
		</td>
	</tr>
	
	
	<tr>
		<td height="50px;">
		<!-- 내용 -->
		<a href="#" class="main_topic_con"> 
	
		<c:if test="${fn:length(blog.bbs_content) >=110}" >
			${fn:substring(blog.bbs_content,0,110)}···
		</c:if> 
		
		<c:if test="${fn:length(blog.bbs_content)< 110}" >
			${blog.bbs_content }
		</c:if> 
	
		</a>
		</td>
	</tr>
	</table>
</div>
</c:forEach>

<!-- 주제별글보기 리스트 -->





<!-- 페이징 -->
<div align="center">
<nav aria-label="Page navigation">
  <ul class="pagination pagination-sm">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
<!-- 페이징 -->





<script type="text/javascript">

function newrecommend(){
	if(document.all.recommendbox_hide.style.display=="none"){
		document.all.recommendbox_hide.style.display="block";
	}else{
		document.all.recommendbox_hide.style.display = "none";
	}
}

 



</script>