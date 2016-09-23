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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- 부트스트랩 링크 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog.css"/>
<!-- css  -->
<!-- js -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/likeAjax.js"></script>


<div class="con">
	<!-- 전체보기 목록 -->
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
						<small style="text-align:right; width:40px;">스크랩</small>&nbsp;
						<a href="#none" title="listopen" id="open_list"><strong style="width:100px">목록닫기▲</strong></a>
					</span>
					
				</span>
			</div>
			
			<div class="total_view_list">
				<table class="table table-hover">
					<col style="width:15%">
					<col style="width:auto">
					<col style="width:40px">
					<col style="width:100px">
					
				<c:if test="${empty bloglist }">
					<tr valign="top">
						<td colspan="4">작성된 게시글 목록이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${bloglist }" var="total_blist" varStatus="totalvar">
					<tr valign="top">
						<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
						<td class="t2"><a href="BbbsDetail.do?bbs_seq=${total_blist.bbs_seq }&log_id=${login.m_id }">${total_blist.bbs_title }</a></td>
						<td class="t3">12</td>
						<td><small>${total_blist.bbs_date }</small></td>
					</tr>
				</c:forEach>
					
					
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
		

		
	</div>
	
	
	
	

<!-- 글 목록 전체보기 -->

	<div class="viewcon">
		<c:if test="${empty bloglist }">
			<div class="total_content">
				<p>작성된 글이 없습니다.</p>
			</div>
		</c:if>
		<form name="bfrmform" id="bfrmform" action="" method="post">
		<c:forEach items="${bloglist }" var="blog" varStatus="blogvar">
			<div class="total_content">
				<div class="priv_content">
					<p>
						<strong style="color:#20A524; font-size:15px;">${blog.bbs_title }</strong>
						&nbsp;&nbsp;&nbsp;&nbsp;| 신촌
					 </p>
					<p class="view2">
						${blog.bbs_date }&nbsp;&nbsp;&nbsp;
						<c:if test="${blog.m_id eq login.m_id }">
							<a href="bbsupdate.do?bbs_seq=${blog.bbs_seq }" class="_btnupdate">수정</a> | 
							<a href="bbsdel.do?bbs_seq=${blog.bbs_seq }&m_id=${login.m_id }" class="_btndel">삭제</a>
						</c:if>
					</p>
				</div>
				
				 <hr>
				<br><br><br>
				<div class="foot_content">
					<div class="f_cont">
						${blog.bbs_content }
					</div>
					<br><br>
					<div class="write_reple">
					<!-- 댓글달기 허용했으면 보여라 -->
						<c:if test="${blog.bbs_comchk eq 1 }">
							<a href="#none" class="reple_show${blogvar.count }">댓글쓰기</a>
						</c:if>
					<!-- 공감하기 허용했으면 보여라 -->
						<c:if test="${blog.bbs_likechk eq 1 }">
							<a href="#none" class="sym${blogvar.count }">공감</a>
							<!-- 공감버튼 클릭하면 ajax 함수 호출 -->
								<input type="hidden" name="log_id" class="log_id" value="${login.m_id }"/>
								<input type="hidden" name="bbs_seq" class="bbs_seq" value="${blog.bbs_seq }"/>
								
								<a href="javascript:likeajax(${blog.bbs_seq },${blogvar.count });" class="sym_pic">
								
								<c:set var="bbs_num" value="${blog.bbs_seq }"/>
								<c:set var="himg_sname" value="himg_sname${blog.bbs_seq }"/>
									<%-- <span class='${himg_sname}'></span> --%>
									<span class="himg${blogvar.count }"></span>
									<span id="ss${blogvar.count }" class="${blog.bbs_seq }"></span>
									<%-- <span><c:out value="ss${blogvar.count }"/></span>  --%>
								</a>
						</c:if>
					</div>
					<div class="f_right">
						<c:if test="${blog.m_id eq login.m_id }">
							<a href="bbsupdate.do?bbs_seq=${blog.bbs_seq }" class="_btnupdate">수정</a>
							<span>&nbsp;|&nbsp;</span>
							<a href="bbsdel.do?bbs_seq=${blog.bbs_seq }">삭제</a>
							<span>&nbsp;|&nbsp;</span>
							<a href="#none">설정</a>
						</c:if>
					</div>
						
				</div>
				
			
<!-- --------------------------------------------------------------------------------------------------- -->			
				
				
				
				
				<!-- 공감한 사람 리스트 -->
			<!-- 공감 수 0이면  -->
<%-- 				<div class="foot_sym${blogvar.count }" id="foot_sym" style="display:none;">
					<h6>이 포스트에 공감한  사람이 없습니다.</h6>
				</div>	
			 --%>
			
			<!-- 공감 수가 1이상이면 -->
				<input type="hidden" id="symsucheck${blogvar.count }" class="symsucheck"/>
				
				
