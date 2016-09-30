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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog.css"/>
<!-- css  -->

<script type="text/javascript">
/* 처음 실행시 로그인 한 사람이 공감 눌렀으면 채워진 하트 띄워주고. 아니면 빈 하트를 띄워준다 */
$(document).one("ready",function(){
	var sym = ${sym};
		if(sym == 1){ //좋아요 있다.
			$(".himg").html("<i class='fa fa-heart' aria-hidden='true' style='color:red; font-size:11px;'></i>");
		}else{
			$(".himg").html("<i class='fa fa-heart-o' aria-hidden='true' style='color:red; font-size:11px;'></i>");
		}
});
</script>


<div class="con">
		<div id="total_list">
			<div class="total_view">
			<a href="#none" class ="tview1" title="tview" id="total_show"><strong>전체보기&nbsp;(24)</strong></a>
			<a href="#none" class ="tview2" title="listopen" id="open_list"><strong>목록열기</strong></a>
		</div>
		
		<div class="total_view_detail" style="display:none;">
			<div class="row" style="margin:auto; padding:auto;">
				<span>
					<a href="#none" class ="tview1" title="tview" id="total_show"><strong>전체보기&nbsp;(24)</strong></a>
					
					<span style="float:right;">
						<small style="text-align:right;">스크랩</small>&nbsp;
						<a href="#none" title="listopen" id="open_list"><strong>목록닫기▲</strong></a>
					</span>
					
				</span>
			</div>
			
				<div class="total_view_list">
					<table class="table table-hover">
						<col style="width:15%">
						<col style="width:auto">
						<col style="width:25px">
						<col style="width:20px">
						
						<tr valign="top">
							<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
							<td class="t2">2016년 9월 8일 오전 10시 44분에 저장한 글입니다.11111</td>
							<td class="t3">12</td>
							<td>2015.08.09</td>
						</tr>
						
						<tr valign="top">
							<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
							<td class="t2">2016년 9월 8일 오전 10시 44분에 저장한 글입니다.11111</td>
							<td class="t3">12</td>
							<td>2015.08.09</td>
						</tr>
						
						<tr valign="top">
							<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
							<td class="t2">2016년 9월 8일 오전 10시 44분에 저장한 글입니다.11111</td>
							<td class="t3">12</td>
							<td>2015.08.09</td>
						</tr>
						
						<tr valign="top">
							<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
							<td class="t2">2016년 9월 8일 오전 10시 44분에 저장한 글입니다.11111</td>
							<td class="t3">12</td>
							<td>2015.08.09</td>
						</tr>
						
						
						<!-- 글 관리 부분   리스트 맨아래 -->
						<tr>
							<td colspan="4">
								
								<div class="row" style="padding:auto; margin:auto;">
									<span class="list_checkbox" style="display:none;">
										<input type="checkbox" name="total_chk" >
										<small>전체선택</small>
									</span>
									
									
									<span style="float:right;">
										<span style="display:none" class="post_setting">
											<a href="#"><small>포스트 설정 변경</small></a>
											<a href="#"><small>이동</small></a>
											<a href="#"><small>삭제</small></a>
										</span>
										<c:if test="${blogdto.m_id eq login.m_id }">
											<input type="button" id="list_manageBtn" value="글관리 열기">
										</c:if>
										<select>
											<option>5줄 보기</option>
											<option>10줄 보기</option>
											<option>15줄 보기</option>
											<option>20줄 보기</option>
										</select>
									</span>
								</div>
								
							</td>
						</tr>
					</table>
					
					<div class="row" style="margin:auto; padding:auto; text-align:center;">
						<nav>
						  <ul class="pagination">
						    <li>
						      <a href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li>
						      <a href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
					
					
			</div>
			
			
			</div>
		
		</div>


