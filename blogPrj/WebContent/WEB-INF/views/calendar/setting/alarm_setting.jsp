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
<p style="font-weight: bold;">미리 알림 기본값 설정</p>
<div role="tabpanel" class="tab-pane active" id="default_main">			
	<table cellpadding="0" cellspacing="0" width="980px" class="set_table">
		<colgroup>
			<col width="210"><col width="*"><col width="*"><col width="*">
		</colgroup>
		<thead>
			<tr class="sch_set_th">
				<th class="" >캘린더</th>
				<th colspan="3">일정 등록 시 미리 알림 기본값</th>
			</tr>
		</thead>
		
		<tbody class="">		
			<tr class="sch_set_th">
				<td class="sch_set_td">
						<a href="#" class="_calendar_name" data-value="">
							<strong>ㅇㅇㅇㅇㅇㅇ</strong>
						</a>	
				</td>
				<td><strong>[일정] 10분 전 팝업</strong></td>
				<td><strong>[종일일정/기념일] 하루 전 정오 팝업</strong></td>
				<td class="">
					<button class="" data-value="">수정</button>
				</td>
			</tr>
	
		<tr class="sch_set_th">
				<td class="sch_set_td">
						<a href="#" class="_calendar_name" data-value="">
							<strong>내 캘린더</strong>
						</a>	
				</td>
				<td><strong>[일정] 10분 전 팝업</strong></td>
				<td><strong>[종일일정/기념일] 하루 전 정오 팝업</strong></td>
				<td class="">
					<button class="" data-value="">수정</button>
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