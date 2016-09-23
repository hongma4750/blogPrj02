<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

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


<!-- 이웃, 그룹 관리 창 -->

<h3><strong>열린이웃,그룹관리</strong></h3>
<hr>

서로이웃 신청받기 
<input type ="radio" id="chkY" name="dblfollow" value="Y" checked="checked"/><label for="chkY">사용</label>&nbsp;&nbsp;
<input type ="radio" id="chkN" name="dblfollow" value="N"><label for="chkN">사용하지 않음</label>
<hr>
<div align="center">
<input type="submit" id="btndblfollowOk" value="확인"/>
</div>

<!-- 서로이웃 받기 사용 시 div -->
<div id="dblfollow_on" style="position:absolute; top:300px; left:400px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:300px; height:100px; display: none;">
  <h5>서로이웃 신청을 받을 수 있습니다.<button type="button" id="" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <br>
  <div align="center"><input type="submit" value="확인" onclick="location.href='openfriend.do'"></div>
</div>
<!-- 서로이웃 받기 사용 시 div -->



<!-- 서로이웃 받기 사용하지 않을 시 div -->
<div id="dblfollow_off" style="position:absolute; top:300px; left:400px; z-index:2; 
     background-color: #fff; border:1px solid #000; 
     width:300px; height:100px; display: none;">
  <h5>서로이웃 신청을 받지 않습니다.<button type="button" id="" onclick="btnClose();" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>&nbsp;&nbsp;</button></h5>
  <br>
  <div align="center"><input type="submit" value="확인" onclick="location.href='setfriendGroup.do'"></div>
</div>
<!-- 서로이웃 받기 사용하지 않을 시 div -->




<div id="con">
<div role="tabpanel">
<ul class="nav nav-tabs" role="tablist" id="myTab">

  <li rel="defaulttab" role="presentation" class="active" ><a href="#" id="tab1" aria-controls="home" role="tab" data-toggle="tab">열린이웃</a></li>
  <li rel="grouptab" role="presentation"><a href="#" id="tab2" aria-controls="presentation" role="tab" data-toggle="tab">이웃그룹</a></li>
  <li rel="seqtab" role="presentation"><a href="#" id="tab3" aria-controls="presentation" role="tab" data-toggle="tab">이웃순서</a></li>
  
		<div align="right" style="float: reft;">
			<input type="text" id="searchbar" value="" placeholder="별명,블로그명,ID" />&nbsp;&nbsp;
			<input type="submit" id="btnSearch" value="검색" />
	    </div>
	    
	    
	    
	   <%-- <div id="others">
			<div role="tab_con" class="tab_con" id="defaulttab">
				<!-- 열린이웃 탭 클릭시_include -->			
			</div>
			<div role="tab_con" class="tab_con" id="grouptab">
				<!-- 이웃그룹 탭 클릭시_include -->
				<jsp:include page="friendgroup.do" flush="true" />
			</div>
			<div role="tab_con" class="tab_con" id="seqtab">
				<!-- 이웃순서 탭 클릭시_include -->
				<jsp:include page="friendseq.do" flush="true" />
			</div>
		</div> --%>
		
		
		
</ul>
	
</div>
</div>



<br><br>



<script type="text/javascript">
//탭클릭에 따른 내용 변경
$(function (){
	$(".tab_con").hide();
	$(".tab_con:first").show();
	
	$("#con ul.nav-tabs li").click(function(){
		$("#con ul.nav-tabs li").removeClass("active").css("color","red");
		$(this).addClass("active").css("color","yellow");
		$("#others .tab_con").hide();
		var actTab=$(this).attr("rel");
		$("#"+actTab).show();
	});
});

$(function () {
    $('#myTab a:first').tab('show')
});
  

//라디오 버튼 선택에 따라
//서로이웃 받기(사용)_확인 버튼 클릭시 div보이기
$("#btndblfollowOk").click(function(){
	if($('input:radio[name="dblfollow"]:checked').val()=="Y"){
		document.all.dblfollow_on.style.display="block";
	}else{
		//서로이웃 받기(사용하지않음)_확인 버튼 클릭시 div보이기
		document.all.dblfollow_off.style.display="block";
	}
});


//div에 X닫기 버튼 클릭시
function btnClose(){
	document.all.dblfollow_on.style.display = "none";
	document.all.dblfollow_off.style.display ="none";
};

//검색 버튼 클릭시
$("#btnSearch").click(function(){
	if($("#searchbar").val()==""){
		alert('검색어를 입력해주세요.');
	}
	
});

//첫번째 탭 열린이웃 클릭시
$("#tab1").click(function(){
	location.href="openfriend.do";
});
//두번째 탭 열린이웃 클릭시
$("#tab2").click(function(){
	location.href="friendgroup.do";
});
//세번째 탭 열린이웃 클릭시
$("#tab3").click(function(){
	location.href="friendseq.do";
});

</script>