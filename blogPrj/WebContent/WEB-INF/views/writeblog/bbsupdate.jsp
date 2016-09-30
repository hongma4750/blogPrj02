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

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog2.css"/>
<!-- css  -->

<script type="text/javascript">
$(document).ready(function(){
	
	/* 카테고리 번호 db에 있는걸로 셋팅 */
	/* 카테고리번호는 시퀀스라 1부터 시작. 나중에는 동적으로 바뀔거임. 카테고리 DB생성하면 */
	var ca_seq = $("#sel_ca_seq").val();
	if(ca_seq == 1){
		$(".o1").prop("selected","selected");
	}else if(ca_seq == 2){
		$(".o2").prop("selected","selected");
	}else if(ca_seq == 3){
		$(".o3").prop("selected","selected");
	}else if(ca_seq == 4){
		$(".o4").prop("selected","selected");
	} 
	
	/* 공개범위 사용자가 선택한거 셋팅 */
	var sel_hid = $("#sel_bbs_hid").val();
	if(sel_hid == 0){
		$(".hid0").prop("checked","checked");
	}else if(sel_hid == 1){
		$(".hid1").prop("checked","checked");
	}else if(sel_hid == 2){
		$(".hid2").prop("checked","checked");
	}else if(sel_hid == 3){
		$(".hid3").prop("checked","checked");
	} 


	/* 댓글 사용자가 선택한거 셋팅 */
	var sel_comchk = $("#sel_bbs_comchk").val();
	if(sel_comchk == 1){
		$(".comchk1").prop("checked","checked");
	}
	
	/* 공감 사용자가 선택한거 셋팅 */
	var sel_likechk = $("#sel_bbs_likechk").val();
	if(sel_likechk == 1){
		$(".likechk1").prop("checked","checked");
	}
	
	
	/* 스크랩 사용자가 선택한거 셋팅 */
	var sel_scrapchk = $("#sel_bbs_scrapchk").val();
	if(sel_scrapchk == 1){
		$(".scrapchk1").prop("checked","checked");
	}
	
	
});
</script>
<div class="con2">
<br><br>
<h4>포스트 수정하는 페이지</h4> <br><br><br>
	<div class="writecon2">
	<form name="ufrmform" id="ufrmform" action="" method="post">
		<!-- 카테고리 -->
			<input type="hidden" id="sel_ca_seq" value="${d_blog.bbs_ca_seq }"/>
			<select id="cate1" name="bbs_ca_seq" style="width:138px; height: 20px;">
			<!-- 나중에 카테고리 생기면 여기에 카테고리 리스트 db에서 불러와서 뿌려준다. -->
			   <option class="o1" value="1">카테고리1</option>
			   <option class="o2" value="2">카테고리2</option>
			   <option class="o3" value="3">카테고리3</option>
			   <option class="o4" value="4">카테고리4</option>
			</select> 
		<input type="hidden" name="bbs_seq" value="${d_blog.bbs_seq }">
		<input type="text" name="bbs_title" style="width:754px; height: 20px;" value="${d_blog.bbs_title }"/>
		
		 <br>
		 
		<div class="panel panel-success">
			 <!-- 투표 -->
			  <div class="panel-heading">
			    	<button name="poll" id="btn_poll">투표</button>
			  </div>
			  
			  <!-- content -->
			  <div class="panel-body">
			    <textarea id="wcon" rows="" cols="" name="bbs_content" style="width: 906px; border:0;">${d_blog.bbs_content }</textarea>
			  </div>
		</div>
		
		<!-- 하단 메뉴 -->
		<div class="footmenu">
			<table>
				<tr>
					<td><strong>주제분류</strong></td>
					<td>
						<div class="dropdown">
							  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    	주제를 선택하세요
							    <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a href="#">Action</a></li>
							    <li><a href="#">Another action</a></li>
							    <li><a href="#">Something else here</a></li>
							    <li role="separator" class="divider"></li>
							    <li><a href="#">Separated link</a></li>
							  </ul>
							</div>
					</td>
				</tr>
				<tr>
					<td><strong>태그달기</strong></td>
					<td></td>
				</tr>
			<!-- 설정정보 -->
					<tr>
						<td><strong>설정정보</strong></td>
						<td>
							<input type="hidden" id="sel_bbs_hid" value="${d_blog.bbs_hid }"/>
							<label><input type="radio" class="hid0" name="bbs_hid" value="0">&nbsp;전체공개</label> &nbsp;&nbsp;&nbsp;
							<label><input type="radio" class="hid1" name="bbs_hid" value="1">&nbsp;이웃공개</label>&nbsp;&nbsp;&nbsp;
							<label><input type="radio" class="hid2" name="bbs_hid" value="2">&nbsp;서로이웃공개</label>&nbsp;&nbsp;&nbsp;
							<label><input type="radio" class="hid3" name="bbs_hid" value="3">&nbsp;비공개</label>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<!-- 체크박스 체크안되면 0으로 들어옴 -->
							<input type="hidden" id="sel_bbs_comchk" value="${d_blog.bbs_comchk }"/>
							<input type="hidden" id="sel_bbs_likechk" value="${d_blog.bbs_likechk }"/>
							<label><input type="checkbox" class="comchk1" name="bbs_comchk" value="1" disabled ="true">&nbsp;댓글 허용</label>&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" class="likechk1" name="bbs_likechk" value="1" disabled ="true">&nbsp;공감허용</label>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="hidden" id="sel_bbs_scrapchk" value="${d_blog.bbs_scrapchk }"/>
							<label><input type="checkbox" name="bbs_scrapchk" class="scrapchk1" value="1">&nbsp;스크랩 허용</label>
						</td>
					</tr>
				
					<tr>
						<td></td>
						<td>
							<hr>
							<label><input type="checkbox" name="chk_basic" value="1">&nbsp;이 설정을 기본 값으로 유지</label>
						</td>
					</tr>
					<hr>
					<tr>
						<td colspan="2">
							<hr>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련법률에 의해 제재를 받을 수 있습니다. </p>
						</td>
					</tr>
				</tr>
				<tr>
					<td class="dbtn" colspan="2">
						<button id="btn1" class="btnth">임시저장</button>
						<button id="btn2" class="btnth">미리보기</button>
						<button id="btn3" class="btnth">확인</button>
						<button class="wcancel">작성취소</button>
					</td>
				</tr>
			<!-- 설정정보 end -->
			</table>
		</div>
		<!-- 하단 메뉴 --> 

		
	</div>
	</form>
</div>


<script type="text/javascript">

$("#btn3").click(function(){
	alert("진짜 수정한다?");
	$("#ufrmform").attr({"target":"_self","action":"bbsupdateAf.do"}).submit();
});

$(function(){
	/* 작성취소버튼 누르면 블로그 홈으로 이동 */
	$(".wcancel").click(function(){
		location.href="blog.do";
		
	});
});


</script>
