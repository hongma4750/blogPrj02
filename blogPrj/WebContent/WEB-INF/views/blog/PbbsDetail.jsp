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
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="path/css/als_style.css" />

<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog_pic.css"/>
<!-- css  -->



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
										<input type="button" id="list_manageBtn" value="글관리 열기">
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
		<div class="total_content">
			<div class="pdetail_content">
				<p><strong style="color:#20A524; font-size:15px;">앨범형 세부페이지로 갈거지롱</strong>&nbsp;&nbsp;&nbsp;&nbsp;| 전체보기니까 여기도 사진 뜬다
				 </p>
				<p class="pview2">
					2016.09.05.&nbsp;&nbsp;&nbsp;11:59&nbsp;&nbsp;&nbsp;
					<a href="bbsupdate.do">수정</a> | 
					<a href="bbsdel.do">삭제</a>
				</p>
		
			
			 <hr>
			<br><br><br>
						
		<div class="foot_content">
					<img src="image/55.png"/>
				<br><br>
				<div class="write_reple">
					<a href="#none" class="reple_show">댓글쓰기</a>
				</div>
				<div class="f_right">
					<a href="bbsupdate.do">수정</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="bbsdel.do">삭제</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="#none">설정</a>
				</div>	
			</div>
			

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
										<a href="#none" class="reple_show"><small>답글</small></a>
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
			
			<!-- 아래 댓글입력창 -->
				<div class="w_re">
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
			</div>
		</div>
			
			
			
			
			
		<br><br>
		<div class="pic_list">
			<div class="als-container" id="pic_slide">
				  <span class="als-prev"><i class="fa fa-chevron-left"></i></span>
				  <div class="als-viewport">
				    <ul class="als-wrapper">
				      <li class="als-item"><img src="image/55.png"></li>
				      <li class="als-item"><img src="image/4.jpg"></li>
				      <li class="als-item"><img src="image/22.png"></li>
				      <li class="als-item"><img src="image/33.png"></li>
				      <li class="als-item"><img src="image/2.jpg"></li>
				      <li class="als-item"><img src="image/11.jpg"></li>
				      <li class="als-item"><img src="image/3.jpg"></li>
				      <li class="als-item"><img src="image/5.jpg"></li>
				      <li class="als-item"><img src="image/55.png"></li>
				      <li class="als-item"><img src="image/4.jpg"></li>
				      <li class="als-item"><img src="image/22.png"></li>
				      <li class="als-item"><img src="image/33.png"></li>
				      <li class="als-item"><img src="image/2.jpg"></li>
				      <li class="als-item"><img src="image/11.jpg"></li>
				    </ul>
				  </div>
				  <span class="als-next"><i class="fa fa-chevron-right"></i></span>
			</div>









		</div>
			
			<br>
		<div class="go_top">
			<a href="#thisloc">▲top</a>
		</div>
			
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
	
$("#pic_slide").als({
	visible_items: 3,
	scrolling_items: 2,
	orientation: "horizontal",
	circular: "no",
	autoscroll: "no"
});
	

</script>
