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




  
<!-- 비로그인시 -->

<div id="con">
	<div role="tabpanel">
		<ul class="nav nav-tabs" role="tablist" id="myTab">
		  <li rel="ttottab">
		  	<a href="search.do?srh_op=post" id="post">포스트</a>
		  </li>
		  <li rel="ttottab" role="presentation" >
		  	<a href="search.do?srh_op=blog" id="blog" aria-controls="home" role="tab" data-toggle="tab">블로그</a>
		  </li>
		  <li rel="ttottab" role="presentation" class="active">
		  	<a href="search.do?srh_op=nicknid" id="nicknid" aria-controls="home" role="tab" data-toggle="tab">별명·아이디</a>
		  </li>  
		</ul>
	</div>
</div>

<!-- 비로그인시 -->  

<script>
$(function () {
    $('#myTab a:first').tab('show')
});

//탭클릭에 따른 내용 변경
$(function (){
	$(".tab_con").hide();
	$(".tab_con:first").show();
	
	$("#con ul.nav-tabs li").click(function(){
		$("#con ul.nav-tabs li").removeClass("active").css("color","red");
		$(this).addClass("active").css("color","yellow");
		$("#others .tab_con").hide();
		var actTab=$(this).attr("rel");
		$("#"+actTab).show();
	});
});


/* //이웃소식보기 탭 클릭
$('#hot').click(function(){
	//alert('이웃소식');
	 
	//비로그인시 로그인 안내 div태그
	if("${login.m_id eq null}"){
	    document.all.sign_in.style.display = "block";
	}
}); */


  
// 포스트
$('#post').click(function(){
    location.href="search.do?srh_op=post";
});

// 블로그
$('#blog').click(function(){
    location.href="search.do?srh_op=blog";
});

// 별명 아이디
$('#nicknid').click(function(){
    location.href="search.do?srh_op=nicknid";
});
  
$('#btnClose').click(function(){
	document.all.sign_in.style.display = "none";
});
</script>  


