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
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog_pop.css"/>
<!-- css  -->


<!-- 전체 -->
<div id="pollpop">
<!-- 제일 상단 -->
	<div class="poll_head">
		<h3>▶&nbsp;투표생성</h3>
	</div>
<div id="polll_container">	
<!-- 왼쪽 전체 메뉴 -->
	<div id="left_con">
		<!--왼쪽 내부 상단 -->
		<div id="left_title">
			<h4 class="top_c_01">투표주제</h4>
	
			<table cellspacing="0" cellpadding="0" class="list_f_01">
				<tr>
					<td class="t_pic">
						<img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음">						
					</td>
					<!-- 오른쪽 항목 테이블로 넣음 -->
					<td>
							<table cellpadding="0" cellspacing="0" border="0">
			                    <tbody>
				                    <tr>
				                    <td><input type="text" name="subjectNameOri" title="투표주제를 입력하세요." value="투표주제를 입력하세요." class="txt" maxlength="200"></td>
				                    </tr>
				                    <tr>
					                    <td class="t_link">
											<form name="form2_0" method="post" enctype="multipart/form-data">
												<div class="divFileUpload">
													<label class="btn" for="inputFileUpload_0">이미지 첨부</label>
													<input type="file" name="inputFileUpload" class="inputFileUpload" id="inputFileUpload_0">
												</div>
											</form>
					                    </td>
				                  	 </tr>
			                	</tbody>
		              		  </table>
					</td>
				</tr>
			</table>
		</div>
		
			<!-- 왼쪽 내부 하단  -->
			<div id="left_poll">
				<div class="lpt">
					<h4 class="top_c_02">투표항목
						<span class="top_c_btn">
							<a href="#"><img src="http://static.naver.com/poll/img/ico_add01.gif" width="14" height="14" alt="항목 추가">
								<span style="margin-left:3px;">항목 추가</span>
							</a>
						</span>
					</h4>
					<ul class="poll_box">
						<li>
							<table cellspacing="0" cellpadding="0" border="0" class="list_f_01">
			                    <tbody>
			                        <tr>
			                            <td class="num">1</td>
			                            <td class="t_pic"><img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음"></td>
			                            <td>
			                                <table cellspacing="0" cellpadding="0" border="0">
			                                    <tbody>
			                                        <tr>
			                                            <td>
			                                                <input type="text" title="투표항목을 입력하세요." value="" name="" class="txt01" maxlength="150"><span class="r_btns"><a class="r_down" href="#"><img src="http://static.naver.com/poll/img/ico_down01.gif" alt="항목 아래로 이동"></a><a class="r_up" href="#"><img src="http://static.naver.com/poll/img/ico_up01.gif" alt="항목 위로 이동"></a><a href="#"><img src="http://static.naver.com/poll/img/ico_cut01.gif" alt="항목 삭제"></a></span>
			                                            </td>
			                                        </tr>
			                                        <tr>
			                                            <td>
															<form name="form2_1" method="post" enctype="multipart/form-data">
																<div class="divFileUpload">
																	<label class="btn" for="inputFileUpload_1">이미지 첨부</label>
																	<input type="file" name="inputFileUpload" class="inputFileUpload" id="inputFileUpload_1">
																</div>
															</form>
			                                            </td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </td>
			                            <td class="word" style="display: none;">
			                        </td></tr>
			                    </tbody>
			                </table>
			              </li>
			              
			              <li>
							<table cellspacing="0" cellpadding="0" border="0" class="list_f_01">
			                    <tbody>
			                        <tr>
			                            <td class="num">2</td>
			                            <td class="t_pic"><img src="http://static.naver.com/poll/img/noimg_img.gif" width="43" height="43" class="border" alt="첨부된 이미지 없음"></td>
			                            <td>
			                                <table cellspacing="0" cellpadding="0" border="0">
			                                    <tbody>
			                                        <tr>
			                                            <td>
			                                                <input type="text" title="투표항목을 입력하세요." value="" name="" class="txt01" maxlength="150"><span class="r_btns"><a class="r_down" href="#"><img src="http://static.naver.com/poll/img/ico_down01.gif" alt="항목 아래로 이동"></a><a class="r_up" href="#"><img src="http://static.naver.com/poll/img/ico_up01.gif" alt="항목 위로 이동"></a><a href="#"><img src="http://static.naver.com/poll/img/ico_cut01.gif" alt="항목 삭제"></a></span>
			                                            </td>
			                                        </tr>
			                                        <tr>
			                                            <td>
															<form name="form2_1" method="post" enctype="multipart/form-data">
																<div class="divFileUpload">
																	<label class="btn" for="inputFileUpload_1">이미지 첨부</label>
																	<input type="file" name="inputFileUpload" class="inputFileUpload" id="inputFileUpload_1">
																</div>
															</form>
			                                            </td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </td>
			                            <td class="word" style="display: none;">
			                        </td></tr>
			                    </tbody>
			                </table>
			              </li>
					</ul>
				</div>
				
			</div>
		</div>
		
		<!-- 오른쪽 메뉴 -->
		<div class="ppt_right">
			<form name="form1" method="post">
				<input type="hidden" name="voteCount" id="voteCount" value="0">
				<input type="hidden" name="hidEndDate" id="hidEndDate" value="">
				<input type="hidden" name="subjectName" id="subjectName" value="투표주제를 입력하세요.">
				<input type="hidden" name="subjectImageUrl" id="subjectImageUrl">
	            <input type="hidden" name="itemString" id="listItemsData" value="">
	
	            <h4 class="top_a_03"><label for="personalVoteCount">답변선택수</label></h4>
	            <div id="selectPollNumber" class="selectbox-naked" style="z-index:999">
	                <select class="selectbox-source" name="personalVoteCount" id="personalVoteCount">
	                	<option value="1">1개 선택 가능</option>
	                	<option value="2">2개 선택 가능</option>
	                	<option value="3">3개 선택 가능</option>
	                	<option value="4">4개 선택 가능</option>
	                </select>
	                
	                <div class="selectbox-box">
	                    <span class="selectbox-label ">1개 선택 가능</span>
	                </div>
	            </div>
	       </div>
	
		        <input type="hidden" id="serviceId" name="serviceId" value="blog">
			</form>
       </div>
    
    <!-- 하단 --> 
     
     <div class="ppt_btn">
     	<a href="#" id="btn_ok">
     		<img src="http://static.naver.com/poll/img/btn_ppt02.gif" width="41" height="24" alt="확인 버튼">
     	</a>
     	
     	<a href="#" id="btn_cancel" onclick="close_onclick();">
     		<img src="http://static.naver.com/poll/img/btn_ppt03.gif" width="39" height="24" alt="취소 버튼">
     	</a>
     	<a href="#" id="btn_preview" class="r_btn">
     		<img src="http://static.naver.com/poll/img/btn_ppt04.gif" width="59" height="24" alt="미리보기 버튼">
     	</a>
     </div>
     		
     
		
	</div>
	
	
<!-- 오른쪽 답변 -->	