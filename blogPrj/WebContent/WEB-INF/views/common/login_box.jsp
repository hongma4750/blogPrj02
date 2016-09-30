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
		
		
			<a href="blog.do?fid=${login.m_id }" title="내 블로그 가기">내 블로그 가기</a>
			
			<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active" data-target="#layerpop" data-toggle="modal"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">내 블로그 소식</a></li>
  <%-- <li role="presentation"><a href="blog.do?fid=${login.m_id }" aria-controls="profile" role="tab" data-toggle="tab">내블로그</a></li> --%>
</ul>

<br>
<%-- <a href="blog.do?fid=${login.m_id }">오늘 방문수 n</a>&nbsp;&nbsp;&nbsp; --%>
<code><a href="f_receive.do" ><b>서로이웃 신청&nbsp;<c:if test="${not empty cnt}">${cnt}</c:if></b></a></code> 
<br><br>
    <form style="height:150px">
			<table>

				<c:if test="${not empty Rfolist}">
					<c:forEach items="${Rfolist}" var="rl" end="2">

						<!-- 미확인건만 -->
						<c:if test="${rl.df_accept==0}">

							<tr align="left">
								<td><a href="f_receive.do"><code
											style="color: #2eaa08;">${rl.df_send}</code>님이 서로이웃 신청을 했습니다.</a></td>
							</tr>
							<tr align="left">
								<td align="left">${rl.df_date}</td>
							</tr>

						</c:if>
						<!-- 미확인건만 -->

					</c:forEach>
				</c:if>

			</table>
	</form>
	<br>
    




<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active" ><a href="settingmain.do" >관리</a></li>
  <li role="presentation" class="active" ><a href="bbswrite.do" >글쓰기</a></li>
  <li role="presentation" class="active" ><a href="#" id="friendBlog">블로그</a></li>
  
</ul>

<!-- 이웃블로그 버튼 클릭_이웃리스트 div -->

<div id="friendlist" style="position:absolute; top:325px; z-index:3; left:-150px; 
     background-color: #fff; border:3px solid #eaeaea;width:400px; height:500px; display: none;">
  
  <!-- 이웃리스트jsp:include -->
  <jsp:include page="../friend/loginbox/friendBlogDiv.jsp" flush="true" />
  <!-- 이웃리스트jsp:include -->
  
  <!-- 로그인박스, 이웃블로그의 이웃블로그목록div -->


 
</div>
<!-- 로그인박스, 이웃블로그의 이웃블로그목록div -->




<br>




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


<script>

//친구목록 보이기
$("#friendBlog").click(function(){
	
	if(document.all.friendlist.style.display == "block"){
		document.all.friendlist.style.display = "none";
	}else{
		document.all.friendlist.style.display = "block";	
	}
});

/* //검색 버튼 클릭시
$("#_btnSearch").click(function(){
	if($("#_s_keyword").val()==""){
		alert('검색어를 입력해주세요.');	
	}
});

$("#_btnSearch").click(function(){
	$("#_frmFormSearch").attr({"target":"_self","action":""}).submit();
	document.all.friendlist.style.display = "block";
}); */

</script>