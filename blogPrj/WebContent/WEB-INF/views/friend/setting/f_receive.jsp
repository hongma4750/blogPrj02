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


<!-- 이곳은 받은신청 탭_내용 -->


        <button type="button" class="btn btn-default btn-xs">수락</button>
		<button type="button" class="btn btn-default btn-xs">거절</button>

<br><br>


		<table border="1" style="align: center">
			<col width="30px" />
			<col width="400px" />
			<col width="200px" />
			<col width="100px" />
			<col width="100px" />

			<tr style="background-color: #D8D8D8;">
				<th><input type="checkbox"></th>
				<th>신청한 사람</th>
				<th>메시지</th>
				<th>신청일</th>
				<th>관리</th>
			</tr>
			
          <!-- 받은 서로이웃 신청이 없으면 -->
            <c:if test="${empty Rfolist }">
			<tr>
				<td colspan="5" align="center"><br><br><br><h4>새로 들어온 이웃신청이 없습니다</h4><br><br><br></td>
			</tr>
			</c:if>
			
		  <!-- 받은 서로이웃 신청이 있으면 -->
			
			<c:if test="${not empty Rfolist }">
			
			
			
			<form name="frmForm2" id="_frmForm2" action="acceptDblfol.do" target="pop" method="post">
			
			<c:forEach items="${Rfolist }" var="Rfl">
			
			<!-- 미확인만 보이기 -->
			<c:if test="${Rfl.df_accept==0 }">
			
			<tr>
				<td><input type="checkbox" id="_chk"></td>
				<td>${Rfl.df_send }</td>
				<td>${Rfl.df_msg }</td>
				<td>${Rfl.df_date }</td>
				<td><button class="btn btn-default btn-xs" onclick="popupOpen(1);" >수락</button><button class="btn btn-default btn-xs" onclick="popupOpen(2);">거절</button></td>
			</tr>
			
			<input type="hidden" id="_seq" name="seq" value="${Rfl.df_seq }" />
			<input type="hidden" name="blogId" value="${Rfl.df_send }" />
			
			</c:if>
			<!-- 미확인만 보이기 -->
			
			</c:forEach>
			
			</form>
			
			</c:if>
			
		</table>
		</form>

		<div>
			<input type="checkbox">&nbsp;전체선택&nbsp;
			<button type="button" class="btn btn-default btn-xs">수락</button>
			<button type="button" class="btn btn-default btn-xs">거절</button>
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
//서로이웃 신청 수락/거절 팝업 pop!
function popupOpen(chk){
	var chk;
	/* var popUrl1="acceptDblfol.do";//수락
	var popUrl2="noDblfol.do";//거절 */
	var popOption = "width=370, height=400, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	
	//수락버튼 클릭시
	if (chk==1){
		
		window.open("acceptDblfol.do","pop",popOption);
	}
	//거절버튼 클릭시
	if (chk==2){
		window.open("noDblfol.do","",popOption);
	}
}
</script>