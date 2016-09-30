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


<!-- date picker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<!-- 달력 쓰기에 필요함 -->
<%@page import="sist.co.help.myCal"%>
<%@page import="java.util.Calendar"%>

<!-- 자동완성.. -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>


<%!
public String two (String msg){
	return msg.trim().length() < 2 ? "0"+msg : msg.trim(); 
}
%>

<%
myCal mycal = (myCal)request.getAttribute("mycal");

String year = "" + mycal.getYear();
String month = "" + mycal.getMonth();
String day = "" + mycal.getDay();

Calendar cal = Calendar.getInstance();

int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);	//24시간
int tmin = cal.get(Calendar.MINUTE);
%>


<script>
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

/* date picker */
$(function(){
	$("#datepicker1, #datepicker2").datepicker();
});

/* 기본으로 오늘 날짜로 설정 */
$(function() {  
	
	$('#datepicker1').val($.datepicker.formatDate($.datepicker.ATOM, new Date())); 
    $('#datepicker2').val($.datepicker.formatDate($.datepicker.ATOM, new Date())); 
     
});
    	
/* 종일 클릭 시*/
$(function(){
	 $(".allday_chk").click(function(){
		
	if($(".allday_chk").is(":checked")){
		$("#start_time").attr("disabled", true);
		$(".time_selectbox-source").attr("class", "time_selectbox-source-disabled");
		
		}else{
			$("#start_time").attr("disabled", false);
			$(".time_selectbox-source-disabled").attr("class", "time_selectbox-source");
		}
	});
	
});


/* 저장할 때 날짜 값 전달 */
window.onload = function(){
$("#save").click(function(){
	

	var syear = $('#datepicker1').val().substring(0,4);
	var smonth = $('#datepicker1').val().substring(5,7);
	var sday = $('#datepicker1').val().substring(8,11);

	$('#syear').val(syear);
	$('#smonth').val(smonth);
	$('#sday').val(sday);
	
	var eyear = $('#datepicker2').val().substring(0,4);
	var emonth = $('#datepicker2').val().substring(5,7);
	var eday = $('#datepicker2').val().substring(8,11);

	$('#eyear').val(eyear);
	$('#emonth').val(emonth);
	$('#eday').val(eday);
	
	
	if($('#start_time').attr("disabled")){
		$('#start_time').removeAttr('disabled');
		$("#start_time option").val("종일");
		$("#end_time option").val("종일");
	}
	
	
	
	})
	
}; 

// 이전으로 돌아가기
$(function(){
	$(".pre").click(function(){
		history.go(-1);
	})
});


$(function(){
	$(".cancel").click(function(){
		this.form.reset();
	})
});
</script>


