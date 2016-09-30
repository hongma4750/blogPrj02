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

<style>
.navs {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
	background-color:#6B767D;
	font-size:25px;
}

.navs>li {
	position: relative;
	display: block;
	
}

.navs>li>a {
	position: relative;
	display: block;
	padding: 10px 15px;
	color:#FFFFFF;
}

.navs>li>a:focus, .navs>li>a:hover {
	/* text-decoration: none; */
	color:white;
	background-color: #6B767D;
}

.navbar-nav>li>a:hover{
	color:yellow;
}

.navbar-brand{
	color:white;
}

.navbar-brand:hover{
	color:yellow;
	text-decoration: underline;
}

.topic_menu{
	font: 12px Dotum;
	/* font-weight: bold; */
}
</style>


<nav class="mynav" style="background-color:#6B767D;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="">
    		<a class="navbar-brand" href="index.do" style="" onclick="">블로그 홈</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="navs navbar-nav">
      	
      		<li><a href="topic.do?cate=1" class="topic_menu">음악</a></li>
        	<li><a href="topic.do?cate=2" class="topic_menu">영화</a></li>
        	<li><a href="topic.do?cate=3" class="topic_menu">스포츠</a></li>
        	<li><a href="topic.do?cate=4" class="topic_menu">세계여행</a></li>
        	<li><a href="topic.do?cate=5" class="topic_menu">일상·생각</a></li>
        	
        	
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>