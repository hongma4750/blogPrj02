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

<!-- 로그인했을때 -->
<c:if test="${login.m_id ne null}" >

  <script type="text/javascript">
  $(function () {
	    $('#myTab a:first').tab('show')
	});
  </script>

  <!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->
  <ul class="list-inline">
    <li><a href ="fnewslist.do">전체</a></li>
    <li><a href="newlist.do">이웃 새글</a></li>
    <li><a href="foffriendlist.do">이웃의 이웃</a></li>
    <li><a href="friends.do">이웃목록</a></li>
  </ul>
  <!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->

<!-- 이웃이 있을때 -->
<!-- 이웃 추천 토글박스 -->
<c:if test="${not empty fnd }"> 



<div id="recommendbox" style="border:1px solid #eaeaea; padding:10px;">


<!-- 추천멘트 -->
<span>이웃 <code><a style="color:#2eaa08;">${fnd.fnd_fndid }</a></code>님의 이웃을 만나보세요.</span>&nbsp;&nbsp;<span><small><a href="foffriendlist.do">이웃의 이웃 더보기</a></small></span><button type="button" onclick="newrecommend();" id="btnClose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button><br>
<!-- 추천멘트 -->

<!-- 추천 이웃 최대 2명 소개 --> 
<div id="recommendbox_hide" style="display:'inherit';">


<c:forEach items="${fofflist }" var="recomm_fl" end="2">



    <form action="addfriend.do?blogid=${recomm_fl.fnd_fndid }" target="FollowPop" method="post">

<!-- 이웃의 이웃이 있으면 -->
<c:if test="${not empty fofflist }">
<!-- 내 아이디 제외하기 -->
<c:if test="${recomm_fl.fnd_fndid ne login.m_id}">
<!-- 내 친구가 아닐때 추천받기 -->
<c:if test="${fnd.fnd_fndid ne recomm_fl.fnd_fndid}">
		
		<table style="margin: 10px;">
		<col width="35px"/><col width="110px"/><col width="40px"/><col width="60px"/>

			<tr>
				<!-- 블로그프로필이미지 -->
				<td rowspan="2"><img src="./image/LiloAndStitch.jpg" alt="이미지없음" width="30px" height="30px" /></td>
				
				<!-- 블로그명 -->
				<td>블로그명블로그명..</td>
				
				<!-- 별명 -->
				<td><code><a style="color: #2eaa08;">${recomm_fl.fnd_fndid }</a></code></td>
				
				<td>
				<!-- 이웃이 아닌 사람일 때 뜨는 이웃추가 버튼 -->
				<button class="btn btn-default btn-xs" onclick="popupOpen();">이웃추가</button>
				</td>
				
			</tr>

			<tr>
				<td colspan="3">글내용글내용..</td>
			</tr>

		</table>
		
</c:if> 
<!-- 내친구가 아닌사람 추천받기 -->
</c:if>
<!-- 내 아이디 제외하기 -->
</c:if>
<!-- 이웃의 이웃이 있으면 -->

<!-- 이웃의 이웃이 없을때 -->
<c:if test="${empty fofflist }">
내 이웃들과 이웃하고 있는 새로운 블로거가 없습니다
</c:if>
<!-- 이웃의 이웃이 없을때 -->
		
    </form>


</c:forEach>

</div>
</div>



<br>

<!-- 이웃 추천 토글박스 -->







<!-- 이웃이있을때 -->
<c:if test="${not empty flist }">

<!-- 이웃글이 없을때 -->
<c:if test="${empty blog }">
<div align="center" style="color:#666;">이웃의 새 글이 없습니다.</div>
</c:if>
<!-- 이웃글이 없을때 -->

<!-- 이웃이 새글이 있을 때 -->
<c:if test="${not empty blog }">


<c:forEach items="${flist }" var="fl">
<c:forEach items="${blog }" var="bl">

<!-- 이웃아이디랑 블로그게시 아이디가 같은 글만 -->
<c:if test="${fl.fnd_fndid eq bl.m_id }">

<!-- 이웃포스트 리스트 -->
	<table style="width: 650px;">
	<col width="200px"/><col width="50px"/>
		<tr>
				<td>
					<!-- 제목[댓글수] -->
					<h5>
						<a>${bl.bbs_title }</a> <span style="color: #ff0000"> [ <em>n</em> ]
						</span>
						<!-- 지우기 버튼 -->
						<button type="button" onclick="();" id="btnClose" class="close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</h5>
				</td>

			</tr>

		<tr>
			<td colspan="2">
				<!-- 아이디,작성일,공감수 --> <a>${bl.m_id }</a>&nbsp;
				<span>${bl.bbs_date }</span>&nbsp;
				<span style="color: #110000">공감 n</span>
			</td>
		</tr>

		<tr>
			<td>
				<!-- 내용 -->${bl.bbs_content }
			</td>
			<td>
			<c:if test="${not empty bl.bbs_img }">
			<img src="${bl.bbs_img }" alt="이미지없음" width="70px" height="70px" />
			</c:if>
			</td>
		</tr>
	</table>
	<hr>
<!-- 이웃포스트 리스트 -->

</c:if>
<!-- 이웃아이디랑 블로그게시 아이디가 같은 글만 -->
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
<!-- 이웃이 새글이 있을 때 -->


</c:if>
<!-- 이웃이있을때 -->

</c:if>
<!-- 이웃추천 -->


<!-- 이웃이 없을 때 -->
<c:if test="${empty flist }">
	<div align="center" style="color:#666;">아직 이웃이 없습니다.
	<br>주제별 글 보기를 통해 관심 주제의 블로그 이웃을
          만들어보세요.</div>
<!-- 이웃이 없을 때 -->
</c:if>



</c:if>
<!-- 로그인했을때 -->

<script type="text/javascript">

function newrecommend(){
	if(document.all.recommendbox_hide.style.display=="none"){
		document.all.recommendbox_hide.style.display="block";
	}else{
		document.all.recommendbox_hide.style.display = "none";
	}
}

 
function popupOpen(){
	var popUrl = "addfriend.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=400, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
		window.open(popUrl,"FollowPop",popOption);
}

//ajax로 이웃이 아닌 사람만 추천
//ajax로 지우기버튼 적용


</script>