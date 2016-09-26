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


<div style="width:100%; height:100%;" style="text-align:center;" align="center">

	<%
		String sideMenu = (String)request.getAttribute("sideMenu");

	%>

	<ul class="vertical">
		<li class="none">기본 정보 관리</li>
		
		<li class="vertical"><a <%=sideMenu.equals("blogInfo")?"class='vertical active'":"class='vertical'" %> href="#">블로그정보</a></li>

		<li class="none">열린 이웃</li>
		<li class="vertical"><a <%=sideMenu.equals("openfrined")?"class='vertical active'":"class='vertical'" %> href="openfriend.do">이웃,그룹 관리</a></li>
		<li class="vertical"><a <%=sideMenu.equals("openfrined1")?"class='vertical active'":"class='vertical'" %> href="setfollower.do">나를 추가한 이웃</a></li>
		<li class="vertical"><a <%=sideMenu.equals("blogInfo2")?"class='vertical active'":"class='vertical'" %> href="f_receive.do">서로이웃 맺기</a></li>

		<li class="none">글 관리</li>
		<li class="vertical"><a <%=sideMenu.equals("blogInfo3")?"class='vertical active'":"class='vertical'" %> href="#">블로그</a></li>
</ul>


	
</div>

<style>
	ul.vertical {

list-style-type: none;

margin: 0;

padding: 0;

width: 200px;

background-color: #FBFBFB;

/*position: fixed; 고정위치에 있게 합니다. */

/*height: 100%; 전체 높이를 사용하도록 합니다. */

overflow: auto; /* 사이드바 메뉴가 아주 많아져 스크롤이 필요하면 자동으로 생성되도록 합니다. */

}

li.none{font-size:25px; font-weight:100px;}

li.vertical { /* border-bottom:1px solid #bbb; border-top:1px solid #bbb; */}

li.vertical:last-child {border-bottom: none;}

li.vertical a.vertical {

display: block;

color: black;

padding: 10px 0 10px 20px;

text-decoration: none;

}

li.vertical a.active {

background-color: #FBFBFB;

color: #45B914;

font-weight:100px;

text-decoration: underline;

}

li.vertical a.vertical:hover:not(.active) {

background-color: #FBFBFB;

color: black;

text-decoration: underline;

}

</style>

