<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.*" %>
    <%@ page import="sist.co.Model.*" %>
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

<!--  페이징 -->
		<%
			String pageobj = request.getParameter("page");
			int currentpage;
			if (pageobj == null) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(pageobj);
			}
			
			List<SistBlogPageDTO> plist = (List<SistBlogPageDTO>)request.getAttribute("blogPageList");
			List<SistBlogDTO> reList = (List<SistBlogDTO>)request.getAttribute("bloglist");
			
			int pnum;
			int pageblock = 20;
			int block = (int) Math.ceil((double) currentpage / pageblock);
			int bstartpage = (block - 1) * pageblock + 1;
			int bendpage = bstartpage + pageblock - 1;
			pnum = (int) Math.ceil((double) reList.size() / 5);
		%>
	<!--  페이징 -->
	

<div class="con">
	<!-- 전체보기 목록 -->
	<div id="total_list">
		<div class="total_view">
			<a href="#none" class ="tview1" title="tview" id="total_show"><strong>전체보기&nbsp;(${fn:length(bloglist) })</strong></a>
			<a href="#none" class ="tview2" title="listopen" id="open_list"><strong>목록열기</strong></a>
		</div>
		
		<div class="total_view_detail" style="display:none;">
			<div class="row" style="margin:auto; padding:auto;">
				<span>
					<a href="#none" class ="tview1" title="tview" id="total_show"><strong>전체보기&nbsp;(${fn:length(bloglist) })</strong></a>
					
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
					
				<c:if test="${empty blogPageList }">
					<tr valign="top">
						<td colspan="4">작성된 게시글 목록이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${blogPageList }" var="total_blist" varStatus="totalvar">
					<tr valign="top">
						<td class="t1"><input type="checkbox" name="total_chk" class="list_checkbox" style="display:none;"><p class="point">＊</p></td>
						<td class="t2"><a href="BbbsDetail.do?bbs_seq=${total_blist.bbs_seq }&log_id=${login.m_id }">${total_blist.bbs_title }</a></td>
						<td class="t3">12</td>
						<td><small>${fn:substring(total_blist.bbs_date,0,12) }</small></td>
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
									
								</span>
							</div>
							
						</td>
					</tr>
					
				</table>
				
				<div class="row" style="margin:auto; padding:auto; text-align:center;">
					<nav>
							<ul class="pagination">
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">처음</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blognl.do?page=1">처음</a></li>
								<%
									}
								%>
			
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Previous"
									href="blognl.do?page=<%=currentpage - 1%>"><span
										aria-hidden="true">&laquo;</span></a></li>
								<%
									}
								%>
			
								<%
									if (bendpage > pnum) {
										bendpage = pnum;
									}
									for (int i = bstartpage; i <= bendpage; i++) {
										if (currentpage == i) {
								%>
								<li class='active'><a href="#"><%=i%></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blognl.do?page=<%=i%>"><%=i%></a></li>
								<%
									}
									}
								%>
			
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">&raquo;</span></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Next"
									href="blognl.do?page=<%=currentpage + 1%>"><span
										aria-hidden="true">&raquo;</span></a></li>
								<%
									}
								%>
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">끝</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="blognl.do?page=<%=pnum%>">끝</a></li>
								<%
									}
								%>
							</ul>
						</nav>
				</div>
				
				
		</div>
		
		
		</div>
		
		</div>
		

		
	</div>
	
	
	
	