<%--  				<c:if test="${symsscheck eq 0}"> 
					<div class="foot_sym${blogvar.count }" id="foot_sym" style="display:none;">
					<h6>이 포스트에 공감한  사람이 없습니다.</h6>
				</div>	
				</c:if>
				<c:if test="${symsscheck ne 0}"> --%>
					<div class="foot_sym${blogvar.count }" id="foot_sym" style="display:none;">
						<%-- <h6>이 포스트에 공감한 블로거</h6>
						<table>
						<colgroup>
							<col>
							<col width="160">
						</colgroup>
						<tbody>
							<tr>
							<th>
								<a href="#none" id="pp_id${blogvar.count }">${people.m_id }</a>
								<span class="sym_likedate" id="pp_date${blogvar.count }"><small>${people.like_date }</small></span>
								<span>&nbsp;&nbsp;</span>
								<span style="color:green;"><small>x</small></span>
							</th>
							<td class="sym_name_right">
								<small><a href="#none" id="pp_name${blogvar.count }">${people.m_name }</a></small>
							</td>
							</tr>
					
						</tbody>
						</table> --%>
					</div>
			<%-- 	</c:if>
				 --%>
				
				
				
				
					
<!-- --------------------------------------------------------------------------------------------------- -->			
				
				
				<!-- 여기 댓글 클래스명 나중에 seq로 줘서 구분하기 -->
				<div class="foot_reple${blogvar.count }" id="foot_reple" style="display:none;">
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
											<a href="#none" class="re_sh"><small>답글</small></a>
											<span>&nbsp;|&nbsp;</span>
											<a href="bbsupdate.do"><small>수정</small></a>
											<span>&nbsp;|&nbsp;</span>
											<a href="bbsdel.do"><small>삭제</small></a>
										</div>
									</dt>
									<dd>대댓글</dd>
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
			</div>
	</c:forEach>
	</form>
</div>

	
	
	<div class="paginglist">
		<nav aria-label="Page navigation">
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



