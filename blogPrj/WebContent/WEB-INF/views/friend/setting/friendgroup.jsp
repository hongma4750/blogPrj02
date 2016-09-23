<%@ page contentType="text/html; charset=UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value ="utf-8"/> 

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- 이곳은 이웃그룹 탭_내용 -->

<button type = "button" onclick="">공개변경</button>
<button type = "button" onclick="del()">삭제</button>
<button type = "button" onclick="">그룹추가</button>


<!-- 삭제 div -->
<div id="del" style="position:absolute; top:300px; left:400px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:400px; height:200px; display: none;">
  <h5>이웃 삭제<button type="button" id="" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <br>
     선택한 이웃을 삭제하시겠습니까?
     선택한 이웃에 서로이웃이 포함되어 있을경우,<br>
  <input type="radio" name="delfriend" checked="checked">이웃과 서로이웃을 모두 삭제합니다.</input><br>
  <input type="radio" name="delfriend">서로이웃은 이웃으로 관계만 변경합니다.</input><br><br>
  <div align="center"><input type="submit" value="확인" onclick="location.href='setfriendGroup.do'">
  <input type="submit" value="취소" onclick="location.href='setfriendGroup.do'"></div>
</div>
<!-- 삭제 div -->


정렬된 이웃 명 
<br><br>


<!-- 그룹이없습니다. -->
<table>
<col width="30px"/><col width="100px"/><col width="100px"/><col width="100px"/>
<col width="100px"/>
<tr>
  <th><input type="checkbox"></th>
  <th>이웃그룹</th>
  <th>공개여부</th>
  <th>이웃수</th>
  <th>새글알림수</th>
</tr>

<tr>

</tr>
</table>

<br>
<div>
	<input type="checkbox">&nbsp;전체선택&nbsp;
    <button type = "button" onclick="">공개변경</button>
    <button type = "button" onclick="del()">삭제</button>
    <button type = "button" onclick="">그룹추가</button>
</div>



<br><br>



<script>
//두번째탭보여주기
$(function () {
    $('#myTab li:eq(1) a').tab('show')
});

//div에 X닫기 버튼 클릭시
function btnClose(){
	  document.all.del.style.display = "none";
}

//삭제
function del(){
	document.all.del.style.display = "block";
}
</script>