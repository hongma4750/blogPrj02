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

<!-- 이곳은 열린이웃 탭_내용 -->

<!-- 그룹이동 div -->
<div id="movegroup" style="position:absolute; top:380px; left:137px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:150px; height:200px; display: none;">
  <button type="button" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button>
  <br>
  <div style="height:100px;">그룹리스트</div>
  <div align="center" style="vertical-align: bottom">
    <input type="submit" style="vertical-align: bottom" value="새그룹만들기" onclick="makegroup()">
  </div>
</div>
  
<!-- 새그룹만들기 영역 -->
<div id="makegroup" style="position:absolute; top:578px; left:137px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:150px; height:100px; display: none; padding: 5px;">
     <input type="checkbox" name="chkopen" checked="checked">공개
     <input type="checkbox" name="chkopen">비공개
     <br>
     <input type="text" placeholder="그룹명을 써주세요" value="" style="width:140px;margin-top: 5px;margin-bottom: 5px;">
     <div align="center">
       <input type="submit" value="확인" onclick="makegroupOk();">
       <input type="submit" value="취소" onclick="makegroupCancle();">
     </div>
</div>
<!-- 새그룹만들기 영역 -->
<!-- 그룹이동 div -->

<!-- 새글소식 받기 div -->
<div id="receiveNew" style="position:absolute; top:300px; left:400px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:300px; height:150px; display: none;">
  <h5><strong>새글 소식 알림 설정</strong><button type="button" id="" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <br>
     선택한 이웃의 새글소식<br>
     알림을 설정하실 수 있습니다.
  <br><br>
  <div align="center"><input type="submit" value="ON" onclick="location.href='setfriendGroup.do'">
  <input type="submit" value="OFF" onclick="location.href='setfriendGroup.do'"></div>
</div>
<!-- 새글소식 받기 div -->

<!-- 삭제 div -->
<div id="del" style="position:absolute; top:300px; left:400px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:400px; height:200px; display: none;">
  <h5>이웃 삭제<button type="button" id="" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <br>
     선택한 이웃을 삭제하시겠습니까?
     선택한 이웃에 서로이웃이 포함되어 있을경우,<br>
  <input type="radio" name="delfriend" checked="checked">이웃과 서로이웃을 모두 삭제합니다.<br>
  <input type="radio" name="delfriend">서로이웃은 이웃으로 관계만 변경합니다.<br><br>
  <div align="center"><input class="btn btn-default" type="submit" value="확인" onclick="location.href='setfriendGroup.do'" >
  <input class="btn btn-default" type="submit" value="취소" onclick="location.href='setfriendGroup.do'"></div>
</div>
<!-- 삭제 div -->


<button type = "button" onclick="movegroup()" class="btn btn-default btn-xs">그룹이동</button>
<button type = "button" onclick="receiveNew()" class="btn btn-default btn-xs">새글소식 받기</button>
<button type = "button" onclick="del()" class="btn btn-default btn-xs">삭제</button>

<div style="float:right;">
<span style="float:left;">정렬된 이웃 <b>n</b>명&nbsp;&nbsp;</span><select class="form-control input-sm" style="width:120px;float:left;">
  <option selected="selected">이웃추가순</option>
  <option>블로그명순</option>
  <option>이웃별명순</option>
</select>
</div>
<br><br>

<table class="table table-striped" style="align: center; width:100%;">
<col width="30px"/><col width="100px"/><col width="100px"/><col width="100px"/>
<col width="100px"/><col width="100px"/><col width="100px"/>

