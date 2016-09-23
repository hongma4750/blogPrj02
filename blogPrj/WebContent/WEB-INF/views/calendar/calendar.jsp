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


<%@page import="org.apache.tools.ant.types.resources.First"%>
<%@page import="sist.co.help.myCal" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.ArrayList" %>
<%@page import="sist.co.Model.SistCalendarDTO" %>


<script>
function showallcust(num) {	
	$.ajax({
		type:"POST",
		url:"<%=application.getContextPath() %>/sch_quick_view.do?sch_writenum="+num+"",
		async:false,
		data:"sch_writenum="+num, 
		success:function(qdto){
			alert(성공1);
			sch_quick_view(qdto);
			alert(성공2); 
		}
	});	
}

alert(year)

</script>


<script type="text/javascript">
$(function () {
	
	$(".sch_view").show();
	/* var chk = 0;
	$(".sch_quick_view").click(function(){
		
		if (chk == 0){
			chk = 1;
			//alert("클릭함");
			$(".sch_view").show();
		}else{
			chk = 0;
			$(".sch_view").hide();
		}
	}); */	
});

</script>

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
	
<!-- 달력 헤더 시작 -->
<div class="sch_header">

	<!-- 검색 창 시작 -->
	<div class="search_area">
			<input type="text" class="search_input" value="일정 검색" maxlength="100" name="" title="검색어 입력" />
			<input type="button" class="search_btn" onclick="url_search_cal()">
			<a href="#" class="search_detail">상세<label>▲</label></a>
	</div>
	<!-- 검색 창 끝 -->

	<!-- 상세 검색 창 시작 -->
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
					<input type="button" value="검색" class="search_detail_btn" onclick="url_search_cal()">			
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
	<!-- 상세 검색 창 끝 -->
	
</div>
<!-- 달력 헤더 끝-->


<!-- 달력 바디 시작 -->
<div class="cal_body">

<!-- 달력을 위함 함수 -->
<%!
public String callist(int year, int month, int day){
	String s = "";
	s += String.format("<a href='%s?year=%d&month=%d&day=%d'>", "callist.do", year, month, day); // seq 추가 detail로 이동
	s += String.format("%2d", day);
	s += "</a>";
	return s;	
}

/* 글을 쓰기 위한 함수 */
public String calwrite(int year, int month, int day){
		String s = "";
		String url = "schwrite.do";
		String image="<img src='image/pen.gif'/>";
		s=String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>"
						, url, year, month, day, image);
		return s;	
}

// 2자리 수로 바꿔주는 함수
public String two (String msg){
	return msg.trim().length() < 2 ? "0"+msg : msg.trim(); 
}

// 16자 이상 생략해주는 함수
public String omit(String msg){
	String s = "";
	if(msg.length() >= 15){
		s = msg.substring(0, 16);
		s += msg.trim();
	}else{
		s = msg.trim();
	}
	return s;
}


// 달력 칸 안에 테이블을 만드는 함수
public String makeTable(int year, int month, int day, List<SistCalendarDTO> scdto){
	String s = "";
	String dates = (year+"")+two(month+"")+two(day+"");
	s = "<table>";
	s += "<col width='120px'/>";
	
	for(SistCalendarDTO scd : scdto){
		// 여기 다시 짚기
		if(scd.getSch_startdate().substring(0, 8).equals(dates)){ 
			s += "<tr bgcolor='white'>";
			s += "<td>";
			String num = scd.getSch_writenum()+"";
			/* s += "<a href='sch_quick_view.do?sch_writenum="+num+"' class='sch_quick_view' >";  */
		
			/* s += "<a href='#' class='sch_quick_view' onclick='showallcust("+num+")'>";	// 시퀀스 번호 전달 */
			
			s += "<a href='sch_update.do?sch_writenum="+num+"' class='sch_quick_view'>"; 
			s += "<font style='font-size:13px; color:#2769d4'>";
			s += "<strong>";
			s += scd.getSch_starttime()+"  ";
			s += "</strong>";
			s += "</font>";
			s += "<font style='font-size:13px; color:#4984d9'>";
			
			s += omit(scd.getSch_title());
			s += "</font>";
			s += "</a>";
			s += "</td>";	
			s += "</tr>";
		}
	}
	s += "</table>";
	return s;
}



