
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

<!-- 나를 추가한 이웃 관리 창 -->
<form style="background-color: #fff;">
<h3><strong>나를 추가한 이웃</strong></h3>
<hr>

<div>
  <button type="button">서로이웃신청</button>
  <button type="button">이웃추가</button>
  
      오늘 <strong>n</strong>명
      전체 <strong>n</strong>명
  <span>|</span>
  <button style="color:orange;" class="glyphicon glyphicon-heart"></button><span>서로이웃</span>  
  <strong>n</strong>명
</div>

<br>

<table border="1" style="align:center" >
<col width="30px"/><col width="400px"/><col width="200px"/><col width="100px"/>

<tr style="background-color: #D8D8D8;">
  <th><input type="checkbox"></th>
  <th><select><option selected="selected">나를 이웃으로 추가한 사람 전체</option></select></th>
  <th>이웃추가</th>
  <th>추가일</th>
</tr>

<tr>
  <td><input type="checkbox"></td>
  <td>홍마| 훌륭한 판단의 표본</td>
  <td><input type="submit" value="서로이웃신청" onclick="location.href='adddblfollowGroup.do'"  style="background-color: #fff;color:#D8D8D8">
  <input type="submit" value="이웃추가" onclick="location.href='addfriend.do'"  style="background-color: #fff;color:#D8D8D8"></td>
  <td>16.09.08.</td>
</tr>
<tr>
  <td><input type="checkbox"></td>
  <td>Y0ung| 21살,나홀로 세계일주</td>
  <td><input type="submit" value="서로이웃신청" onclick="location.href='adddblfollowGroup.do'" style="background-color: #fff;color:#D8D8D8">
  <input type="submit" value="이웃추가" onclick="location.href='addfriend.do'" style="background-color: #fff;color:#D8D8D8"></td>
  <td>14.04.14.</td>
</tr>
</table>

<br>

<div>
<input type="checkbox">&nbsp;전체선택&nbsp;
  <button type="button">서로이웃신청</button>
  <button type="button">이웃추가</button>
</div>

</form>
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
//이미 이웃,서로이웃일 경우 추가버튼 비활성화
$("input[type='submit']").attr("disabled", true);//비활성화
</script>