<div id="section_cen">
<form action="schwriteAf.do" method="post">
	
	<!-- 헤더 시작 -->
	<div class="sch_header">
	<table>
		<tr>
			<td colspan="2" height="53px">
				<h3 style="display: inline-block; font-size: 13px; font-weight: bold;">일정 등록</h3>
				|
				<a href="#" class="pre" style="font-size: 13px;">이전으로 돌아가기</a>
			</td>
		</tr>
		 <tr>
		 	<td>
				<button type="submit" class="save_btn" id="save">
					<strong>저장</strong>
				</button>
				<button type="button" class="cancel" >
					<strong>취소</strong>
				</button>
			</td>
		</tr> 
	</table>
	</div>
	<!-- 헤더 끝 -->
	
	
	<!-- 바디 시작 -->
	<div class="sch_body">
	
	<table width="90%">
	<!-- 제목 시작 -->
	<tr class="sch_tr title">
	
	
	
		<td colspan="9">
			<input type="hidden" name='sch_id' value="${login.m_id }">
			<span class="tit">제목</span>
			
			<div style="display: inline-block;">
				<input type="text" class="input_txt" name="sch_title" id="sch_title">
			</div>
			
			<div class="important_chk" style="display: inline;">
				<span>
					<input type="checkbox" name="sch_star" id="important_chk" value="1" style="display: inline-block;">
					<label for="important_chk">중요</label>
				</span> 
			</div>
		</td>				
	</tr>
	<!-- 제목 끝 -->
	
	
	<!-- 장소 시작 -->
	<tr>
		<td>
			<div class="sch_tr place">
				<span class="tit">장소</span>
					<input type="text" name="sch_location" class="input_txt">
			</div>
		</td>
	</tr>
	<!-- 장소  끝-->
	
	
	<!-- 일시 시작 -->
	<tr class="sch_tr date" style="height: 66px;">
		<td colspan="9" >
			<span class="tit">일시</span>
			
			<select class="selectbox-source">
            	<option value="0">양력</option>
            	<option value="1">음력</option>
        	</select>
        	
      
        	<input type="text" id="datepicker1" class="date_input" name="sch_stardate" value="">
			<input type="hidden" id="syear" name="syear" value="">
			<input type="hidden" id="smonth" name="smonth" value="">
			<input type="hidden" id="sday" name="sday" value="">
			
			<div class="selectbox13" data-lang-am="오전" data-lang-pm="오후" data-alert="형식에 맞게 입력해주세요
			예) 1230, 3:10, 오후 2시">
        
    			<select id="start_time" name='sch_starttime' class="time_selectbox-source">
					<option value="오전 12:00">오전 12:00</option>
					<option value="오전 12:30">오전 12:30</option>
					<option value="오전 01:00">오전 01:00</option>
					<option value="오전 01:30">오전 01:30</option>
					<option value="오전 02:00">오전 02:00</option>
					<option value="오전 02:30">오전 02:30</option>
					<option value="오전 03:00">오전 03:00</option>
					<option value="오전 03:30">오전 03:30</option>
					<option value="오전 04:00">오전 04:00</option>
					<option value="오전 04:30">오전 04:30</option>
					<option value="오전 05:00">오전 05:00</option>
					<option value="오전 05:30">오전 05:30</option>
					<option value="오전 06:00">오전 06:00</option>
					<option value="오전 06:30">오전 06:30</option>
					<option value="오전 07:00">오전 07:00</option>
					<option value="오전 07:30">오전 07:30</option>
					<option value="오전 08:00">오전 08:00</option>
					<option value="오전 08:30">오전 08:30</option>
					<option value="오전 09:00">오전 09:00</option>
					<option value="오전 09:30">오전 09:30</option>
					<option value="오전 10:00">오전 10:00</option>
					<option value="오전 10:30">오전 10:30</option>
					<option value="오전 11:00">오전 11:00</option>
					<option value="오전 11:30">오전 11:30</option>
					<option value="오후 12:00">오후 12:00</option>
					<option value="오후 12:30">오후 12:30</option>
					<option value="오후 01:00">오후 01:00</option>
					<option value="오후 01:30">오후 01:30</option>
					<option value="오후 02:00">오후 02:00</option>
					<option value="오후 02:30">오후 02:30</option>
					<option value="오후 03:00">오후 03:00</option>
					<option value="오후 03:30">오후 03:30</option>
					<option value="오후 04:00">오후 04:00</option>
					<option value="오후 04:30">오후 04:30</option>
					<option value="오후 05:00">오후 05:00</option>
					<option value="오후 05:30">오후 05:30</option>
					<option value="오후 06:00">오후 06:00</option>
					<option value="오후 06:30">오후 06:30</option>
					<option value="오후 07:00">오후 07:00</option>
					<option value="오후 07:30">오후 07:30</option>
					<option value="오후 08:00">오후 08:00</option>
					<option value="오후 08:30">오후 08:30</option>
					<option value="오후 09:00">오후 09:00</option>
					<option value="오후 09:30">오후 09:30</option>
					<option value="오후 10:00">오후 10:00</option>
					<option value="오후 10:30">오후 10:30</option>
					<option value="오후 11:00">오후 11:00</option>
					<option value="오후 11:30">오후 11:30</option>
    			</select>
			</div>
    		
    		<span class="bar">  -  </span>
    		
    		
    		<input type="text" id="datepicker2" class="date_input" name="sch_enddate">
			<input type="hidden" name="eyear" id="eyear">
			<input type="hidden" name="emonth" id="emonth">
			<input type="hidden" name="eday" id="eday">
			
			
			
		<div class="selectbox13" data-lang-am="오전" data-lang-pm="오후" data-alert="형식에 맞게 입력해주세요
			예) 1230, 3:10, 오후 2시">
	        <select id="end_time" name='sch_endtime' class="time_selectbox-source">
				<option value="오전 12:00">오전 12:00</option>
				<option value="오전 12:30">오전 12:30</option>
				<option value="오전 01:00">오전 01:00</option>
				<option value="오전 01:30">오전 01:30</option>
				<option value="오전 02:00">오전 02:00</option>
				<option value="오전 02:30">오전 02:30</option>
				<option value="오전 03:00">오전 03:00</option>
				<option value="오전 03:30">오전 03:30</option>
				<option value="오전 04:00">오전 04:00</option>
				<option value="오전 04:30">오전 04:30</option>
				<option value="오전 05:00">오전 05:00</option>
				<option value="오전 05:30">오전 05:30</option>
				<option value="오전 06:00">오전 06:00</option>
				<option value="오전 06:30">오전 06:30</option>
				<option value="오전 07:00">오전 07:00</option>
				<option value="오전 07:30">오전 07:30</option>
				<option value="오전 08:00">오전 08:00</option>
				<option value="오전 08:30">오전 08:30</option>
				<option value="오전 09:00">오전 09:00</option>
				<option value="오전 09:30">오전 09:30</option>
				<option value="오전 10:00">오전 10:00</option>
				<option value="오전 10:30">오전 10:30</option>
				<option value="오전 11:00">오전 11:00</option>
				<option value="오전 11:30">오전 11:30</option>
				<option value="오후 12:00">오후 12:00</option>
				<option value="오후 12:30">오후 12:30</option>
				<option value="오후 01:00">오후 01:00</option>
				<option value="오후 01:30">오후 01:30</option>
				<option value="오후 02:00">오후 02:00</option>
				<option value="오후 02:30">오후 02:30</option>
				<option value="오후 03:00">오후 03:00</option>
				<option value="오후 03:30">오후 03:30</option>
				<option value="오후 04:00">오후 04:00</option>
				<option value="오후 04:30">오후 04:30</option>
				<option value="오후 05:00">오후 05:00</option>
				<option value="오후 05:30">오후 05:30</option>
				<option value="오후 06:00">오후 06:00</option>
				<option value="오후 06:30">오후 06:30</option>
				<option value="오후 07:00">오후 07:00</option>
				<option value="오후 07:30">오후 07:30</option>
				<option value="오후 08:00">오후 08:00</option>
				<option value="오후 08:30">오후 08:30</option>
				<option value="오후 09:00">오후 09:00</option>
				<option value="오후 09:30">오후 09:30</option>
				<option value="오후 10:00">오후 10:00</option>
				<option value="오후 10:30">오후 10:30</option>
				<option value="오후 11:00">오후 11:00</option>
				<option value="오후 11:30">오후 11:30</option>
    		</select>
		</div>
		
		<span>
			<input type="checkbox" name="sch_allday" class="allday_chk" style="display: inline-block;" value="1">	<!-- 종일이면 1 -->
			<label for="important_chk">종일</label>
		</span>
		
    	</td>
    	
    </tr> 
    <!-- 일시 끝 -->
    
    
    
    <!-- 참석자 시작 -->
    <tr id="invitee" class="sch_tr invitee">
    	<td colspan="9">
    		<span class="tit">참석자</span>
			<input type="text" class="input_txt" autocomplete="off" data-default="이름 또는 이메일주소, 아이디를 입력하세요.">
			<a class="_btn_add on" href="#"><em>추가</em></a>
			<span class="address_btn">
				<button type="button" class="_btn_contact_list">
						<strong>이웃 목록</strong>
				</button>
			</span>
		</td>
	</tr>
	<!-- 참석자 끝 -->
    
    <!-- 참석자 목록 시작 -->
    <tr id="invitee_list"> 
    	<td colspan="9">
    		<!-- <form runat="server"> -->
        <input id="test" type="text" onclick="invitee(${login.m_id })" />
    		<!-- </form> -->
    <script type="text/javascript">
        $(function () {
        	alert("되니");
           /*  var availableTags = [
              "ActionScript",
              "AppleScript",
              "Asp",
              "BASIC",
              "C",
              "C++",
              "Clojure",
              "COBOL",
              "ColdFusion",
              "Erlang",
              "Fortran",
              "Groovy",
              "Haskell",
              "Java",
              "JavaScript",
              "Lisp",
              "Perl",
              "PHP",
              "Python",
              "Ruby",
              "Scala",
              "Scheme"
            ]; */
            

            $(function invitee(id){
            	 $('#test').autocomplete({
                	
                    source : function( id ) {
                         $.ajax({
                                type: 'post',
                                url: "<%=application.getContextPath() %>/sch_invitee.do?m_id="+id+"",
                                //dataType: "json",
                                //request.term = $("#autocomplete").val()
                                async:true,
                                data: id,
                                success: function(fdto) {
                                    //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                                     response( 
                                        $.map(data, function(fdto) {
                                            return {
                                                label: fdto.data,
                                                value: fdto.data
                                            }
                                        })
                                    ); 
                                	alert(성공1);
                                    alert(fdto.get(0).getFnd_fndid()); 
                                }
                           });
                        },
                    //조회를 위한 최소글자수
                    minLength: 1,
                    select: function( event, ui ) {
                        // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
                    },
                    selectFirst: true,
                    open: function () {
                        $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
                    },
                    close: function () {
                        $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
                    }
                       
                      
                });
            })
           /*  $('#test').autocomplete({
                source: availableTags,
                select: function (event, ui) {
                    //아이템 선택시 처리 코드
                },
                selectFirst: true,
                minLength: 1,
               
            }); */
        });
        
    </script>
		</td>
		
    </tr>
    <!-- 참석자 목록 끝 -->
    
    
    <!-- 공개여부 시작 -->
    <tr id="open_schedule" class="sch_tr open">
    	<td colspan="9">
    		<span class="tit">공개</span>
				<div class="cont" style="display: inline-block;">
					<p class="ck_state">
						<input type="radio" id="public_default" name="set_public_mode" value="public_default" checked="" name="sch_public"><label for="public_default">기본</label>
						<input type="radio" id="public_private" name="set_public_mode" value="public_private" name="sch_public"> <label for="public_private">비공개</label>
						<a href="#" class="_public_help link_help pos_help">?</a>		
					</p>
				</div>
    	</td>
    </tr>
    <!-- 공개여부 끝 -->
    
    
    <!-- 스티커 시작 -->
    <tr class="sch_tr sticker">
    	<td colspan="9">
    		<span class="tit" >스티커</span>			
			
				<div class="sticker">
				<div class="select_thumb">
					<ul class="sticker_section">
						<li class="_sticker " key="501">
						
						<!--  -->
						<input type="hidden" name="sch_sticker" value="없음">
							<button type="button" class="ico_stic501" alt="" title="" >
								<strong>없음</strong>
							</button>
						</li>
					</ul>
				</div>
				<ul class="_history_list sticker_section" ">
					<li class="_sticker over" key="501" >
						<button type="button" class="ico_stic501" alt="없음" title="없음">
							<strong>없음</strong>
						</button>
					</li>
					<li class="_sticker" key="5">
						<button type="button" class="ico_stic5" alt="" title="">
							<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/5.png" alt="" >
						</button>
					</li>
					<li class="_sticker " key="125">
						<button type="button" class="ico_stic125" alt="" title="">
							<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/125.png" alt="">
						</button>
					</li>
					<li class="_sticker " key="625">
						<button type="button" class="ico_stic625" alt="" title="">
							<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/625.png" alt="">
						</button>
					</li>
					<li class="_sticker " key="528">
						<button type="button" class="ico_stic528" alt="" title="">
							<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/528.png" alt="">
	
						</button>
					</li>
				</ul>
				
				<button type="button" class="sticker_more" data-toggle="modal" data-target="#stk_modal">
					<span>
						<em>더보기</em>
					</span>
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="stk_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">스티커</h4>
					      </div>
					      <div class="modal-body">
						<div class="_tab2_content sticker_list small" style="display: block;">
					<span class="blind">스티커 리스트</span>
					<ul class="_small_sticker_list">
	

