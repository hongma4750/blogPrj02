<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
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

<!-- 여기는 주제별글보기 전체메뉴 영역 -->


<!-- 주제별 글보기 세부 메뉴(전체,문화/책, 영화, 요리/레시피, 스포츠, 세계여행 ) -->
<div id="topic_menu" style="position:relative; z-index:1;">
  <a href ="topiclist.do">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">문화·책</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">영화</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">요리·레시피</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">스포츠</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">세계여행</a>
</div>
<hr>

<!-- 주제별글보기 리스트 -->
<table style="width:500px;">
<tr>
<td colspan="2">
<!-- 제목[댓글수] -->
<h5>
<a>우도 카페 대니스 검멀레해안 풍경을 ..</a>
<span style="color:#ff0000">
[
<em>n</em>
]
</span>
<a>
더보기
</a>
</h5>
</td>
</tr>

<tr>
<td colspan="2">
<!-- 별명,작성일,공감수 -->
<a>써니의 맛집 여행~오늘 뭐 먹지?</a>&nbsp;<span>2016.09.07. 16:56</span>&nbsp;<span style="color:#110000">공감 n</span>
</td>
</tr>

<tr>
<td>
<!-- 내용 -->
우도 카페 대니스 검멀레해안 앞 넓은 카페 이번에 우도를 가보니 수많은 카페들이 생겨났더랍니다. 이번 우도여행에선 예전에 가봤던 헬로우도가 아닌 검멀레해안 앞 커다란 통유리가 인상적이던 대니스 카페를 가봤어요. 이유는 별 다른 건 ...</td>
<td>
<img src="./image/나의영화.jpg" alt="이미지없음" width="70px" height="70px" />
</td>
</tr>
</table>
<!-- 주제별글보기 리스트 -->


<script>
$(function () {
    $('#myTab a:last').tab('show')
});
</script>