<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sist.co.Model.*" %>

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
	List<SistTopicDTO> toList = (List<SistTopicDTO>)request.getAttribute("blist");
			
	int pnum;
	int pageblock = 20;
	int block = (int) Math.ceil((double) currentpage / pageblock);
	int bstartpage = (block - 1) * pageblock + 1;
	int bendpage = bstartpage + pageblock - 1;
	pnum = (int) Math.ceil((double) toList.size() / 5);
%>
<!--  페이징 -->

<!-- 여기는 주제별글보기 전체메뉴 영역 -->


<!-- 주제별 글보기 세부 메뉴(전체, 음악, 영화, 세계여행, 스포츠, 일상·생각) -->
<div id="topic_menu" class="topic_menu" style="position:relative; z-index:1; margin: 0; padding: 10px;" >

  <a href ='topiclist.do'>전체</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=1">음악</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=2">영화</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=3">스포츠</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=4">세계여행</a>
  &nbsp;&nbsp;&nbsp;&nbsp;<a href="topiclist1.do?t_seq=5">일상·생각</a>

<script type="text/javascript">
$(function(){
	 $(".latest").click(function(){
		location.href="topiclist.do?likes=1";
	});
	
});

$(function(){
	 $(".likes").click(function(){
		location.href="topiclistlike.do?likes=2";
	});
	
});
</script>


<!-- 최신순일때-->
<c:if test="${likes eq 1 }">
<script type="text/javascript">
$(function(){
	 $(".latest").attr("selected",true);
});
</script>
</c:if>

<!-- 공감순일때 -->
<c:if test="${likes eq 2 }">
<script type="text/javascript">
$(function(){
	 $(".likes").attr("selected",true);
});
</script>
</c:if>

<select>
	<option value="latest" class="latest">최신순</option>
	<option value="like" class="likes">공감순</option>
</select>

</div>
<hr class="topic_hr">


<c:if test="${empty topicPageList }">
	작성된 게시글 목록이 없습니다.
</c:if>  


<!-- 주제별글보기 리스트 -->

<c:forEach items="${topicPageList }" var="blog" varStatus="blogvar">
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
	<!-- 이웃이 아닌 사람일 때 뜨는 이웃추가 버튼 -->
	<button class="btn btn-default btn-xs" onclick="popupOpen();">이웃추가</button>
	</td>
	</tr>
	
	
	<tr>
	<td colspan="2" style="padding-right: 20px; width: 484px;">
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
		<img class="main_topic_img" src="./image/나의영화.jpg" alt="이미지없음" />
	</a>
	</td>
	</tr>
	</table>
</div>
</c:forEach>
<!-- 주제별글보기 리스트 끝 -->
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
				
				<c:if test="${likes eq 1 }">
				<li><a style="color: black;"
					href="topiclist.do?page=1">처음</a></li>
				</c:if>	
					
				<c:if test="${likes eq 2 }">
					<li><a style="color: black;"
					href="topiclistlike.do?page=1">처음</a></li>
				</c:if>
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
				
				<c:if test="${likes eq 1 }">
				<li><a style="color: black;" aria-lable="Previous"
					href="topiclist.do?page=<%=currentpage - 1%>"><span
					aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
				<c:if test="${likes eq 2 }">
					<li><a style="color: black;" aria-lable="Previous"
					href="topiclistlike.do?page=<%=currentpage - 1%>"><span
					aria-hidden="true">&laquo;</span></a></li>
				</c:if>
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
					
					<c:if test="${likes eq 1 }">
					<li><a style="color: black;"
							href="topiclist.do?page=<%=i%>"><%=i%></a></li>
					</c:if>
					
					<c:if test="${likes eq 2 }">
						<li><a style="color: black;"
						   href="topiclistlike.do?page=<%=i%>"><%=i%></a></li>
					</c:if>	
					
					
							
						
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
										
					<c:if test="${likes eq 1 }">
					<li><a style="color: black;" aria-lable="Next"
								href="topiclist.do?page=<%=currentpage + 1%>"><span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
					<c:if test="${likes eq 2 }">
						<li><a style="color: black;" aria-lable="Next"
								href="topiclistlike.do?page=<%=currentpage + 1%>"><span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>				
								
						
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
				
					<c:if test="${likes eq 1 }">
					<li><a style="color: black;"
								href="topiclist.do?page=<%=pnum%>">끝</a></li>
					</c:if>			
								
					<c:if test="${likes eq 2 }">
						<li><a style="color: black;"
								href="topiclistlike.do?page=<%=pnum%>">끝</a></li>
					</c:if>
				<%
				}
			%>
		</ul>
	</nav>
</div>



<script>
$(function () {
    $('#myTab a:last').tab('show')
});

function popupOpen(){
	var popUrl = "addfriend.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=400, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
		window.open(popUrl,"FollowPop",popOption);
}
</script>