<!-- 글 목록 전체보기 -->

	<div class="viewcon">
		<c:if test="${empty blogPageList }">
			<div class="total_content">
				<p>작성된 글이 없습니다.</p>
			</div>
		</c:if>
		<form name="bfrmform" id="bfrmform" action="" method="post">
		<c:forEach items="${blogPageList }" var="blog" varStatus="blogvar">
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
				
				<!-- 댓글 -->
				<!-- 여기 댓글 클래스명 나중에 seq로 줘서 구분하기 -->
				<div class="foot_reple${blogvar.count }" id="foot_reple" ><!-- style="display:none;" -->
				<!-- 댓글 리스트 -->
					
					<c:forEach items="${commentList }" var="comment" varStatus ="commentStatus">
					
						<c:if test="${blogvar.index eq commentStatus.index}">
							
							<c:forEach items="${comment }" var="realyComment">
								<ul>
									<li class="re_li">
										<dl>
											<dt class="dt1" >
												<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">							
											</dt>
											
											<dt class="dt2" style="background-color:red;">
												<a href="blog.do" class="nick">${realyComment.m_id }</a>
												&nbsp;&nbsp;
												<span class="re_date"><small>${fn:substring(realyComment.com_date,0,11) }</small></span>
												
													<span style="float:right;">
														&nbsp;&nbsp;
														<a href="#none" class="re_sh"><small>답글</small></a>
														<span>&nbsp;|&nbsp;</span>
														<a href="#" ><small class="comment-toggle">수정</small></a>
														<span>&nbsp;|&nbsp;</span>
														<a href="bbsdel.do"><small>삭제</small></a>
													</span>
											</dt>
											
											<dd style="float:center">${realyComment.com_content }</dd>
											
											<div class="modify-comment" style="display:none;">
							    	
											    <div style="text-align: right;">
											      <a href="#" ><small class="modifying" onclick="updateComment()">수정</small></a> |
											      <a href="#"><small class="cancel" id="${realyComment.com_seq }">취소</small></a>
											    </div>
											    
											    <div>
											      <textarea class="modify-comment-ta" name="com_content_re" rows="4" cols="50" id="modifyContent">${realyComment.com_content }</textarea>
											    </div>
											    
											  </div>
							  
										</dl>
									</li>
									
									<li class="re_hide" style="display:none">		<%--대댓글 쓰는부분 --%>
										<i class="fa fa-share-square" aria-hidden="true"></i>
										<table>
											<tr>
												<td class="i1">
													<img src="${login.m_photo }" class="img-responsive" alt="Responsive image" style="width:40px; height:40px;">
												</td>
												<td class="i2">
													<textarea cols="50" rows="2" class="textarea _activeId _commentRosText" 
													name="comment.contents" maxlength="6000" tabindex="0" 
													style="overflow: hidden; line-height: 14px; height: 53px; resize: none;"></textarea>
												</td>
												<td class="i3">
													<input type="button" class="re_btn" value="덧글입력" />
												</td>
											</tr>
										
										</table>
									</li>
							</ul>
							</c:forEach>
							
							<table>
								<tr>
									<td class="i1">
										<input type="hidden" name="m_id" value="${login.m_id }" id="m_id"/>
										<input type="hidden" name="blog_nickname" value="${someoneBlog.blog_nickname }">
										<img src="${login.m_photo }" class="img-responsive" alt="Responsive image" style="width:40px; height:40px;">
									</td>
									<td class="i2">
										<textarea cols="50" rows="2" class="com_cont${blogvar.count }" name="com_content" id="commentTextArea" maxlength="6000" tabindex="0" onkeyup="areaheight(this)"></textarea>
									</td>
									<td class="i3">
										<input type="button" class="re_btngo${blogvar.count }" value="덧글입력" onclick="insertComment('${blog.bbs_seq}','${someoneBlog.blog_nickname }')"/>
									</td>
								</tr>
								
							</table>
					
						</c:if>
					</c:forEach>
					
				
					<%-- <div class="r_re">
						<ul>
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
											<img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
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
											<img src="${login.m_photo }" class="img-responsive" alt="Responsive image">						
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
					</div> --%>
				<%-- <form name="replyform" id="replyform" method="post">			
					<table>
						<tr>
							<td class="i1">
								<input type="hidden" name="bbs_seq" class="bbs_seq" value="${blog.bbs_seq }"/>
								<input type="hidden" name="m_id" value="${login.m_id }"/>
								<input type="hidden" name="blog_nickname" value="${someoneBlog.blog_nickname }">
								<img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
							</td>
							<td class="i2">
								<textarea cols="50" rows="2" class="com_cont${blogvar.count }" name="com_content" maxlength="6000" tabindex="0" onkeyup="areaheight(this)"></textarea>
							</td>
							<td class="i3">
								<input type="button" class="re_btngo${blogvar.count }" value="덧글입력"/>
							</td>
						</tr>
						
					</table>
				</form>	 --%>
				</div>
			</div>
	</c:forEach>
	</form>
</div>

	
	
	<!-- <div class="paginglist" style="margin:auto; padding:auto; background-color:blue; display:block;"> -->
		
		<nav>
			<ul class="pagination">
				<%
					if (currentpage <= 1) {
				%>
				<li class="disabled"><span aria-hidden="true">처음</span></li>
				<%
					} else {
				%>
				<li><a style="color: black;"
					href="blognl.do?page=1">처음</a></li>
				<%
					}
				%>

				<%
					if (currentpage <= 1) {
				%>
				<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
				<%
					} else {
				%>
				<li><a style="color: black;" aria-lable="Previous"
					href="blognl.do?page=<%=currentpage - 1%>"><span
						aria-hidden="true">&laquo;</span></a></li>
				<%
					}
				%>

				<%
					if (bendpage > pnum) {
						bendpage = pnum;
					}
					for (int i = bstartpage; i <= bendpage; i++) {
						if (currentpage == i) {
				%>
				<li class='active'><a href="#"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a style="color: black;"
					href="blognl.do?page=<%=i%>"><%=i%></a></li>
				<%
					}
					}
				%>

				<%
					if (currentpage >= pnum) {
				%>
				<li class="disabled"><span aria-hidden="true">&raquo;</span></a></li>
				<%
					} else {
				%>
				<li><a style="color: black;" aria-lable="Next"
					href="blognl.do?page=<%=currentpage + 1%>"><span
						aria-hidden="true">&raquo;</span></a></li>
				<%
					}
				%>
				<%
					if (currentpage >= pnum) {
				%>
				<li class="disabled"><span aria-hidden="true">끝</span></li>
				<%
					} else {
				%>
				<li><a style="color: black;"
					href="blognl.do?page=<%=pnum%>">끝</a></li>
				<%
					}
				%>
			</ul>
		</nav>
		
	