<li class="_sticker" key="2" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/2.png" title="선물" alt="선물">	
	</button>
</li>
<li class="_sticker" key="5" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/5.png" title="맑음" alt="맑음">
	</button>
</li>
<li class="_sticker" key="6" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/6.png" title="생일" alt="생일">
	</button>
</li>
<li class="_sticker" key="7" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/7.png" title="회의" alt="회의">
	</button>
</li>
<li class="_sticker" key="8" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/8.png" title="파티" alt="파티">
	</button>
</li>
<li class="_sticker" key="10" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/10.png" title="봄" alt="봄">
	</button>
</li>
<li class="_sticker" key="12" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/12.png" title="제사" alt="제사">
	</button>
</li>
<li class="_sticker" key="13" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/13.png" title="약속" alt="약속">
	</button>
</li>
<li class="_sticker" key="14" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/14.png" title="시험" alt="시험">
	</button>
</li>
<li class="_sticker" key="15" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/15.png" title="여름" alt="여름">
	</button>
</li>
<li class="_sticker" key="16" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/16.png" title="예비군" alt="예비군">
	</button>
</li>
<li class="_sticker" key="17" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/17.png" title="결혼" alt="결혼">
	</button>
</li>
<li class="_sticker" key="18" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/18.png" title="출장" alt="출장">
	</button>
