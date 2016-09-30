<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sist.co.Model.*" %>
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

<!--  페이징 -->
<%
	String pageobj = request.getParameter("page");
	int currentpage;
	if (pageobj == null) {
	currentpage = 1;
	} else {
	currentpage = Integer.parseInt(pageobj);
	}
			
	List<SistTopicPageDTO> plist = (List<SistTopicPageDTO>)request.getAttribute("topicPageList");
	List<SistBlogDTO> toList = (List<SistBlogDTO>)request.getAttribute("blist");
			
	int pnum;
	int pageblock = 20;
	int block = (int) Math.ceil((double) currentpage / pageblock);
	int bstartpage = (block - 1) * pageblock + 1;
	int bendpage = bstartpage + pageblock - 1;
	pnum = (int) Math.ceil((double) toList.size() / 5);
%>
<!--  페이징 -->
 
<div id="topic_menu" class="topic_menu" style="position:relative; z-index:110; margin: auto 0; padding-top: 10px;">
<p style="vertical-align: middle;">최신글 순으로 보실 수 있습니다.&nbsp;</p>
</div> 
 
<c:if test="${empty topicPageList }">
	작성된 게시글 목록이 없습니다.
</c:if>  

<c:forEach items="${topicPageList }" var="blog" varStatus="blogvar">
<div style="height: 124px; width: 713xp;" >
<table style="width:713px; " >
<col width="100px;"><col width="464x;">
	<tr>
		<td rowspan="3" style="padding: 0px;">
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
		<a href="#" class="main_topic_con" > 
	
		<c:if test="${fn:length(blog.bbs_content) >=110}" >
			${fn:substring( blog.bbs_content,0,110)}···
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
<!-- 주제별글보기 리스트 끝-->
<br>
<br>
<br>
<br>
<div class="row" style="margin:auto; padding:auto; text-align:center;">
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
					href="topicall.do?page=1">처음</a></li>
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
					href="topicall.do?page=<%=currentpage - 1%>"><span
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
							href="topicall.do?page=<%=i%>"><%=i%></a></li>
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
								href="topicall.do?page=<%=currentpage + 1%>"><span
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
								href="topicall.do?page=<%=pnum%>">끝</a></li>
				<%
				}
			%>
		</ul>
	</nav>
</div>

<script type="text/javascript">

function newrecommend(){
	if(document.all.recommendbox_hide.style.display=="none"){
		document.all.recommendbox_hide.style.display="block";
	}else{
		document.all.recommendbox_hide.style.display = "none";
	}
}

 



</script>