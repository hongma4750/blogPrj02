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

<!-- font awesome -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

				
<script>
//아래와 같이 var 이름 = {};과 같이도 연습 해보자
/*    var divCtrl = {
   show : function(){
      jQuery("#category_list").show("fast");
   }
   ,
   hide: function(){
      jQuery("#category_list").hide("fast");
   }
};
*/
 $(document).ready(function(){
	$(".view_btn").click(function(){
		$("#category_list").toggle("fast");
	})
});






$(function() {
	var chk = 0;
	$(".pluse").click(function(){
		if (chk == 0){
			chk = 1;
			document.getElementById('make_open_menu').style.display ="block"; 
		}else{
			chk = 0;
			document.getElementById('make_open_menu').style.display ="none";
		}
	});	
});


$(function() {
	var chk = 0;
	$(".pluse").click(function(){
		if (chk == 0){
			chk = 1;
			document.getElementById('make_open_menu').style.display ="block"; 
		}else{
			chk = 0;
			document.getElementById('make_open_menu').style.display ="none";
		}
	});	
});
</script>

<div class="all">
<!-- 왼쪽 버튼  -->
	<div class="btn_workset"  style="background-color:white;">
		<a href="#" onclick="url_schwrite()" class="write_schedule">
			<span class="sch_wbtn">일정, 약속쓰기</span>
		</a>
		<!-- <a href="#" class="write_schedule">
			<span class="">기념일 관리</span>
		</a> -->
	</div>
	
	
	<!-- 미니 캘린더 -->
	<div class="mini_cal" style="background-color:pink;">
		미니캘린더 자리			
	</div>
	
	<!-- 전체 일정 보기 -->
	<div class="all_view">
		<a href="#" onclick="url_calendar()" class="write_schedule"> <!-- url 구현해야함 -->
			<span class="">전체 일정 보기</span>
		</a>
	</div>
	
	
	<!-- 내 캘린더 목록보기, 캘린더 생성, 캘린더 설정 -->
	<div class="mycal">
			
		<span class="cal_tit">
			<button class="view_btn">
			</button>
			<span>
        	내 캘린더
        	</span>        	
        	
        	<!-- 캘린더 만들기 시작 -->
        	<span>
				<div class="cal_make">
					<a href="#" class="pluse"><i class="fa fa-plus" aria-hidden="true"></i></a>
				</div>
			</span>
			<!-- 캘린더 만들기 끝 -->
			
			<!-- 캘린더 설정 버튼 -->
			<span class="cal_set">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="url_setting()">			
					<i class="fa fa-cog" aria-hidden="true"></i>	 
					<span class="blind">설정</span>
				</a>
			</span>
			<!-- 캘린더 설정 버튼 끝 -->
			
		</span>
		<!-- end of cal_tit -->
		
		</div>
	<!-- end of mycal -->
	<div>				
		

		
		<!-- 생성된 캘린더 리스트 시작 -->
		<div id="category_list">
			<ul class="category_list">
            	<li> 내 캘린더 리스트1</li>
            	<li> 내 캘린더 리스트2</li>
            	<li> 내 캘린더 리스트3</li>
            </ul>
		</div>
		<!-- 생성된 캘린더 리스트 끝 -->
		
		
		
		
	</div>

	<!-- 중요 일정 보기 시작 -->
	<div id="important_view">
		<a href="#" onclick="url_calendar()" class="write_schedule"> <!-- url 구현해야함 -->
			<span class="">중요 일정 보기 </span>
		</a>	
    </div>
	<!-- 중요 일정 보기 끝 -->
	
	<div id="old_clean">
		<a href="#" onclick="url_calendar()" class="write_schedule"> <!-- url 구현해야함 -->
			<span class="">오래된 일정 정리하기</span>
		</a>		
	</div>
	

			

		
		<div id="make_open_menu" class="calendar_menu " style="top: -50px; left: 212px; z-index: 32001; display: none; position: relative;">
		    <div class="calendar_menu_layer">
		        <ul class="action_list">
		            <li class="_private"><a href="#" onclick="url_makecalendar()">내 캘린더 만들기</a></li>
		            <li class="_share"><a href="#" onclick="url_make_share_calendar()">공유 캘린더 만들기</a></li>
		  
		        </ul>
		    </div>
		</div>
         	
</div>		