</li>
<li class="_sticker" key="19" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/19.png" title="사랑" alt="사랑">
	</button>
</li>
<li class="_sticker" key="20" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/20.png" title="편지" alt="편지">
	</button>
</li>
<li class="_sticker" key="23" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/23.png" title="눈" alt="눈">
	</button>
</li>
<li class="_sticker" key="24" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/24.png" title="꽃" alt="꽃">
	</button>
</li>
<li class="_sticker" key="25" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/25.png" title="전화" alt="전화">
	</button>
</li>
<li class="_sticker" key="26" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/26.png" title="말풍선" alt="말풍선">
	</button>
</li>
<li class="_sticker" key="30" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/30.png" title="병원" alt="병원">
	</button>
</li>
<li class="_sticker" key="32" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/32.png" title="월드컵" alt="월드컵">
	</button>
</li>
<li class="_sticker" key="36" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/36.png" title="결혼식" alt="결혼식">	
	</button>
</li>
<li class="_sticker" key="37" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/37.png" title="돌잔치" alt="돌잔치">		
	</button>
</li>
<li class="_sticker" key="38" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/38.png" title="조문" alt="조문">		
	</button>
</li>
<li class="_sticker" key="39" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/39.png" title="D-DAY" alt="D-DAY">		
	</button>
