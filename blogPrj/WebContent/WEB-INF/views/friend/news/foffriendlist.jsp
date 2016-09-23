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

<!-- 여기는 이웃의 이웃 메뉴 영역 -->

<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->
<ul class="list-inline">
  <li><a href ="fnewslist.do">전체</a></li>
  <li><a href="newlist.do">이웃 새글</a></li>
  <li><a href="foffriendlist.do">이웃의 이웃</a></li>
  <li><a href="friends.do">이웃목록</a></li>
</ul>
<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->

<hr>


<!-- 이웃의 이웃이 있을 때 -->
<c:if test="${not empty fofflist }">
<h6><b>내 이웃의 이웃</b> 중에 관심가는 블로거를 만나보세요.</h6>


<c:forEach items="${flist }" var="fl">

<pre>
<b>${fl.fnd_fndid }</b>님의 가까운 이웃
</pre>



<!-- 이웃의 이웃은 최대3명 추천 -->
<c:forEach items="${fofflist }" var="recomm_fl" end="2">

<!-- 내 아이디 제외하기 -->
<c:if test="${recomm_fl.fnd_fndid ne login.m_id}">
<!-- 내 친구가 아닐때 추천받기 -->
<c:if test="${fㅣ.fnd_fndid ne recomm_fl.fnd_fndid}">


<form action="addfriend.do?blogid=${recomm_fl.fnd_fndid }" target="FollowPop" method="post">


<table style="width:650px;">
<col width="35px"/><col width="200px"/><col width="50px"/>
			<tr>
				<td rowspan="4">
					<!-- 이미지 --> <img src="./image/LiloAndStitch.jpg" alt="이미지없음" width="30px" height="30px" />
				</td>

				<td>
					<!-- 블로그이름 --> 블로그이름
					<!-- 이웃이 아닌 사람일 때 뜨는 이웃추가 버튼 -->
					<button class="btn btn-default btn-xs" onclick='popupOpen();'>이웃추가</button>
					<!-- 이웃이 아닌 사람일 때 뜨는 이웃추가 버튼 -->
					<!-- 지우기 버튼 -->
					<button type="button" onclick="();" id="btnClose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</td>

			</tr>
			
			<tr>
			   <td>
			     <!-- 추천블로거 -->
			     <code><a style="color: #2eaa08;">${recomm_fl.fnd_fndid }</a></code>
			     <!-- 함께 아는 이웃수 -->  
			        함께 아는 이웃 n명
			   </td>
			</tr>

			<tr>
				<td>
					<!-- 제목[댓글수] -->
					<h5>
						<a>글제목</a>
						<span style="color: #ff0000">
							[ <em>n</em> ]
						</span>
					</h5>
				</td>
				<td rowspan="2">
				  <!-- 포스트이미지 --> <img src="./image/LiloAndStitch.jpg" alt="이미지없음" width="70px" height="70px" />
			  </td>
			</tr>
			
			<tr>
			  <td>
			    <!-- 글내용 -->
			      글내용
			    <!-- 작성일 -->
			    <span>2016.09.04. 22:05</span>
			  </td>
			  
			</tr>
</table>
<hr>

</form>


</c:if>
<!-- 내친구 빼고 추천받기 -->

</c:if>
<!-- 내 아이디 제외하고 추천받기 -->

</c:forEach>


</c:forEach>



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

</c:if>
<!-- 이웃의 이웃이 있을 때 -->


<!-- 이웃 -->
<!-- 이웃의 이웃이 없을 때 -->
<c:if test="${empty fofflist }">
	<div align="center" style="color:#666;">내 이웃들과 이웃하고 있는 새로운 블로거가 없습니다
	<br><br>이웃이 많을 수록 더 많은 이웃의 이웃을 만날 수 있습니다.
다양한 블로거들을 만나고 새로운 블로그 이웃을 맺어보세요.</div>
</c:if>
<!-- 이웃의 이웃이 없을 때 -->

<script type="text/javascript">

function popupOpen(){
	var popUrl = "addfriend.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"FollowPop",popOption);
}

$(function () {
	    $('#myTab a:first').tab('show')
});

</script>