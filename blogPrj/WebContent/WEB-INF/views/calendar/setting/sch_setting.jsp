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
<p style="font-weight: bold;">내 캘린더 목록</p>
<div role="tabpanel" class="tab-pane active" id="default_main">			
	<table cellpadding="0" cellspacing="0" width="960px" class="set_table">
		<colgroup>
			<col width="250"><col width="150"><col width="150"><col width="140"><col width="111">
		</colgroup>
		<thead>
			<tr class="sch_set_th">
				<th class="">캘린더</th>
				<th>기본캘린더</th>
				<th>목록에 표시</th>
				<th class="">삭제</th>
				<th class="">순서변경</th>
			</tr>
		</thead>
		<tbody class="">
		
			<tr class="sch_set_th">
				<td class="sch_set_td">
					<span class=""></span> 
						<a href="#" class="_calendar_name" data-value="">
							<strong>ㅇㅇㅇㅇㅇㅇ</strong>
						</a>
					<span class="">[공유 중 - 마스터]</span>		
				</td>
				<td><input type="radio" name="default_calendar" id="" title="기본캘린더" class="" value=""></td>
				<td><input type="checkbox" name="" title="목록에 표시" class="" value="" checked=""></td>
				<td class="">
					<div class="">
						<a href="#" class="_del_handover link">양도</a>
						<span class="bar">|</span>
						<a href="#" class="_del_dropout link">탈퇴</a>
						<span class="bar">|</span>
						<a href="#" class="_del_close link">폐쇄</a>
					</div>
				</td>
				<td class="">
					<div class="">
						<a href="#" class="set_btn_upup" data-value="">맨위</a>
						<a href="#" class="set_btn_up" data-value="">위</a>
						<a href="#" class="set_btn_down" data-value="">아래</a>
						<a href="#" class="set_btn_down" data-value="">맨아래</a>
					</div>
				</td>
			</tr>
	
		<tr class="sch_set_th">
			<td class="sch_set_td">
				<span class=""></span> 
				<a href="#" class="" data-value="">
					<strong>내 캘린더</strong>
				</a>
			</td>
			<td>
				<input type="radio" name="default_calendar" id="" title="기본캘린더" class="" value="" checked="">
			</td>
			<td>
				<input type="checkbox" name="" title="목록에 표시" class="" value="0" checked="" disabled="">
			</td>
			<td>
			</td>
			<td class="setorder">
				<div class="">
					<a href="#" class="" data-value="">맨위</a>
					<a href="#" class="" data-value="">위</a>
					<a href="#" class="" data-value="">아래</a>
					<a href="#" class="" data-value="">맨아래</a>
				</div>
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