</li>
<li class="_sticker" key="40" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/40.png" title="크리스마스1" alt="크리스마스1">		
	</button>
</li>
<li class="_sticker" key="41" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/41.png" title="발렌타인데이" alt="발렌타인데이">		
	</button>
</li>
<li class="_sticker" key="42" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/42.png" title="화이트데이" alt="화이트데이">		
	</button>
</li>
<li class="_sticker" key="44" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/44.png" title="카드결제" alt="카드결제">		
	</button>
</li>
<li class="_sticker" key="45" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/45.png" title="은행" alt="은행">		
	</button>
</li>
<li class="_sticker" key="83" data-sticker-pos="">
	<button>	
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/83.png" title="대회" alt="대회">	
	</button>
</li>
<li class="_sticker" key="84" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/84.png" title="공부" alt="공부">		
	</button>
</li>
<li class="_sticker" key="86" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/86.png" title="동아리" alt="동아리">		
	</button>
</li>
<li class="_sticker" key="87" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/87.png" title="보고" alt="보고">		
	</button>
</li>
<li class="_sticker" key="89" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/89.png" title="월급날" alt="월급날">		
	</button>
</li>
<li class="_sticker" key="90" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/90.png" title="칼퇴" alt="칼퇴">	
	</button>
</li>
<li class="_sticker" key="91" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/91.png" title="야근" alt="야근">		
	</button>
