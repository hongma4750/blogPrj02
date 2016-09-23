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

<script>
$(function () {
	 $(".tab_con").hide();
	 $(".tab_con:first").show();
	 
	 $("#section_cen ul.nav-tabs li").click(function(){
		 $("#section_cen ul.nav-tabs li").removeClass("active").css("color","red");
		 $(this).addClass("active").css("color","yellow");
	   	 $("#others .tab_con").hide();
	   	 var actTab = $(this).attr("rel");
	     $("#"+actTab).show();
	     
	 });
  });
/* $('#setting a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show');
	})
	 */
/* $('#setting a[href="#profile"]').tab('show') // Select tab by name
$('#setting a:first').tab('show') // Select first tab
$('#setting a:last').tab('show') // Select last tab
$('#setting li:eq(2) a').tab('show') // Select third tab (0-indexed)
 */

/* $(document).ready(function(){
	   $(".tab-pane").hide();
	   $(".tab-pane:first").show();
	   
	   $("#tab-pane").click(function(){
	      $("#left ul.ca-menu li").removeClass("active").css("color","red");
	      $(this).addClass("active").css("color","yellow");
	      $("#right .tab_con").hide();
	      var actTab = $(this).attr("rel");
	      $("#"+actTab).slideDown("slow");
	   });
	   
	}); */

</script>

<div id="section_cen">
	<!-- 탭시작 -->
	<div role="tabpanel">
	
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist" id="setting">
	    
	    <li rel="default_set" role="presentation" class="active">
	    	<a href="#default_set" aria-controls="home" role="tab" data-toggle="tab">일반 설정</a>
	    </li>
	    
	    <li rel="sch_set" role="presentation">
	    	<a href="#sch_set" aria-controls="presentation" role="tab" data-toggle="tab">일정 설정</a>
	    </li>
	   
	    <li rel="alarm_set" role="presentation">
	    	<a href="#alarm_set" aria-controls="presentation" role="tab" data-toggle="tab">알림 설정</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  	<div id="others">
		  	<div role="tab_con" class="tab_con" id="default_set">
	        	<jsp:include page="default_setting.do" flush="true" />
			</div>
		    <div role="tab_con" class="tab_con" id="sch_set">
	        	<jsp:include page="sch_setting.do" flush="true" />
			</div>
			<div role="tab_con" class="tab_con" id="alarm_set">
	        	<jsp:include page="alarm_setting.do" flush="true" />
			</div>
		</div>
	 </div>
	<!-- 탭끝-->
</div>
	