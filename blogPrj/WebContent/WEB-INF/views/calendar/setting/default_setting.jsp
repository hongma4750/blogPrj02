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



<!-- 일반설정 시작 -->
<div style="margin-top: 25px"></div>
<div role="tabpanel" class="tab-pane active" id="default_main">			
	<table cellpadding="0" cellspacing="0" width="960px" class="set_table">
		<colgroup>
			<col width="124"><col width="*">
		</colgroup>
		<tbody>
			<tr class="set_tr">
			<th class="set_th">캘린더 기본 화면 </th>
				<td class="set_td">
					<ul class="set_list">
						<li><input type="radio" name="default_main_view_mode" id="default_main_view_schedule" value="schedule_view" checked=""> <label for="default_main_view_schedule">일정 보기</label></li>
						<li><input type="radio" name="default_main_view_mode" id="default_main_view_task" value="task_view"> <label for="default_main_view_task">할일 보기</label></li>
					</ul>
				</td>
			</tr>
			
			<tr class="set_tr">
				<th class="set_th">일정 기본 화면</th>
				<td class="set_td">
					<ul class="set_list">
						<li><input type="radio" name="default_view_mode" id="default_view_day" class="_cfg_default_view_mode inp01" value="day"> <label for="default_view_day">일별 보기</label></li>
						<li><input type="radio" name="default_view_mode" id="default_view_week" class="_cfg_default_view_mode inp01" value="week"> <label for="default_view_week">주별 보기</label></li>
						<li><input type="radio" name="default_view_mode" id="default_view_month" class="_cfg_default_view_mode inp01" value="month" checked=""> <label for="default_view_month">월별 보기</label></li>
						<li><input type="radio" name="default_view_mode" id="default_view_list" class="_cfg_default_view_mode inp01" value="list"> <label for="default_view_list">전체 목록</label></li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
</div>	    
<!-- 일반설정 끝 -->

<div>
<table cellpadding="0" cellspacing="0" width="960px" style="margin-top: 15px;">
	<tr>
		<td colspan="2" style="text-align: center;">
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