</li>
<li class="_sticker" key="94" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/94.png" title="가계부" alt="가계부">		
	</button>
</li>
<li class="_sticker" key="96" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/96.png" title="마트" alt="마트">		
	</button>
</li>
<li class="_sticker" key="97" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/97.png" title="학교당번" alt="학교당번">		
	</button>
</li>
<li class="_sticker" key="98" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/98.png" title="다이어트" alt="다이어트">		
	</button>
</li>
<li class="_sticker" key="99" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/99.png" title="생리일" alt="생리일">		
	</button>
</li>
<li class="_sticker" key="113" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/113.png" title="성화&amp;월계관" alt="성화&amp;월계관">		
	</button>
</li>
<li class="_sticker" key="114" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/114.png" title="택배" alt="택배">		
	</button>
</li>
<li class="_sticker" key="115" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/115.png" title="휴일" alt="휴일">		
	</button>
</li>
<li class="_sticker" key="116" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/116.png" title="태극기" alt="태극기">
	</button>
</li>
<li class="_sticker" key="125" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/125.png" title="추석" alt="추석">		
	</button>
</li>
<li class="_sticker" key="131" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/131.png" title="체육대회" alt="체육대회">
	</button>
</li>
<li class="_sticker" key="132" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/132.png" title="수강신청" alt="수강신청">		
	</button>
</li>
<li class="_sticker" key="133" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/133.png" title="축제" alt="축제">		
	</button>
</li>
<li class="_sticker" key="135" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/135.png" title="과학" alt="과학">		
	</button>
</li>
<li class="_sticker" key="136" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/136.png" title="한문" alt="한문">		
	</button>
</li>
<li class="_sticker" key="137" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/137.png" title="외국어" alt="외국어">		
	</button>
</li>
<li class="_sticker" key="139" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/139.png" title="수학" alt="수학">		
	</button>
</li>
<li class="_sticker" key="140" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/140.png" title="역사" alt="역사">		
	</button>
</li>
<li class="_sticker" key="141" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/141.png" title="세탁소" alt="세탁소">		
	</button>
</li>
<li class="_sticker" key="142" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/142.png" title="수유" alt="수유">		
	</button>
</li>
<li class="_sticker" key="143" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/143.png" title="할로윈" alt="할로윈">		
	</button>
</li>
<li class="_sticker" key="144" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/144.png" title="D-100" alt="D-100">		
	</button>
</li>
<li class="_sticker" key="145" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/145.png" title="D+100" alt="D+100">		
	</button>
</li>
<li class="_sticker" key="146" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/146.png" title="D+1000" alt="D+1000">		
	</button>
</li>
<li class="_sticker" key="147" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/147.png" title="교회" alt="교회">		
	</button>
</li>
<li class="_sticker" key="148" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/148.png" title="절" alt="절">		
	</button>
</li>
<li class="_sticker" key="158" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/158.png" title="채용" alt="채용">	
	</button>
</li>
<li class="_sticker" key="161" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/161.png" title="워크숍" alt="워크숍">		
	</button>
</li>
<li class="_sticker" key="162" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/162.png" title="세미나" alt="세미나">		
	</button>
