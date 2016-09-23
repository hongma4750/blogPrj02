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

<!-- 여기는 이웃새글 메뉴 영역 -->

<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->
<ul class="list-inline">
  <li><a href ="fnewslist.do">전체</a></li>
  <li><a href="newlist.do">이웃 새글</a></li>
  <li><a href="foffriendlist.do">이웃의 이웃</a></li>
  <li><a href="friends.do">이웃목록</a></li>
</ul>
<hr>
<!-- 이웃 소식보기 세부 메뉴(전체,이웃새글,이웃의이웃 ) -->



<!-- 이웃이 있을 때 -->
<c:if test="${not empty flist }">
<c:forEach items="${flist }" var="fl">

	<table style="width: 650px;">
		<col width="200px" /><col width="50px" />
		<tr>
			<td>
				<!-- 제목[댓글수] -->
				<h5>
					<a>글제목</a> <span style="color: #ff0000">
						[ <em>n</em> ]
					</span> <span> <!-- 지우기 버튼 -->
						<button type="button" onclick="();" id="btnClose" class="close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</span>
				</h5>

			</td>
		</tr>

		<tr>
			<td colspan="2">
				<!-- 블로그명,작성일,공감수 --> <a>블로그명</a>&nbsp;<span>2016.09.04.
					22:05</span>&nbsp;<span style="color: #110000">공감 n</span>
			</td>
		</tr>

		<tr>
			<td>
				<!-- 내용 -->글내용...
			</td>
			<td><img src="./image/LiloAndStitch.jpg" alt="이미지없음" width="70px" height="70px" /></td>
		</tr>

	</table>
	<hr>

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
<!-- 이웃이 있을 때 -->

<!-- 이웃이 없을 때 -->
<c:if test="${empty flist }">
	<div align="center" style="color:#666;">아직 이웃이 없습니다.
	<br>주제별 글 보기를 통해 관심 주제의 블로그 이웃을
          만들어보세요.</div>
</c:if>
<!-- 이웃이 없을 때 -->


<script type="text/javascript">
$(function () {
	    $('#myTab a:first').tab('show')
	});
</script>