<tr class="success">
  <th><input type="checkbox"></th>
  <th>
     <select class="form-control input-sm" style="width:100px;">
        <option selected="selected" style="background-color: #D8D8D8">그룹전체</option>
        <c:forEach items="${glist }" var="gl">
        <option>${gl.fg_groupname }</option>
        </c:forEach>
     </select>
  </th>
  <th>
     <select class="form-control input-sm" style="width:100px;">
        <option selected="selected" style="background-color: #D8D8D8">이웃전체</option>
        <option>이웃</option>
        <option>서로이웃</option>
     </select>
  </th>
  <th>이웃</th>
  <th>
     <select class="form-control input-sm" style="width:100px;">
        <option selected="selected" style="background-color: #D8D8D8">새글소식</option>
        <option>알림전체</option>
        <option>알림ON</option>
        <option>알림OFF</option>
      </select>
  </th>
  <th>최근포스트일</th>
  <th>이웃추가일</th>
</tr>



<c:if test="${empty flist }">
<tr>
  <td colspan="6"><br><br><h4 align="center"><strong>관리중인 이웃이 없습니다.</strong></h4><br><br></td>
</tr>
</c:if>

<c:forEach items="${flist }" var="fl">
<tr>
  <td><input id="chk" type="checkbox"></td>
  <td>${fl.fnd_groupname }</td>
  <td>
    <!-- 1이면 이웃 -->
    <c:if test="${fl.fnd_chk == 1}">
    이웃
    </c:if>
    <!-- 2이면 이웃 -->
    <c:if test="${fl.fnd_chk == 2}">
    서로이웃
    </c:if>
  </td>
  <td>${fl.fnd_fndid }</td>
  <td>
   <!-- 알림ON -->
   <c:if test="${fl.fnd_newAlert==0 }">
   <button class="btn btn-success btn-xs">ON</button>
   </c:if>
   <!-- 알림OFF -->
   <c:if test="${fl.fnd_newAlert==1 }">
   <button class="btn btn-success btn-xs">OFF</button>
   </c:if>
  </td>
  
  <td>최근포스트일<!-- 최근포스트일 --></td>
  <td>${fl.fnd_foldate }</td>

</tr>
</c:forEach>

</table>

<div>
	<input id="allchk" type="checkbox">&nbsp;전체선택&nbsp;
	<button type = "button" onclick="movegroup()"  class="btn btn-default btn-xs">그룹이동</button>
    <button type = "button" onclick="receiveNew()"  class="btn btn-default btn-xs">새글소식 받기</button>
    <button type = "button" onclick="del()"  class="btn btn-default btn-xs">삭제</button>
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

<br><br>

<script>
//div에 X닫기 버튼 클릭시
function btnClose(){
	  document.all.movegroup.style.display = "none";
	  document.all.receiveNew.style.display = "none";
	  document.all.del.style.display = "none";
}

//그룹이동
function movegroup(){
	document.all.movegroup.style.display = "block";
}

//새글소식 받기
function receiveNew(){
	document.all.receiveNew.style.display = "block";
}

//새그룹만들기
function makegroup(){
	document.all.makegroup.style.display = "block";
}

//새그룹만들기 확인
function makegroupOk(){
	document.all.makegroup.style.display = "none";
}

//새그룹만들기 취소
function makegroupCancle(){
	document.all.makegroup.style.display = "none";
}

/* $("#del").click(function(){
	document.all.del.style.display = "block";
}); */

//삭제
function del(){
	document.all.del.style.display = "block";
}

//전체선택0 클릭하면
$("#allchk").click(function(){
	//전체체크
	//$("input:checkbox[id='chk']").prop("checked", true);
	
	if($("#allchk").prop("checked")){
		//전체선택
		$("input:checkbox[id='chk']").prop("checked",true);
	}else{
		//전체해제
		$("input:checkbox[id='chk']").prop("checked",false);
	}
});

//checked/unchecked 처리
$("input:checkbox[id='ID']").prop("checked", true); /* by ID */
$("input:checkbox[name='NAME']").prop("checked", false); /* by NAME */


//특정 라디오버튼 선택 / 모든 라디오버튼 선택해제
$("input:radio[name='NAME']:radio[value='VALUE']").attr("checked",true);
$("input:radio[name='NAME']").removeAttr("checked");
</script>