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

<div class="con2">
<br><br>
<h4>포스트 쓰기</h4> <br><br><br>

<form name="frmForm" id="frmForm2" action="" method="post">
<input type="hidden" name="m_id" value="${login.m_id}">
		<div class="writecon2">
			<!-- 카테고리 -->
			<select id="cate1" name="bbs_ca_seq" style="width:138px; height: 20px;">
			<!-- 나중에 카테고리 생기면 여기에 카테고리 리스트 db에서 불러와서 뿌려준다. -->
			   <c:forEach items="${blogCategoryList }" var="blogCate">
			   		<option value="${blogCate.ca_seq }">${blogCate.ca_name }</option>
			   </c:forEach>
			</select> 
			
			<input type="text" name="bbs_title" style="width:754px; height: 20px;"/>
			
			 <br>
			 
			<div class="panel panel-success">
				 <!-- 투표 -->
				  <div class="panel-heading">
				    	<button name="poll" id="btn_poll">투표</button>
				  </div>
				  
				  <!-- content -->
				  <div class="panel-body">
				    <textarea id="wcon" name="bbs_content" rows="" cols="" style="width: 906px; border:0;"></textarea>
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
							<label><input type="radio" name="bbs_hid" value="0" checked="checked">&nbsp;전체공개</label> &nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="bbs_hid" value="1">&nbsp;이웃공개</label>&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="bbs_hid" value="2">&nbsp;서로이웃공개</label>&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="bbs_hid" value="3">&nbsp;비공개</label>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<!-- 체크박스 체크안되면 0으로 들어옴 -->
							<label><input type="checkbox" name="bbs_comchk" value="1" checked="checked" disabled ="true">&nbsp;댓글 허용</label>&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" name="bbs_likechk" value="1" checked="checked" disabled ="true">&nbsp;공감허용</label>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<label><input type="checkbox" name="bbs_scrapchk" value="1" checked="checked">&nbsp;스크랩 허용</label>
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
$(function(){
	/* 작성취소버튼 누르면 블로그 홈으로 이동 */
	$(".wcancel").click(function(){
		location.href="blog.do";
	});
	
	$("#btn_poll").click(function(){
		window.open("poll_pop.do", "_blank", "toolbar=no, scrollbars=yes, resizable=no, width=810, height=620, top=200, left=400");
	});
	
	$("#btn3").click(function(){
		alert("블로그 글 작성한다");
		$("#frmForm2").attr({"target": "_self","action":"bbswriteAf.do"});
	});
	
});
</script>