public String sch_quick_view(SistCalendarDTO qdto){
	//System.out.print("시퀀스 ==============> " + num);
	String s = "";
	//int number = num;
	s += "<div class='quick' >";
   
    s += "<table>";
		

			// 상세 보기 클릭하면 팝업해주는 div 시작
					s += "<div class='quick box'  style='width:480px;' height='237px; style='display: block; left: 657px; top: 230px; z-index: 400000; margin:0px;'>";
					
			/* 		s += "<span class="fin _complete_area" style="display: inline; visibility: visible;">";
					s += "<input class="_complete" type="checkbox" id="fin">";
					s += "<label for="fin">완료</label>";
					s += "</span>"; */
			        s += "<th>";
			        s += qdto.getSch_title();
			        s += "</th>";
					
			        s += "<tr>";
			        s += "<td colspan='2'>일시</td>";
			        s += "<td>";
			        s += qdto.getSch_startdate();
			        s += qdto.getSch_starttime();		
			        s += " - ";
			        s += qdto.getSch_enddate();
			        s += qdto.getSch_endtime();	
			        s += "</td>";
			        s += "</tr>";
			        
			        s += "<tr>";
			        s += "<td colspan='2'>장소</td>";
			        s += "<td>";
			        s += qdto.getSch_location();
			        s += "</td>";
			        s += "</tr>";
			        
			        s += "<tr>";
			        s += "<td colspan='2'>설명</td>";
			        s += "<td>";
			        s += qdto.getSch_content();
			        s += "</td>";
			        s += "</tr>";
			        
			        s += "<tr>";
			        s += "<td colspan='2'>알림</td>";
			        s += "<td>";
			        s += qdto.getSch_alarm();
			        s += "</td>";
			        s += "</tr>";
			        s += "</div>";
				 // 상세 보기 클릭하면 팝업해주는 div 끝
	s += "</table>";
	
    s += "</div>";
	return s;
}
%>

<%
/* SistCalendarDTO qdto = request.getAttribute("qdto"); */

List<SistCalendarDTO> list = new ArrayList<SistCalendarDTO>();
Object oblist = request.getAttribute("clist");
if(oblist != null){
	list = (List<SistCalendarDTO>)oblist;
}

myCal mycal = (myCal)request.getAttribute("mycal");

int dayOfweek = mycal.getDayOfweek();
int lastDayOfMonth = mycal.getLastDay();

int year = mycal.getYear();
int month = mycal.getMonth();

String prev_year = String.format("<a href='./%s?year=%d&month=%d'><img src='image/left.gif'/></a>", "calendar.do", year-1, month);

String prev_month = String.format("<a href='./%s?year=%d&month=%d'><img src='image/prec.gif'/></a>", "calendar.do", year, month-1);

String next_year = String.format("<a href='./%s?year=%d&month=%d'><img src='image/last.gif'/></a>", "calendar.do", year+1, month);

String next_month =String.format("<a href='./%s?year=%d&month=%d'><img src='image/next.gif'/></a>", "calendar.do", year, month+1);

String url = String.format("%s?year=%s&month=%s", "calendar3.do", year, month);
%>

<%-- <div style="text-align: left">
	<a href='<%=url %>'>
		<%=year+"년"+month+"월" %>일정보기
	</a>
</div> --%>


<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
<table calss="caltable"style="width:85%;">
	<col width="100px"/>
	<col width="100px"/>
	<col width="100px"/>
	<col width="100px"/>
	<col width="100px"/>
	<col width="100px"/>
	<col width="100px"/>
	
<thead>
<tr height="100px">
	<td colspan="7" class="days2">
		<%=prev_year %><%=prev_month %>	
		<font color="red" style="font-size:20">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
		<%=next_year %><%=next_month %>
	</td>
</tr>

<tr height="100px">
	<th class="days3">일</th>
	<th class="days3">월</th>
	<th class="days3">화</th>
	<th class="days3">수</th>
	<th class="days3">목</th>
	<th class="days3">금</th>
	<th class="days3">토</th>
</tr>
</thead>	

<tr height="100px">
<%
for(int i = 1;i < dayOfweek; i++){
	%>
	<td>&nbsp;</td>
	<%	
}


for(int i=1;i <= lastDayOfMonth; i++){
	String hhh=String.format(
			"<a href='%s?year=%d&month=%d&day=%d'>"+
			"<img src='image/pen.gif' alt='write'/></a>",
				"schwrite.do", year, month, i);
	
	if((i+dayOfweek-1)%7==0){		// 토요일일 경우
		%>
		<td class="satday">
			<%=callist(year, month, i)%>&nbsp;<%=calwrite(year, month, i) %>
			<%=makeTable(year, month, i, list) %>		
			
		</td>
		<% 
	}else if((i+dayOfweek-1)%7==1){	// 일요일일 경우
		%>
		<td class="sunday">
			<%=callist(year, month, i)%>&nbsp;<%=calwrite(year, month, i) %>
			<%=makeTable(year, month, i, list) %>
			
		</td>
		<%
	}else{							// 나머지 요일의 경우
		%>
		<td class="otherday">
			<%=callist(year, month, i)%>&nbsp;<%=calwrite(year, month, i) %>
			<%=makeTable(year, month, i, list) %>
		</td>
		<%
	}	
	if((i+dayOfweek-1)%7 == 0){
		%>
		
		</tr><tr height="100px">
		<%
	}
}
for(int i = 0;i < (7-(dayOfweek+lastDayOfMonth-1)%7)%7; i++){
	%>
	<td>&nbsp;</td>	
	<%
}


%>


</tr>
</table>
</div>

</div>
<!-- 달력 바디 끝-->


</div>