<!-- 상세페이지 -->
<div class="Bdetailcon">
	<form name="bfrmform" id="bfrmform" action="" method="post">
		<p><strong style="color:#20A524; font-size:15px;">${blogdto.bbs_title }</strong> &nbsp;&nbsp;&nbsp;&nbsp;| study </p>
		<p class="view2">
			${blogdto.bbs_date }&nbsp;&nbsp;&nbsp;
			<c:if test="${blogdto.m_id eq login.m_id }">
				<a href="#none" class="_btnupdate">수정</a> | 
				<a href="#none" class="_btndel">삭제</a>
			</c:if>
		</p>
		
		
		 <hr>
	<br><br><br>


			<div class="foot_content">
				<div class="f_cont">
					${blogdto.bbs_content }
				</div>
				<br><br>
				<div class="write_reple">
						<c:if test="${blogdto.bbs_comchk eq 1 }">
							<a href="#none" class="reple_show">댓글쓰기</a>
						</c:if>
						<input type="hidden" name="log_id" class="log_id" value="${login.m_id }"/>
						<input type="hidden" name="bbs_seq" class="bbs_seq" value="${blogdto.bbs_seq }"/>
						<c:if test="${blogdto.bbs_likechk eq 1 }">
							<a href="#none" class="sym">공감</a>
							<form method="post">
								<a href="javascript:likeajax();" class="sym_pic">
								<!-- 여기에 하트 들어올것임 -->
								<span class="himg"></span>
									<span class="lcount" >${likecount }</span>
								</a>
							</form>
						</c:if>
				</div>
				<div class="f_right">
					<c:if test="${blogdto.m_id eq login.m_id }">
						<a href="#none" class="_btnupdate">수정</a>
						<span>&nbsp;|&nbsp;</span>
						<a href="#none" class="_btndel">삭제</a>
						<span>&nbsp;|&nbsp;</span>
						<a href="#none">설정</a>
					</c:if>
				</div>	
			</div>
			
			
			<!-- 공감한 사람 리스트 -->
			<!-- 공감 수 0이면  -->
			<c:if test="${empty peoplelist }">
				<div class="foot_sym" style="display:none;">
					<h6>이 포스트에 공감한  사람이 없습니다.</h6>
				</div>	
			</c:if>
			
			
			<!-- 공감 수가 1이상이면 -->
			<c:if test="${not empty peoplelist }">		
				<div class="foot_sym" style="display:none;">
					<h6>이 포스트에 공감한 블로거</h6>
					<table>
					<colgroup>
						<col>
						<col width="160">
					</colgroup>
					<tbody>
					<c:forEach items="${peoplelist }" var="people" varStatus="peoplevar">
						<tr>
						<th>
							<a href="#none">${people.m_id }</a>
							<span class="sym_likedate"><small>${people.like_date }</small></span>
							<span>&nbsp;&nbsp;</span>
							<span style="color:green;"><small>x</small></span>
						</th>
						<td class="sym_name_right">
							<small><a href="#none">${people.m_name }</a>
						</td>
						</tr>
					</c:forEach>
					</tbody>
					</table>
				</div>
			</c:if>

		<!-- 여기 댓글 클래스명 나중에 seq로 줘서 구분하기 -->
			<div class="foot_reple" style="display:none;">
			<!-- 댓글 리스트 -->
				<div class="r_re">
					<ul>
					<!-- 댓글 -->
						<li class="re_li">
							<dl>
								<dt class="dt1">
									<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">							
								</dt>
								<dt class="dt2">
									<a href="blog.do" class="nick">hisun</a>
									<span class="re_date"><small>2016.08.31. 18:16</small></span>
									<div class="re_re" style="float: right;">
										<a href="#none" class="re_sh"><small>답글</small></a>
										<span>&nbsp;|&nbsp;</span>
										<a href="bbsupdate.do"><small>수정</small></a>
										<span>&nbsp;|&nbsp;</span>
										<a href="bbsdel.do"><small>삭제</small></a>
									</div>
								</dt>
								<dd>댓글 내용</dd>
							</dl>
						</li>
						
						<li class="re_hide" style="display:none;">
							<i class="fa fa-share-square" aria-hidden="true"></i>
							<table>
								<tr>
									<td class="i1">
										<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">							
									</td>
									<td class="i2">
										<textarea cols="50" rows="2" id="commentTextArea" class="textarea _activeId _commentRosText" name="comment.contents" maxlength="6000" tabindex="0" style="overflow: hidden; line-height: 14px; height: 53px; resize: none;"></textarea>
									</td>
									<td class="i3">
										<input type="button" class="re_btn" value="덧글입력"/>
									</td>
								</tr>
							
							</table>
						</li>
						
						
					<!-- 댓글에 댓글 -->	
						<li class="re_re_li">
							<dl>
								<dt class="dt1">
									<i class="fa fa-hand-o-right" aria-hidden="true"></i>
									<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">							
								</dt>
								<dt class="dt2">
									<a href="blog.do" class="nick">hisun</a>
									<span class="re_date"><small>2016.08.31. 18:16</small></span>
									<div class="re_re" style="float: right;">
										<a href="#none"><small>답글</small></a>
										<span>&nbsp;|&nbsp;</span>
										<a href="bbsupdate.do"><small>수정</small></a>
										<span>&nbsp;|&nbsp;</span>
										<a href="bbsdel.do"><small>삭제</small></a>
									</div>
								</dt>
								<dd>대댓글</dd>
							</dl>
						</li>
					
					</ul>
				</div>
			
				<table>
					<tr>
						<td class="i1">
							<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">							
						</td>
						<td class="i2">
							<textarea cols="50" rows="2" id="commentTextArea" class="textarea _activeId _commentRosText" name="comment.contents" maxlength="6000" tabindex="0" style="overflow: hidden; line-height: 14px; height: 53px; resize: none;"></textarea>
						</td>
						<td class="i3">
							<input type="button" class="re_btn" value="덧글입력"/>
						</td>
					</tr>
					
				</table>
			</div>
		</form>
