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

<!-- 이곳은 이웃순서 탭_내용 -->

<c:if test="${empty flist }">
<h4 align="center"><strong>관리중인 이웃이 없습니다.</strong></h4>
</c:if>

<!-- 이웃이 있으면 -->
<c:if test="${not empty flist }">

<table class="table table-striped" style="align: center; width:40%;float:left;">
<col width="300px"/>


  <tr class="success">
    <th>이웃그룹</th>
  </tr>
 
  <c:forEach items="${glist }" var="gl">
  <tr>
   
    <td>${gl.fnd_groupname }</td>
  </tr>  
  </c:forEach>
</table>


<table class="table table-striped" style="align: center; width:60%;float:left;">
<col width="300px"/>


  <tr class="success">
    <th>이웃목록
       <select>
          <option>직접순서설정</option>
          <option selected="selected">새글순(자동)</option>
          <option>가나다순(자동)</option>
          <option>등록일순(자동)</option>
       </select>
    </th>
  </tr>
  
  <c:forEach items="${flist }" var="fl">
  <tr>  
    <td>
        <c:if test="${fl.fnd_chk==1 }">
        <button style="color:gray;" class="glyphicon glyphicon-heart"></button>
        </c:if>
        <c:if test="${fl.fnd_chk==2 }">
        <button style="color:orange;" class="glyphicon glyphicon-heart"></button>
        </c:if>
        ${fl.fnd_fndid }|블로그명
    </td>
  </tr>
  </c:forEach>
  
</table>

</c:if>

<br><br>


<script>
$(function () {
    $('#myTab a:last').tab('show')
});
</script>