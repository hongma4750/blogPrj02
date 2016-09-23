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


<div class="row" style="z-index:1;">
  <table>
  <col width="200px"/><col width="800px"/>
    <tr>
    <td>
  <div style="margin-left: 40px;margin-top: -15px;">
  <br><br>
  <strong>Hot Topic</strong>
    <ul>
      <li><a href="#">충북여행</a></li>
      <li><a href="#">내가 찍은 하늘</a></li>
    </ul>
    <strong>오늘의 TOP</strong>
    <ul>
      <li><a href="#">스포츠</a></li>
      <li><a href="#">영화</a></li>
    </ul>
  </div>
  </td>
  
  <td>
  <div style="padding: 30px;">
    <a href="#" class="thumbnail" style="display:inline-block; float:left;z-index:1; margin-right: 30px;">
      <img src="image/see.jpg" class="img-responsive" alt="Responsive image" style="height:150px;">
	</a>
	
    <ol  style="padding: 30px;">
			<li><a href="#">영화 터널 줄거리와 결말-할아버지의 의미</a></li>
			<li><a href="#">덕혜옹주(The Last Princess) [영화후기]</a></li>
			<li><a href="#">최근 본 영화 몇 편</a></li>
			<li><a href="#">인생영화 원스 어폰 어 타임 인 아메리카, 스크린으로 만나고 왔어요</a></li>
			<li><a href="#"><부산행> 좀비 생존 극기훈련 체험</a></li>
	</ol>
	
  </div>
  </td>
  
  </tr>
  </table>
</div>




