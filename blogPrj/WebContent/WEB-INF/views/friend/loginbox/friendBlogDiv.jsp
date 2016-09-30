<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<title></title>
</head>
<body>
<!-- 로그인박스, 이웃블로그의 이웃블로그목록div -->

<!-- 검색 -->
<br>
<!-- 검색 -->
<br>
<%-- <form action="index.do"><input type="hidden" name="fnd_myid" value="${login.m_id }"/></form> --%>
<form name="frmForm1" id="_frmFormSearch" method="" action="" target="_here">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; border: 0; padding: 0;">
<tr>
  <td style="padding-left: 5px;">
    <select id="_s_category" class="btn btn-default btn-xs dropdown-toggle" name="s_category">
      <!-- <option value="" selected="selected">전체</option> -->
      <option value="fnd_fndid">이웃아이디순</option>
      <option value="fnd_groupname">그룹명</option>
      <option value="">블로그명순</option>
    </select>
  </td>
 
  <td style="padding-left: 5px;">
    <input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword }" placeholder="별명,ID" style="width:150px;"/>
  </td>
  
  <td style="padding-left: 5px;">
      <input type="submit" id="_btnSearch" value="검색"/>
  </td>
</tr>
</table>

<input type="hidden" name="fnd_myid" value="${login.m_id }"/>


</form>
<!-- 검색 -->




<%-- <c:if test="${not empty glist }">
<c:forEach items="${glist }" var="gl">
${gl.fnd_groupname }
${fl.fnd_groupname }
</c:forEach>
</c:if> --%>

<%-- <c:if test="${not empty glist }"> --%>
<c:if test="${not empty flist }">
   
   <%-- <c:forEach items="${glist }" var="gl"> --%>
   <table style="margin: 30px; width:350px;">
      <tr >
         <th style="text-align: left"><strong>이웃전체(인원수)</strong></th>
      </tr>
      
      
      <c:forEach items="${flist }" var="fl">
      
      <!-- 그룹명이랑 이웃리스트그룹이 같을때 -->
      <%-- <c:if test="${gl.fg_groupname eq fl.fnd_groupname }"> --%>
         <tr>
            <td style="text-align: left">
            <c:if test="${fl.fnd_chk==1 }">
            <button style="color:gray;" class="glyphicon glyphicon-heart"></button>
            </c:if>
            <c:if test="${fl.fnd_chk==2 }">
            <button style="color:orange;" class="glyphicon glyphicon-heart"></button>
            </c:if>
            <a href="blog.do?fid=${fl.fnd_fndid }">${fl.fnd_fndid } | 별명/블로그명</a></td>
            
         </tr>
      <%-- </c:if> --%>
      <!-- 그룹명이랑 이웃리스트그룹이 같을때 -->
         
      </c:forEach>
   
   </table>
   <%-- </c:forEach> --%>
</c:if>
<%-- </c:if> --%>
  



<script>
//div에 X닫기 버튼 클릭시
/* $("#btnClose").click(function(){
	document.all.friendlist.style.display = "none";
}); */

//검색버튼클릭시 아작스 이용해서 새로고침없이 페이지이동
$('#_btnSearch').click(function(){
	document.all.friendlist.style.display = "block";
	   $.ajax({
	        type: 'get',
	        data: '',
	        url: 'friendBlogDiv.do',
	        success: function(args){ //리턴값
	            
	        	//$("#_frmFormSearch").attr({"target":"_here","action":"friendBlogDiv.do"}).submit();
	        	//alert(data);
	        }
	   });
	    return false; //<- 이 문장으로 새로고침(reload)이 방지됨
});
 
/* $("#_btnSearch").click(function(){
	//location.href='friendBlogDiv.do';
	$("#_frmFormSearch").attr({"target":"_here","action":"friendBlogDiv.do"}).submit();
	document.all.friendlist.style.display = "block";
});  */
</script>

</body>
</html>