</li>
<li class="_sticker" key="163" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/163.png" title="수능" alt="수능">		
	</button>
</li>
<li class="_sticker" key="164" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/164.png" title="빼빼로데이" alt="빼빼로데이">		
	</button>
</li>
<li class="_sticker" key="165" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/165.png" title="선거" alt="선거">		
	</button>
</li>
<li class="_sticker" key="169" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/169.png" title="약" alt="약">		
	</button>
</li>
<li class="_sticker" key="170" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/170.png" title="세차" alt="세차">		
	</button>
</li>

<li class="_sticker" key="176" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/176.png" title="천둥" alt="천둥">	
	</button>
</li>
<li class="_sticker" key="177" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/177.png" title="무지개" alt="무지개">		
	</button>
</li>
<li class="_sticker" key="178" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/178.png" title="금연" alt="금연">		
	</button>
</li>
<li class="_sticker" key="179" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/179.png" title="당직" alt="당직">		
	</button>
</li>
<li class="_sticker" key="181" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/181.png" title="김장" alt="김장">		
	</button>
</li>
<li class="_sticker" key="182" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/182.png" title="크리스마스2" alt="크리스마스2">		
	</button>
</li>
<li class="_sticker" key="183" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/183.png" title="크리스마스3" alt="크리스마스3">		
	</button>
</li>
<li class="_sticker" key="184" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/184.png" title="크리스마스4" alt="크리스마스4">		
	</button>
</li>
<li class="_sticker" key="185" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/185.png" title="크리스마스5" alt="크리스마스5">		
	</button>
</li>
<li class="_sticker" key="186" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/186.png" title="2013뱀" alt="2013뱀">		
	</button>
</li>
<li class="_sticker" key="187" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/187.png" title="설날1" alt="설날1">		
	</button>
</li>
<li class="_sticker" key="188" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/188.png" title="설날2" alt="설날2">		
	</button>
</li>
<li class="_sticker" key="189" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/189.png" title="납부" alt="납부">		
	</button>
</li>
<li class="_sticker" key="192" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/192.png" title="면접" alt="면접">		
	</button>
</li>
<li class="_sticker" key="193" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/193.png" title="방학" alt="방학">		
	</button>
</li>
<li class="_sticker" key="194" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/194.png" title="A+" alt="A+">		
	</button>
</li>
<li class="_sticker" key="195" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/195.png" title="F" alt="F">		
	</button>
</li>
<li class="_sticker" key="199" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/199.png" title="졸업" alt="졸업">		
	</button>
</li>
<li class="_sticker" key="211" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/211.png" title="어린이날" alt="어린이날">		
	</button>
</li>
<li class="_sticker" key="212" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/212.png" title="어버이날" alt="어버이날">		
	</button>
</li>
<li class="_sticker" key="213" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/213.png" title="스승의날" alt="스승의날">		
	</button>
</li>
<li class="_sticker" key="214" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/214.png" title="선풍기" alt="선풍기">		
	</button>
</li>
<li class="_sticker" key="215" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/215.png" title="장화" alt="장화">		
	</button>
</li>
<li class="_sticker" key="239" data-sticker-pos="">
	<button>	
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/239.png" title="2014말" alt="2014말">	
	</button>
</li>
<li class="_sticker" key="240" data-sticker-pos="">
	<button>	
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/240.png" title="새해1" alt="새해1">		
	</button>
</li>
<li class="_sticker" key="241" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/241.png" title="새해2" alt="새해2">		
	</button>
</li>
<li class="_sticker" key="242" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/242.png" title="굿나잇" alt="굿나잇">		
	</button>
</li>
<li class="_sticker" key="247" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/247.png" title="이벤트" alt="이벤트">
	</button>
</li>
<li class="_sticker" key="248" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/248.png" title="청소중" alt="청소중">		
	</button>
</li>
<li class="_sticker" key="249" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/249.png" title="퇴근길" alt="퇴근길">		
	</button>
</li>
<li class="_sticker" key="253" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/253.png" title="업무중" alt="업무중">		
	</button>