<script type="text/javascript">
/*blog_like/////////////////*/
//공감 초기 세팅
$(document).ready(function(){
	var bbs_num = '${bbs_num}'; //blog.bbs_seq
	var exc_num = new Array(); //로그인 한 사람이 누른 공감 담은 리스트
	
	var leng ='${fn:length(likerest)}'; //공감 허용 한 bbs 게시물 전체 개수
	
	//ajax
	var url = "<%=application.getContextPath() %>/likecount.do"; //컨트롤러 호출
	var hurl = "<%=application.getContextPath() %>/likeheart.do";
	var lpeopleurl = "<%=application.getContextPath() %>/likepeople.do";
	
	var likesu = "";
	var hsu = "";
	var likepeoseq = "";
	
	//좋아요 수
	for(var j =1; j<=leng; j++){
		var lcount_el = document.getElementById('ss'+j.toString()); 
		var lcount_class = lcount_el.getAttribute('class');//id를 통해 bbs_seq가져온다
		
			likesu = "bbs_seq=" + lcount_class;
			
			//seq_num취득
			//like count setting
			$.ajax({
				type: "POST",
				url: url,
				async:false,
				data: likesu,
				success: function(su) { //성공 시 호출 할 함수
					$("#ss"+j.toString()).text(su);
					$("#symsucheck"+j.toString()).attr('value',su);
				}	
			});
				
	}
	
	//하트
	for(var i =1; i<=leng; i++){ 
		var lcount_el2 = document.getElementById('ss'+i.toString()); 
		var lcount_class2 = lcount_el2.getAttribute('class');//id를 통해 bbs_seq가져온다
		
			hsu = "m_id=" +$(".log_id").val();
			hsu += "&bbs_seq=" + lcount_class2;
			
			
			//like heart setting
			$.ajax({
				type: "POST",
				url: hurl,
				async:false,
				data: hsu,
				success: function(heart) { //성공 시 호출 할 함수
					if(heart==1){
						$(".himg"+i.toString()).html("<i class='fa fa-heart' aria-hidden='true' style='color:red; font-size:11px;'></i>");
					}else{
						$(".himg"+i.toString()).html("<i class='fa fa-heart-o' aria-hidden='true' style='color:red; font-size:11px;'></i>");
					} 
					
				}	
			});
		
		
	}
	
/* --------------------------------------------------------------------------------------------------- */	
 
 var pleng ='';

 
//like pepole list
/* 	for(var k =1; k<=leng; k++){ //bbs list 공감허용한 수만큼 돈다
		var lpeople_el = document.getElementById('ss'+k.toString()); 
		var lpeople_class = lpeople_el.getAttribute('class');//id를 통해 bbs_seq가져온다
		
		var insymsu = document.getElementById('symsucheck'+k.toString()); 
		var insymval = insymsu.getAttribute('value');//공감수가 몇인지 가져온다
		
		likepeoseq = "bbs_seq=" + lpeople_class;
		
			//seq_num취득
			//like people data setting
			$.ajax({
				type: "POST",
				url: url,
				async:false,
				data: likepeoseq,
				success: function(plist) { //성공 시 호출 할 함수
					var likecontent='';
					if(insymval == 0){
						likecontent+="<h6>이 포스트에 공감한  사람이 없습니다.</h6>";
						$(".foot_sym"+k.toString()).html(likecontent);
					}else{
						likecontent+="<h6>이 포스트에 공감한 블로거</h6>";
						likecontent+="<table>";
						likecontent+="<colgroup>";
						likecontent+="<col>";
						likecontent+="<col width='160'>";
						likecontent+="</colgroup>";
						likecontent+="<tbody>";
						likecontent+="<tr>";
						likecontent+="<th>";
						likecontent+="<a href='#none' id='pp_id${blogvar.count }'>${plist.m_id }</a>";
						likecontent+="<span class='sym_likedate' id='pp_date${blogvar.count }'><small>${plist.like_date }</small></span>";
						likecontent+="<span>&nbsp;&nbsp;</span>";
						likecontent+="<span style='color:green;'><small>x</small></span>";
						likecontent+="</th>";
						likecontent+="<td class='sym_name_right'>";
						likecontent+="<small><a href='#none' id='pp_name${blogvar.count }'>${plist.m_name }</a></small>";
						likecontent+="</td>";
						likecontent+="</tr>";
						likecontent+="</tbody>";
						likecontent+="</table>";
						$(".foot_sym"+k.toString()).html(likecontent);
					}
					
				}	
			});
				
	} */

	
	//공감창 열기
	for(var a =1; a<=leng; a++){ //bbs list 공감허용한 수만큼 돈다
		var check_sym = 0;
		$(".sym"+a.toString()).click(function(){
			var a_class = $(this).attr('class'); //class명 가져오기
			
			var alen = a_class.length;
			var aa = a_class.substring(3,alen); //숫자만 잘라냄
			
			var aacheck = 0;
			
			if(aacheck==0){ //공감이랑 댓글같이 열지 못하게
				aacheck = 1;
				$(".foot_sym"+aa).show();
				$(".foot_reple"+aa).hide();
			}else{
				aacheck = 0;
				$(".foot_sym"+aa).hide();
				$(".foot_reple"+aa).show();

			}
			
		})	
	}
	
	
	//댓글창 열기
	for(var b=1; b<=leng; b++){ //bbs list 공감허용한 수만큼 돈다
		var check_rep = 0;
		$(".reple_show"+b.toString()).click(function(){
			var b_class = $(this).attr('class'); //class명 가져오기
			
			var blen = b_class.length;
			var bb = b_class.substring(10,blen); //숫자만 잘라냄
			
			var bbcheck = 0;
			
			if(bbcheck==0){
				bbcheck = 1;
				$(".foot_sym"+bb).hide();
				$(".foot_reple"+bb).show();

			}else{
				bbcheck = 0;
				$(".foot_sym"+bb).show();
				$(".foot_reple"+bb).hide();

			}
			
		})	
	}

	
});

/* bbs_seq matching */
/* like counting */
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
	

	

	
	
	
	
	
/* 
	
	
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
		
	}); */
/*blog_like/////////////////*/
function likeajax(bbs_seq,loopnum){
	var url = "<%=application.getContextPath() %>/bbs_like.do"; //컨트롤러 호출
	var url2 = "<%=application.getContextPath() %>/bbs_heart.do";
	
	var leng ='${fn:length(likerest)}';
	
	var likedata = ""; //post방식으로 처리해줄 값들
	
	likedata = "m_id=" +$(".log_id").val();
	likedata += "&bbs_seq=" + bbs_seq;
	//like add or del
	$.ajax({
		type: "POST",
		url: url,
		async:true,
		data: likedata,
		success: function(data) { //성공 시 호출 할 함수
			$("#ss"+loopnum).text(data);
		}
		
	});
	
	//get heart
	$.ajax({
		type: "POST",
		url: url2,
		async:true,
		data: likedata,
		success: function(msg2) { //성공 시 호출 할 함수
				if(msg2==1){
					$(".himg"+loopnum).html("<i class='fa fa-heart-o' aria-hidden='true' style='color:red; font-size:11px;'></i>");
				}else{
					$(".himg"+loopnum).html("<i class='fa fa-heart' aria-hidden='true' style='color:red; font-size:11px;'></i>");
				} 
				
		}
		
	});
	
	
};
</script>