</div>
	
	<div class="B_list">
		<p style="color: #20A524;">'전체'</p>&nbsp;&nbsp;<p>카테고리의 다른글 </p>
		<span>전체 포스트 보기</span>
		<div class="title_list">
			<ul>
				<li>안뇽 <span>2016.09.08.</span></li>
				<li>그래 <span>2016.09.08.</span></li>
				<li>글 목록임 <span>2016.09.08.</span></li>
				<li>다섯개까지 나와 <span>2016.09.08.</span></li>
				<li>555555555555555555555 <span>2016.09.08.</span></li>
			</ul>
		</div>
		<div class="page_btn">
			<img src="image/pre.PNG">
			<a href="#none" class="prev"><span style="color:silver">이전</span></a> | 
			<a href="#none" class="next">다음</a>
			<img src="image/next.PNG">
		</div>
	
		<hr>
		<div class="go_top">
			<a href="#thisloc">▲top</a>
		</div>
	
	</div>
</div>



<script type="text/javascript">
	var check_openList = 0;
	
	$("#total_show,#open_list").click(function(){
		if(check_openList==0){
			check_openList=1;
			$(".total_view").hide();
			$(".total_view_detail").show();
		}else{
			check_openList=0;
			$(".total_view").show();
			$(".total_view_detail").hide();
		}
		
	});
	
	//글 관리 열기
	var check_myList = 0;
	$("#list_manageBtn").click(function(){
		if(check_myList==0){
			check_myList=1;
			$("#list_manageBtn").val("글관리 닫기");
			$(".list_checkbox, .post_setting").show();
			$(".point").hide();
		}else{
			check_myList=0;
			$("#list_manageBtn").val("글관리 열기");
			$(".list_checkbox, .post_setting").hide();
			$(".point").show();
			
		}
		
	})
	
	
	var check_reList = 0;
	$(".reple_show").click(function(){
		if(check_reList == 0){
			check_reList = 1;
			$(".foot_reple").show();
		}else{
			check_reList = 0
			$(".foot_reple").hide();
		}
		
		
	});
	
	//댓글 내부 댓글 창 열기
	var check_re_relist = 0;
	$(".re_sh").click(function(){
		if(check_re_relist==0){
			check_re_relist = 1;
			$(".re_hide").show();
		}else{
			check_re_relist = 0;
			$(".re_hide").hide();
			
		}
		
	})
	
	
	//공감 창 열기
	var check_sym = 0;
	$(".sym").click(function(){
		if(check_sym==0){
			check_sym = 1;
			$(".foot_sym").show();
		}else if(check_sym==1 && check_reList==1){
			check_reList = 0;
			$(".foot_reple").hide();
		}
		else{
			check_sym = 0;
			$(".foot_sym").hide();
			
		}
		
	})
	
$("._btnupdate").click(function(){
	alert("수정하러간다");
	$("#bfrmform").attr({"target":"_self","action":"bbsupdate.do"}).submit();
});
	
$("._btndel").click(function(){
	alert("진짜 삭제할거임");
	$("#bfrmform").attr({"target":"_self","action":"bbsdel.do"}).submit();
});
/*blog_like/////////////////*/
function likeajax(){
	var url = "<%=application.getContextPath() %>/bbs_like.do"; //컨트롤러 호출
	var url2 = "<%=application.getContextPath() %>/bbs_heart.do";
	var likedata = ""; //post방식으로 처리해줄 값들
	
	likedata = "m_id=" +$(".log_id").val();
	likedata += "&bbs_seq=" + $(".bbs_seq").val();
 	
	//like add or del
	$.ajax({
		type: "POST",
		url: url,
		async:true,
		data: likedata,
		success: function(msg) { //성공 시 호출 할 함수
			$(".lcount").text(msg);
		}
		
	});
 	
	//get heart
	$.ajax({
		type: "POST",
		url: url2,
		async:true,
		data: likedata,
		success: function(msg2) { //성공 시 호출 할 함수
			if(msg2==1){ //좋아요 있으면 꽉 찬 하트
				$(".himg").html("<i class='fa fa-heart-o' aria-hidden='true' style='color:red; font-size:11px;'></i>");
			}else{
				$(".himg").html("<i class='fa fa-heart' aria-hidden='true' style='color:red; font-size:11px;'></i>");
			} 
 			
		}
		
	});
 	
 	
};
</script>