</li>
<li class="_sticker" key="254" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/254.png" title="출근길" alt="출근길">
	</button>
</li>
<li class="_sticker" key="258" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/258.png" title="모닝콜" alt="모닝콜">
	</button>
</li>
<li class="_sticker" key="261" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/261.png" title="조부모님" alt="조부모님">		
	</button>
</li>
<li class="_sticker" key="262" data-sticker-pos="">
	<button>		
			<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/262.png" title="갓난아기" alt="갓난아기">
	</button>
</li>
<li class="_sticker" key="264" data-sticker-pos="">
	<button>	
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/264.png" title="이삿짐차" alt="이삿짐차">		
	</button>
</li>
<li class="_sticker" key="265" data-sticker-pos="">
	<button>	
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/265.png" title="성묘" alt="성묘">	
	</button>
</li>
<li class="_sticker" key="266" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/266.png" title="카네이션" alt="카네이션">		
	</button>
</li>
<li class="_sticker" key="267" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/267.png" title="학교" alt="학교">		
	</button>
</li>
<li class="_sticker" key="268" data-sticker-pos="">
	<button>
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/268.png" title="학생" alt="학생">		
	</button>
</li>
<li class="_sticker" key="269" data-sticker-pos="">
	<button>		
		<img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/269.png" title="회사원" alt="회사원">	
	</button>
</li>
</ul>


</div>
						
						
						
						
						
						
						
						
						
						
						
					      </div>
					      <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">저장</button>
					      </div>
					    </div>
					  </div>
				</div>
			</div>
			
			<div class="line"></div>
    	</td>
    </tr>
    
    <!-- 설명 시작 -->
    <tr class="sch_tr comment">
    	<td colspan="9">
    		<span class="tit" style="display: inline;">설명</span>
				<textarea class="txt_ara" name="sch_content" style="height:95px; width:785px; overflow-y:hidden; display: inline;" holder-message="일정에 필요한 설명을 남기세요.">일정에 필요한 설명을 남기세요.</textarea>
    	</td>
    </tr>
    <!-- 설명 끝 -->
    
    
    <!-- 문서 시작 -->
    <tr class="sch_tr document">
    	<td colspan="9">
			<span class="tit" style="display: inline;">문서</span>
				<form style="display: inline;" action="" method="post" enctype="multipart/form-data" target="ifr_upload" id="uploadFileAction" name="uploadFileAction">
					<input type="file" id="uploadFile" name="sch_docname" class="_input_doc_file input_doc_file">
				</form>
    	</td>
    </tr>
    <!-- 문서 끝 -->
    
    
    <!-- 알림 시작 -->
    <tr class="sch_tr alarm">
    	<td colspan="9">
    	<span class="tit">알림</span>	
    		<div class="selectbox13" >
        		<select class="selectbox-source" name="sch_alarm">
					<option value="0M">정시</option>
					<option value="5M">5분 전</option>
					<option value="10M">10분 전</option>
					<option value="15M">15분 전</option>
					<option value="30M">30분 전</option>
					<option value="1H">1시간 전</option>
					<option value="2H">2시간 전</option>
					<option value="3H">3시간 전</option>
					<option value="12H">12시간 전</option>
					<option value="24H">1일(24시간) 전</option>
					<option value="48H">2일(48시간) 전</option>
					<option value="1W">1주일(168시간) 전</option>
				</select>        	
    		</div>
			<a href="#" class="alarm_del" alarmindex="1"><span class="blind">알림 삭제</span>삭제</a>
			
		</td>
    </tr>
    <!-- 알림 끝-->
    
<!--     <tr>
    	<td colspan="9">
    	
    		<button type="submit" class="save_btn" id="save">
				<em></em>
				<strong>저장</strong>
			</button>
			
			<button type="button" class="save_btn" >
				<em></em>
				<strong>취소</strong>
			</button>
    	</td>
    </tr> -->
	</table>
	
	</div>
	
</form>
</div>
