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
$(function() {
	$(".search_area_detail").hide();	
	var chk = 0;
	
	$(".search_detail").click(function(){
		if (chk ==  0){
			chk = 1;
			$(".search_area_detail").show();	
			$(".search_detail label").remove();
			$(".search_detail").append("<label>▼</label>");
			
		}else{
			chk = 0;
			$(".search_area_detail").hide();	
			$(".search_detail label").remove();
			$(".search_detail").append("<label>▲</label>");
		}			
	});
});	 
</script>



<div id="section_cen">
	
<div class="sch_header">
	<div class="search_area">
			<input type="text" class="search_input" value="일정 검색" maxlength="100" name="" title="검색어 입력"/>
			<input type="button" class="search_btn">
			<a href="#" class="search_detail">상세<label>▲</label></a>
	</div>

	<div id="search" class="search_area_detail">
		<table class="search_area_detail_table">
			<colgroup>
				<col width="70"><col width="175"><col width="35"><col width="150">
				<col width="212"><col width="54">
			</colgroup>
			<tr>
				<td>
					<label class="search_lbl">기간</label>
				</td>
				<td>
					<input type="text" id="ssdate" name="ssdate" class="ssdate">
					-
					<input type="text" id="sedate" name="sedate" class="ssdate">
				</td>
				<td>
					<label class="search_lbl">제목</label>
				</td>
				<td>
					<input type="text" id="stitle" name="stitle" class="stitle">
				</td>
				<td>
				</td>
				<td rowspan="3">	
					<input type="button" value="검색" class="search_detail_btn">			
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="search_lbl">캘린더</label>
				</td>
				<td>
					<select class="search_sel">
						<option>전체</option>
						<option>ㅇㅇㅇㅇ</option>
						<option>내 캘린더</option>
					</select>
				</td>
				<td>
					<label class="search_lbl">장소</label>
				</td>
				
				<td>
				<input type="text" id="sloc" name="sloc" class="stitle">
				</td>
				
				<td class="search_chk">
				<input type="checkbox" class="">완료포함
				<input type="checkbox" class="">첨부포함
				</td>
			</tr>
			
			<tr>
				<td>
					<label class="search_lbl">초대/참석자</label>
				</td>
				<td>
					<input type="text" id="sinvitee" name="sinvitee" class="stitle">
				</td>
				<td>
					<label class="search_lbl">설명</label>
				</td>
				<td>
					<input type="text" id="scon" name="scon" class="stitle">
				</td>
				<td colspan="2"></td>
			</tr>
		</table>
	</div>
</div>

<div class="cal_search">
	<table>
		<tr>
			<td>검색결과</td>
			<td>(9)</td>
			<td>서울</td>
		</tr>
	</table>
	
	<div class="search_result_list">
	<table>
		<colgroup>
			<col width="120"><col width="100"><col width="130"><col width="856">
		</colgroup>
		
		<tr>
			<th><a href="#">일자</a></th><th><a href="#">구분</a></th><th><a href="#">캘린더</a></th><th>제목</th>
		</tr>
		
		<tr>
			<td>2016.08.20 토</td><td>오후 12:00</td><td>내 캘린더</td><td>콘서트 콘서트~~~~~~~ 0.TO.10</td>
		</tr>
		<tr>
			<td>2016.08.17 수</td><td>오후 12:00</td><td>내 캘린더</td><td>언제부터 였는지 무감각해진 첫느낌</td>
		</tr>
		<tr>
			<td>2016.08.12 금</td><td>오후 12:00</td><td>내 캘린더</td><td>너를 찾아서 오에오 날 비춰진 저 달빛 아래로 그댈</td>
		</tr>
		<tr>
			<td>2016.08.10 수</td><td>오후 12:30</td><td>내 캘린더</td><td><span><img src="https://ssl.pstatic.net/static/calendar/sticker/pc2/87.png" alt="보고" title="보고" width="19" height="17" class="sticker">ROD</span></td>
		</tr>
		<tr>
			<td>2016.08.09 화</td><td>오후 12:30</td><td>내 캘린더</td><td>BABY MISS YOU</td>
		</tr>
		<tr>
			<td>2016.08.08 월</td><td>오후 12:00</td><td>내 캘린더</td><td>아직 난 사랑을 몰라 또 홀로 가벼운 이 밤~</td>
		</tr>
		<tr>
			<td>2016.08.03 수</td><td>오후 3:00</td><td>내 캘린더</td><td>상처 나 ㄴ이별이 무서워 널 첫 만난 순간이 그리워</td>
		</tr>
	</table>
	</div>
	
	<!-- 페이징 시작 -->
	<div>
	<nav>
	  <ul class="pagination pagination-sm">
	    <li class=""><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
	    <li class=""><a href="#">2 <span class="sr-only">(current)</span></a></li>
	    <li class=""><a href="#">3 <span class="sr-only">(current)</span></a></li>
		<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>	
	  </ul>
	</nav>
	</div>
	<!-- 페이징 끝 -->
</div>
</div>