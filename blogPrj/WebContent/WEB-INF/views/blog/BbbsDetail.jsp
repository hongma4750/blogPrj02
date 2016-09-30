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


<!-- 상세페이지 -->
<div class="Bdetailcon">

<jsp:useBean id="addhand" class="sist.co.help.BBSDepth"/>

   <form name="bfrmform" id="bfrmform" action="" method="post">
      <p><strong style="color:#20A524; font-size:15px;">${blogdto.bbs_title }</strong> &nbsp;&nbsp;&nbsp;&nbsp;| study </p>
      <p class="view2">
         ${blogdto.bbs_date }&nbsp;&nbsp;&nbsp;
         <c:if test="${blogdto.m_id eq login.m_id }">
            <a href="#none" class="_btnupdate">수정</a> | 
            <a href="bbsdel.do?bbs_seq=${blogdto.bbs_seq }&m_id=${login.m_id }" class="_btndel"><small>삭제</small></a>
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
                     <c:choose>
                        <c:when test="${empty replylist }">
                           <a href="#none" class="reple_show">댓글쓰기</a>
                        </c:when>
                        <c:otherwise>
                           <a href="#none" class="reple_show" style="color:green;">댓글
                              <c:out value="${comcount}"/>
                           </a>
                        </c:otherwise>
                     </c:choose>
                  </c:if>
                  <input type="hidden" name="log_id" class="log_id" value="${login.m_id }"/>
                  <input type="hidden" name="bbs_seq" class="bbs_seq" value="${blogdto.bbs_seq }"/>
                  <c:if test="${blogdto.bbs_likechk eq 1 }">
                     <span>&nbsp;|&nbsp;</span>
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

         <div id="foot_reple" style="display:none;">

            <!-- 댓글목록 없을때 -->
            <c:if test="${empty replylist }">
               <form name="dereplyform" id="dereplyform" method="post">         
                  <table>
                     <tr>
                        <td class="i1">
                           <input type="hidden" name="bbs_seq" class="bbs_seq" value="${blogdto.bbs_seq }"/>
                           <input type="hidden" name="m_id" value="${login.m_id }"/>
                           <input type="hidden" name="blog_nickname" value="${someoneBlog.blog_nickname }">
                           <img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
                        </td>
                        <td class="i2">
                           <textarea cols="50" rows="2" class="com_cont" name="com_content" maxlength="6000" tabindex="0" onkeyup="areaheight(this)"></textarea>
                        </td>
                        <td class="i3">
                           <input type="button" class="re_btngo" value="덧글입력"/>
                        </td>
                     </tr>
                     
                  </table>
               </form>   
            </c:if>
            
         <!-- 댓글 리스트 -->
            <div class="r_re">
            <c:if test="${not empty replylist }">
               <c:forEach items="${replylist }" var="replist" varStatus="replistvar">
                  <ul>
                  <!-- 댓글 -->
                     <li id="re_li${replistvar.count}" class="re_li" >
                     <jsp:setProperty property="depth" name="addhand" value="${replist.com_depth }"/>
                     <!-- 부모글 삭제됐을때 -->
                     <c:if test="${replist.com_del eq 1 && replist.com_parent eq 0 }">
                        <dl>
                           <dt class="dt2">
                              <!-- 댓글 리스트 포문 돌리기 -->
                              <span>삭제된 댓글입니다.</span>
                              <span class="re_date"><small>${replist.com_date }</small></span>
   
                           </dt>
                        
                        </dl>
                     </c:if>
                     <!-- 부모글 삭제 안됐을때 -->
                     <c:if test="${replist.com_del eq 0}">
                        <dl>
                           <dt class="dt1" style="vertical-align: top;">
                              <jsp:getProperty property="hand" name="addhand"/>
                           </dt>
                           <dt class="dt1">
                              <img src="${replist.m_photo }" class="img-responsive" alt="Responsive image">
                           </dt>
                           <dt class="dt2">
                              <a href="blog.do?fid=${replist.m_id }" class="nick">${replist.m_id }</a>
                              <!-- 댓글 리스트 포문 돌리기 -->
                              <span class="re_date"><small>${replist.com_date }</small></span>
                              <div class="re_re" style="float: right;">
                                 <c:if test="${login.m_id ne null }">
                                    <a href="#none" id="toggle_rere${replistvar.count }" class="${replist.com_seq }"><small>대댓글</small></a>
                                    <c:if test="${login.m_id eq replist.m_id}">
                                       <span>&nbsp;|&nbsp;</span>
                                       <a href="#none" class="modicom_su${replistvar.count }"><small>수정</small></a>
                                       <span>&nbsp;|&nbsp;</span>
                                       <a href="delcomment.do?com_seq=${replist.com_seq }"><small>삭제</small></a>
                                    </c:if>
                                    <c:if test="${login.m_id eq finfo.m_id &&finfo.m_id ne replist.m_id}">
                                       <span>&nbsp;|&nbsp;</span>
                                       <a href="delcomment.do?com_seq=${replist.com_seq }"><small>삭제</small></a>
                                    </c:if>
                                 </c:if>
                              </div>
                           </dt>
                           <dd>${replist.com_content }</dd>
                           <!-- 수정 폼 -->
                           <dd class="_modicom_frm${replistvar.count }" style="display:none;">
                              <form name="com_modifyfrm" id="com_modifyfrm" method="post">
                                 <table>
                                    <tr>
                                       <td class="i1">
                                          <input type="hidden" id="${replist.com_seq }" class="modicom_seq${replistvar.count }"/>
                                       </td>
                                       <td class="i2">
                                          <textarea cols="50" rows="2" class="modicom_cont${replistvar.count }" style="display: flex; text-align:left;" maxlength="6000" onkeyup="areaheight(this)">
                                             ${replist.com_content }
                                          </textarea>
                                       </td>
                                       <td class="i3">
                                          <input type="button" class="modire_btn${replistvar.count }" value="덧글입력"/>
                                       </td>
                                    </tr>
                                 </table>
                              </form>
                                 
                              
                           </dd>
                        </dl>
                        </c:if>

                     </li>
                     
                     
               <!-- 대댓글 다는 폼(숨겨져있음)-->
                  <form name="rereform" id="rereform" method="post">   
                     <li id="rere_insert${replistvar.count}" class="rere_insert" style="display:none;">
                        <table>
                           <tr>
                              <td class="ii1">
                                 <i class="fa fa-hand-o-right" aria-hidden="true"></i>
                              </td>
                              <td class="i1">
                                 <img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
                                 <input type="hidden" id="${replist.com_seq }" class="com_seq${replistvar.count }"/>
                                 <input type="hidden" class="bbs_seq${replistvar.count }" value="${blogdto.bbs_seq }"/>
                                 <input type="hidden" class="m_id${replistvar.count }" value="${login.m_id }"/>
                                 <input type="hidden" class="blog_nickname${replistvar.count }" value="${login.m_name }">                  
                              </td>
                              <td class="rerei2">
                                 <textarea cols="50" rows="2" class="rrecom${replistvar.count }" maxlength="6000" tabindex="0" onkeyup="areaheight(this)"></textarea>
                              </td>
                              <td class="i3">
                                 <input type="button" class="rere_btngo${replistvar.count }" value="덧글입력"/>
                              </td>
                           </tr>
                        
                        </table>
                     </li>
                  </form>
                  
                  </ul>
               </c:forEach>
               
               <!-- 하단 댓글다는 폼 -->
                  <form name="replyform" id="replyform" method="post">         
                     <table>
                        <tr>
                           <td class="i1">
                              <input type="hidden" name="bbs_seq" class="bbs_seq" value="${blogdto.bbs_seq }"/>
                              <input type="hidden" name="m_id" value="${login.m_id }"/>
                              <input type="hidden" name="blog_nickname" value="${someoneBlog.blog_nickname }">
                              <img src="${login.m_photo }" class="img-responsive" alt="Responsive image">
                           </td>
                           <td class="i2">
                              <textarea cols="50" rows="2" class="com_cont" name="com_content" maxlength="6000" tabindex="0" onkeyup="areaheight(this)"></textarea>
                           </td>
                           <td class="i3">
                              <input type="button" class="re_btngo" value="덧글입력"/>
                           </td>
                        </tr>
                        
                     </table>
                  </form>   
               </c:if>
            
            </div>
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
$(document).ready(function(){
//댓글 개수
var replyleng = '${fn:length(replylist)}';

//대댓글 다는 창 띄우기
for(var i =1; i<=replyleng; i++){ 
   
   //var check_rere = 0;

   $("#toggle_rere"+i.toString()).click(function(){ //show
      var i_class=$(this).attr('id');
      var icom_seq=$(this).attr('class');
      
      var ilen = i_class.length;
      var ii = i_class.substring(11,ilen);

      if($(this).text() =="대댓글"){
         $("#rere_insert"+ii).show();
         $("#toggle_rere"+ii).html("답글취소");
         $("#toggle_rere"+ii).css({"color":"green","font-size":"11px"});
      }else if($(this).text() =="답글취소"){
         $("#rere_insert"+ii).hide();
         $("#toggle_rere"+ii).html("대댓글");
         $("#toggle_rere"+ii).css({"color":"black","font-size":"11px"});
      }
      
      

   })
   
}



//대댓글 달기(메인과 마찬가지로 뿌려진 리스트에서 com_seq떼어와야함)
for(var c=1; c<=replyleng; c++){
   $(".rere_btngo"+c.toString()).click(function(){
      var c_class=$(this).attr('class');
      alert(c_class);
      
      var clen = c_class.length;
      var cc = c_class.substring(10,clen);
      
      var c_seq = $(".com_seq"+cc).attr('id');
      var b_seq = $(".bbs_seq"+cc).val();
      //alert("b_seq:"+b_seq);
      var c_content =$(".rrecom"+cc).val();
      //alert("c_content:"+c_content);
      var c_mid =$(".m_id"+cc).val();
      //alert("c_mid:"+c_mid);
      var c_nick =$(".blog_nickname"+cc).val();
      //alert("c_nick:"+c_nick);
      
      var com_con ="recomment.do?com_seq="+c_seq+"&bbs_seq="+b_seq+"&com_content="+c_content+"&m_id="+c_mid+"&blog_nickname="+c_nick; //내용 가져오기
      $(location).attr('href',com_con);
      
   })
   
}


//댓글 수정창 띄우기
for(var e =1; e<=replyleng; e++){ 
   $(".modicom_su"+e.toString()).click(function(){ //show
      var e_class=$(this).attr('class');
      
      var elen = e_class.length;
      var ee = e_class.substring(10,elen);

      if($(this).text() =="수정"){
         $("._modicom_frm"+ee).show();
         $(this).html("수정취소");
         $(this).css({"color":"green","font-size":"11px"});
      }else if($(this).text() =="수정취소"){
         $("._modicom_frm"+ee).hide();
         $(this).html("수정");
         $(this).css({"color":"black","font-size":"11px"});
      }
      
      

   })
   
}


//댓글 수정
for(var d=1; d<=replyleng; d++){
   $(".modire_btn"+d.toString()).click(function(){
      var d_class=$(this).attr('class');
      alert(d_class);
      
      var dlen = d_class.length;
      var dd = d_class.substring(10,dlen);
      
      var c_seq = $(".modicom_seq"+dd).attr('id');
      //alert("b_seq:"+b_seq);
      var c_content =$(".modicom_cont"+dd).val();
      //alert("c_content:"+c_content);
      
      var modicom_con ="modicomment.do?com_seq="+c_seq+"&com_content="+c_content; //내용 가져오기
      $(location).attr('href',modicom_con);
      
   })
   
}

   
});

/* 
$(".rere_btngo").click(function(){
   alert("대댓글 달거다");
   $("#rereform").attr({"target":"_self","action":"recomment.do"}).submit();
}); */


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
   
   
   //댓글창 열기
   var check_reList = 0;
   $(".reple_show").click(function(){
      if(check_reList == 0){
         check_reList = 1;
         $("#foot_reple").show();
         $(".foot_sym").hide();
      }else{
         check_reList = 0;
         $("#foot_reple").hide();
         $(".foot_sym").show();
      }
      
      
   });
   

   //공감 창 열기
   var check_sym = 0;
   $(".sym").click(function(){
      if(check_sym==0){
         check_sym = 1;
         $(".foot_sym").show();
         $("#foot_reple").hide();
      }
      else{
         check_sym = 0;
         $(".foot_sym").hide();
         $("#foot_reple").show();
         
      }
      
   })
   
   
   
$(".re_btngo").click(function(){
   alert("댓글 달거다");
   $("#replyform").attr({"target":"_self","action":"comment.do"}).submit();
});
   
   
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


//textarea높이 늘어나게
function areaheight(obj){
   obj.style.height="1px";
   obj.style.height=(20+obj.scrollHeight)+"px";
   
};

</script>