<!-- </div> -->



<script type="text/javascript">
/*blog_like/////////////////*/
//공감 초기 세팅
$(document).ready(function(){
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
	
/* 	//댓글달기
	for(var c=1; c<=leng; c++){
		$(".re_btngo"+c.toString()).click(function(){
			var c_class = $(this).attr('class');
			var clen = c_class.length;
			var cc = c_class.substring(8,clen); //숫자만 잘라냄
			
			alert("댓글쓸거다"+cc);
			var b_seq = document.getElementsByName('bbs_seq')[cc].value;
			//alert("b_seq:"+b_seq);
			var b_content =$(".com_cont"+cc).val();
			//alert("b_content:"+b_content);
			var b_mid =document.getElementsByName('m_id')[cc].value; //m_id
			//alert("b_mid:"+b_mid);
			var b_nick =document.getElementsByName('blog_nickname')[cc].value; //nickname
			//alert("b_nick:"+b_nick);
			
			var com_con ="\'comment.do?bbs_seq="+b_seq+"&com_content="+b_content+"&m_id="+b_mid+"&blog_nickname="+b_nick"\'"; //내용 가져오기
			alert(com_con);
			
		})
		
	}
	 */
	
	
	
	
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

//textarea높이 늘어나게
function areaheight(obj){
	obj.style.height="1px";
	obj.style.height=(20+obj.scrollHeight)+"px";
	
}

function insertComment(bbs_seq,blog_nickname){
	location.href="comment.do?com_content="+$("#commentTextArea").val()+"&m_id="+$("#m_id").val()+"&bbs_seq="+bbs_seq+"&blog_nickname="+blog_nickname;
}
	

$(document).ready(function() {
	
	function updateComment(){
		alert("sksl?");
	}
	
	 
	$('.comment-toggle').click(function(e) {
			alert("일단반응");
	        var $form = $(e.target).parent().parent().parent().parent().find('.modify-comment');

	        var $p = $(e.target).parent().parent().find('.comment-toggle');
	        var $o = $(e.target).parent().parent().find('.comment-delete');
	        var $c = $(e.target).parent().parent().parent().find('.comment-content');
      
	        if ($form.is(':hidden') == true) {
	            $form.show();
	            $p.hide();
	        	$o.hide();
	        	$c.hide();
	        } else {
	            $form.hide();
	            $p.show();
	            $o.show();
	            $c.show();
	        }
	        return false;
	});
	
	$('.comment-delete').click(function(e) {
		var chk = confirm("정말로 삭제하시겠습니까?");
        if (chk == true) {
            return true;
        }
        return false;
});
	
	/* SNS/CommentUpdate.jsp?com_seq=${comment.com_seq }$r_seq=${comment.r_seq }&com_content= */
	//form 안의 수정하기 링크
	/* $('.modifying').click(function(e) {
		
	   var url="updateComment.do?com_seq="+$('.com_seq_re').val()+"&com_content="+$('.modify-comment-ta').val();
	   
	   alert("seq : "+$('.com_seq_re').val() + " , content = "+$('.modify-comment-ta').val());
	    //$(location).attr('href',url);
	     
	    //alert(url);
	    //location.href="index01.jsp?mode=SNS/ReviewDetail"

	}); */
	
	
	
	//form 안의 취소 링크
	$('.cancel').click(function(e) {
	    var $form = $(e.target).parent().parent().parent().parent().find('.modify-comment');
	    
	    var $p = $(e.target).parents().find('.comment-toggle');
        var $o = $(e.target).parents().find('.comment-delete');
        var $c = $(e.target).parents().find('.comment-content');
        
        
        /* alert("1 : "+$('#com_seq_check').attr('value'));
        alert("2 : "+$(e.target).parents().find('.cancel').attr('id')); */
        
	    if ($form.is(':hidden') == true) {
	    	$form.show();
	        $p.hide();
        	$o.hide();
        	$c.hide();
	    } else {
	    	
	    	$form.hide();
	        $p.show();
            $o.show();
            $c.show();
	    }
	    return false;
	});

});

</script>