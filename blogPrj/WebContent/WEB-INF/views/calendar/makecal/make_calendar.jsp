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
	$(".friend").hide();	
	
	var chk_no = $(this).find('#no_share').is(":checked");
	
	if(chk_no){
		$(".ck_state").append($("<p>나 혼자 캘린더를 사용합니다.</p>"));
	}
	
	$("#yes_share").click(function(){
		$(".friend").show();
		$(".ck_state p").remove();
		$(".ck_state").append($("<p>친구와 함께 일정을 공유하며 캘린더를 같이 사용할 수 있습니다.</p>"));
	});
	$("#no_share").click(function(){
		$(".friend").hide();
		$(".ck_state p").remove();
		$(".ck_state").append($("<p>나 혼자 캘린더를 사용합니다.</p>"));
	});
	
	

});	
</script>

<div id="section_cen">
	<div id="sch_header">
		<h3 style="display: inline-block;">캘린더 상세 보기</h3>
	</div>
	
	<div class="sch_body">
		<table width="90%">
		<!-- 캘린더명 시작 -->
		<tr class="article title">
			<td class="makecal_td">
				<span class="make_tit">캘린더명</span>
			</td>
			<td colspan="3">
				<div class="title_input" style="display: inline-block;">
					<input type="text" class="input_txt" id="title">
				</div>
				
				<button type="button" class="save_btn" >
					<em></em>
					<strong>색상변경</strong>
				</button>
			</td>
		</tr>	
		<!-- 캘린더명 끝 -->
		
		<!-- 설명 시작 -->			
		<tr class="article comment">
	    	<td class="makecal_td">
	    		<span class="make_tit">설명</span>
	    	</td>
	    	<td colspan="3">
				<textarea class="txt_ara" style="height:95px; width:785px; overflow-y:hidden; display: inline;" holder-message="일정에 필요한 설명을 남기세요.">일정에 필요한 설명을 남기세요.</textarea>
	    	</td>
	    </tr>
	    <!-- 설명 끝 -->
	    
	    <!-- 알림 시작 -->
	    <tr class="article alarm">
	    	<td class="makecal_td">
	    		<span class="make_tit">미리 알림 기본값</span>
	    	</td>
	    	<td colspan="3">
	
    		<span style="font-weight: normal;">일정</span>	
	    		<div class="selectbox13">
	        		<select class="selectbox-source"><option value="direct">직접 입력</option>
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
	    		<p style="color: #959595; font-weight: normal;">이 캘린더에 등록되는 일정과 기념일에 기본으로 설정되는 미리 알림 상태입니다.</p>	
			</td>
	    </tr>
    	<!-- 알림 끝-->
		
		<!-- 공유 설정 시작 -->
		<tr>
			<td class="makecal_td">
	    		<span class="make_tit">공유 설정</span>
	    	</td>
	    	<td colspan="3">
	    		<div class="" style="display: inline-block;">
					<p class="ck_state">
						<input type="radio" id="no_share" name="set_share_mode" value="no_share" checked=""><label for="no_share">혼자 사용하기</label>
						<input type="radio" id="yes_share" name="set_share_mode" value="yes_share"><label for="yes_share">친구와 사용하기</label>	
					</p>
					<c:if test=""></c:if>
		
				</div>
			</td>
		</tr>
		
		<!-- 참석자 시작 -->
		<tr class="friend">
			<td class="makecal_td">
	    		<span class="make_tit">친구 초대하기 설정</span>
	    	</td>
	    	<td colspan="3">
		    		<span class="tit">참석자</span>
					<input type="text" class="input_txt" autocomplete="off" data-default="이름 또는 이메일주소, 아이디를 입력하세요.">
			</td>
		</tr>
		<!-- 참석자 끝 -->
		
		
		<tr>
    	<td colspan="3">
    		<button type="button" class="save_btn" >
				<em></em>
				<strong>저장</strong>
			</button>
			
			<button type="button" class="save_btn" >
				<em></em>
				<strong>취소</strong>
			</button>
    	</td>
    </tr>
		
		</table>
	</div>
</div>