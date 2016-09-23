<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
 
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


<!-- 서로이웃 맺기 -->

<h3><strong>서로이웃 맺기</strong></h3>
<hr>

<div id="con">
<div role="tabpanel">

<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li rel="tab1" role="presentation" class="active" ><a href="#receive" id="friendtab" aria-controls="presentation" role="tab" data-toggle="tab">받은신청</a></li>
  <li rel="tab2" role="presentation"><a href="#send" id="grouptab">보낸신청</a></li>
  <!-- <li rel="tab3" role="presentation"><a href="#message" id="seqtab">안내메시지</a></li> -->
  <br><br>


				
				<%-- <div id="others">
				    <!-- 받은신청 탭_내용 include -->
					<div role="tab_con" class="tab_con" id="tab1">
						<jsp:include page="../friend/setting/f_receive.jsp" flush="true" />
					</div>

					<!-- 보낸신청 탭_내용 include -->
					<div role="tab_con" class="tab_con" id="tab2">
						<jsp:include page="../friend/setting/f_send.jsp" flush="true" />
					</div>

					<!-- 안내메시지 탭_내용 include -->
					<div role="tab_con" class="tab_con" id="tab3">
		            <jsp:include page="../friend/setting/f_send.jsp" flush="true"/>
		            </div>

				</div> --%>

</ul>


<br><br>



<script>
//첫번째 탭 먼저보여주기
$(function () {
    $('#myTab a:first').tab('show')
});

//탭클릭에 따른 내용 변경
$(function (){
	$(".tab_con").hide();
	$(".tab_con:last").show();
	
	$("#con ul.nav-tabs li").click(function(){
		$("#con ul.nav-tabs li").removeClass("active").css("color","red");
		$(this).addClass("active").css("color","yellow");
		$("#others .tab_con").hide();
		var actTab=$(this).attr("rel");
		$("#"+actTab).show();
	});
});

$("#friendtab").click(function(){
	location.href="f_receive.do";
});
$("#grouptab").click(function(){
	location.href="f_send.do";
});
$("#seqtab").click(function(){
	location.href="#";
});
</script>