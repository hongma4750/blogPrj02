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

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog.css"/>
<!-- css  -->

<div class="guest">
	<strong>다녀간 블로거</strong>
	<p> hyering1228님의블..x</p>
	<p> 훌륭한 판단의 표본 x</p>
</div>


 <div class="navbar-form navbar-left" role="search">
 	<form action="blogsearch.do" method="get">
	   <div class="form-group">
	     
	     <c:if test="${blogSearch ne null }">
	     	<input type="text" class="form-control" placeholder="Search" id="blogSearch" name="blogSearch" value="${blogSearch }">
	   	</c:if>
	   	
	   	<c:if test="${blogSearch eq null }">
	   		<input type="text" class="form-control" placeholder="Search" id="blogSearch" name="blogSearch">
	   	</c:if>
	   </div>
	   <button type="submit" class="btn btn-default" id="searchBtn" onclick="return searchB()">검색</button>
   </form>
 </div>
 
 
 
 <script type="text/javascript">
/* 작성취소버튼 누르면 블로그 홈으로 이동 */
	
function searchB(){

	if($("#blogSearch").val() == 0 ){
		alert("검색어를 입력 해주세요");
		return false;
	}
	
	return true;

}

</script>
 
 
 