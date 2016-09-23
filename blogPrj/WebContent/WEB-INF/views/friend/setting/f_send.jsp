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

<!-- 이곳은 보낸신청 탭_내용 -->

<button type="button" class="btn btn-default btn-xs">신청취소</button>

<br><br>
		<table border="1" style="align: center">
			<col width="30px" />
			<col width="400px" />
			<col width="200px" />
			<col width="100px" />
			<col width="100px" />

			<tr style="background-color: #D8D8D8;">
				<th><input type="checkbox"></th>
				<th>받는 사람</th>
				<th>메시지</th>
				<th>신청일</th>
				<th>관리</th>
			</tr>

            <!-- 보낸 서로이웃 신청이 없으면 -->
			<c:if test="${empty Sfolist }">
			<tr>
				<td colspan="5" align="center"><br><br><br><h4>진행 중인 이웃신청이 없습니다</h4><br><br><br></td>
			</tr>
			</c:if>
			<!-- 보낸 서로이웃 신청이 없으면 -->
			
			
			<!-- 보낸 서로이웃 신청이 있으면 -->
			<c:if test="${not empty Sfolist }">
			<form name="frmForm2" id="_frmForm2" action="delsendfol.do" method="post">
			<c:forEach items="${Sfolist }" var="Sfl">
			
			<!-- 미확인만보기 -->
			<c:if test="${Sfl.df_accept==0}">
			
			<tr>
				<td><input type="checkbox" id="_chk"></td>
				<td>${Sfl.df_receive }</td>
				<td>${Sfl.df_msg }</td>
				<td>${Sfl.df_date }</td>
				<td><button class="btn btn-default btn-xs" id="_cancle">신청취소</button></td>
			</tr>


			
				<input type="hidden" id="_seq" name="seq" value="${Sfl.df_seq }" />
				
			</c:if>
            <!-- 미확인만보기 -->
            
		</c:forEach>
		</form>
			
			</c:if>
			<!-- 보낸 서로이웃 신청이 있으면 -->
		</table>

		<div>
			<input type="checkbox">&nbsp;전체선택&nbsp;
			<button type="button" class="btn btn-default btn-xs">신청취소</button>
		</div>
<br><br>		
		
		
<!-- 페이징 -->
<div align="center">
<nav aria-label="Page navigation">
  <ul class="pagination">
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





<script>
//두번째탭보여주기
$(function () {
    $('#myTab li:eq(1) a').tab('show')
});

$("#_cancle").click(function(){
	if(window.confirm("서로이웃 맺기 신청을 정말 취소하시겠습니까?")){
		//$("#_frmFrm2").attr({"action":"delsendfol.do"}).submit();
	}	
});
</script>