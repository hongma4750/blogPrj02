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



<!-- asset CSS -->
     <link href="assets/css/bootstrap.css" rel="stylesheet">

    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script> 
<!-- asset CSS -->

<style type="text/css">
.photo img {
    border-radius: 2px 2px 2px 2px;
    float: left;
    height: 40px;
    margin-right: 4px;
    width: 40px;
}

 .subject {
    display: block;
}

.dropdown-menu.inbox li a .subject .from {
    font-size: 12px;
    font-weight: 600;
}
.message {
    display: block !important;
    font-size: 11px;
}
</style>


<nav class="navbar navbar-default" style="background-color:#FFFFFF; border-color:#FFFFFF;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" >
      <a class="navbar-brand" href="#"><p style="color:black; font-style: solid ;font-weight: 30px; font-size: 30px;">꽃밭에 홍미니</p></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin:0; padding:0;">
     
      <form class="navbar-form navbar-left" role="search" action="search.do">   
        <div class="form-group" style="border-color:#45B914; border-style:solid ;border-width:3px;">
        
        <select name="srh_op" class="form-control" style="width:30%; display:inline-block; float:left; border-color:#45B914;">
		  <option value="post">포스트</option>
		  <option value="blog">블로그</option>
		  <option value="nicknid">별명·아이디</option>
		</select>
		
          <input type="text" name="srh_con" class="form-control" placeholder="Search" style="margin:auto; padding:auto;width:70%;border-color:#45B914;">
          
        </div>
        
        <!-- 검색 버튼 -->
        <button type="submit" class="btn btn-default" style="background-color:#45B914; 
        border-color:#45B914; color:white; height:35px;">검색</button>     
      </form>
      
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${login.m_id ne null }">

	      	<li><a href="blogInfo.do">블로그 정보</a></li>
	        
      			<li>
                  	<a href="#" id="userInfo" >
                  		<img src="${login.m_photo }" alt="..." class="img-circle" style="width:30px; height:30px;">
                  		<span>김홍민 님</span>
                  	</a>
                  </li>
                  
                  <c:if test="${myMessageCount != 0 }">
                  	<div class="row" style="height:10%; width:100%; text-align:center;
                  	 z-index:20; position:absolute; left:495px;" >
		            	<span class="badge " id="messageCount">${myMessageCount }</span>
		            </div>
                  </c:if>
               
                  <li>
                  	<a href="#" id="notice">
                  		<i class="glyphicon glyphicon-envelope"></i>               		
                  	</a>
                  </li>
                  
                  
      			
      </c:if>

      <c:if test="${login.m_id eq null }">
      	 <li><a href="login.do" >로그인</a></li>
      	 <li><a href="regi.do" >회원가입</a></li>
      </c:if>
      
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<!-- 정보 -->
<div id="mymyInfo" style="position:absolute; top:69px; z-index:2; right:0px; 
     background-color: #fff; border:1px solid #000; padding:0; margin:0; 
     width: 316px; height: 172px; display: none;" >
  
	<div style="background-color: #fff; border:1px solid #000;  overflow:hidden;
     width: 316px; height: 172px;">
     
     <div style="width:100%; height:80%; ">
     	<div style="height:100%; width:30%; float:left; display:inline-block; border-color:#4C4C4C; ">
     		
     		<div class="panel panel-success" style="width:100%;height:100%;">
            <div class="panel-body">
            	<c:if test="${login.m_id ne null }"><img src="${login.m_photo }" style="width:70px; height:80px;" class="img-circle"></c:if>
            </div>
            
            <div class="row" style="height:10%; width:100%; text-align:center; z-index:10; top:85px; right:140px;position:absolute;" >
            	<a href="myProfile.do"><span class="badge "><i class="glyphicon glyphicon-search"></i></span></a>
            </div>
            </div>
     	
     	</div>
     	
     	
     	<div style="height:100%; width:70%; float:left; display:inline-block;">
			<div class="row" style="padding:auto; margin:auto; width:100%; height:25px;">
			
				<div>
					<h3 style="float:left; display:inline-block;"><a href="myProfile.do" style="color:black;">김홍민</a> <small>님</small></h3>
				</div>
				
				<div  style="padding:auto; margin:auto; margin-top:25px;vertical-align: text-bottom; text-align:center; ">
					<a href="logout.do"><span class="badge">로그아웃</span></a>
				</div>
			</div>
			
			<div class="row" style="margin:auto; padding:auto;">
				<h4>lovely4750@naver.com</h4>
			</div>
			
			<div class="row" style="margin:auto; padding:auto;">
				<a href="myPage.do" style="color:black; text-decoration: none"><h5>내정보</h5></a>
			</div>
		</div>
     </div>
     
     <div style="width:100%; height:20%;">
     	<div class="row" style="margin:auto; padding:auto; width:100%; height:100%">
     		<button class="form-control btn btn-primary" style="width:100%; height:100%">내블로그</button>
     	</div>
     </div>
     <!-- 정보 -->
     
</div>
</div>




<div id="myNotice" style="position:absolute; top:69px; z-index:2; right:0px; 
     background-color: #fff; border:1px solid #000; padding:0; margin:0; 
     width:297px; height: 172px; display: none;">
	
	
	<div style="width:100%; height:80%; overflow-y:scroll;">
		
		<div style="width:100%; height:20%; border-bottom-color: black;">
				<div class="row" style="padding:auto; margin:auto; height:100%; width:100%; ">
				
				<div style="width:70%; height:100%; margin:0; padding:0; display:inline-block; float:left; ">
					<p class="lead" style="">전체 알림</p>
				</div>
				
				
				<div style="display:inline-block; text-align:right; padding:auto; margin:auto; height:100%; width:30%;">
					<button class="btn btn-default" style="width:100%; height:100%; vertical-align: middle;">전체 삭제</button>
				</div>
			</div>
			
		</div>
		
		
		<!-- 메세지 -->
		<div style="width:100%; height:80%; ">
		
			<c:forEach items="${newMyMessageList }" var="myMessage">
			
				<div class="list-group" style="margin:auto; padding:auto;">
				  <a href="#" class="list-group-item ">
				  	<span class="photo" style="maring:auto; padding:auto;">
				  		<img alt="avatar" src="${myMessage.m_photo }" style="width:35px;height:40px;">
				  	</span>
				  	
				  	<span class="subject">
					    <span class="from">${myMessage.m_name } </span>
		             </span>
		             <span class="message">${myMessage.message_content }</span>
				  </a>
				</div>
				
			</c:forEach>

		</div>
		
	</div>
	
	
	<div style="width:100%; height:20%; background-color:skyblue">
		<div class="row" style="width:100%; height:100%; padding:auto; margin:auto;">
			<button class="btn btn-default" style="width:100%; height:100%;">see all message</button>
		</div>
	</div>
</div>
<!-- 메세지 -->


<script>
$('#userInfo').click(function(){
    //비로그인시 로그인 안내 div태그
    document.all.mymyInfo.style.display = "inherit";
 });
 
 $("#notice").click(function(){
	 document.all.myNotice.style.display="inherit";
 });
 
 
 /* 팝업 사라지는 자바 스크립트*/
 $(document).ready(function(){
	 var myMessageCount = '${myMessageCount}';
		var m_id = '${login.m_id}';
		var checkNewMessage = false;
		var checkNewMessageFiveCount = 0;
		
	 $(document).mousedown(function(e){
	 $('#mymyInfo , #myNotice').each(function(){
	         if( $(this).css('display') == 'block' )
	         {
	             var l_position = $(this).offset();
	             l_position.right = parseInt(l_position.left) + ($(this).width());
	             l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());


	             if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
	                 && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
	             {
	                 //alert( 'popup in click' );
	             }
	             else
	             {
	                 //alert( 'popup out click' );
	                 $(this).hide("fast");
	             }
	         }
	     });
	 }); 
	 
	 
	 
	 $(function() {
		    timer = setInterval( function () {
		    	
		    	if(m_id == ""){
		    		
		    		return;
		    	}else{
		    		$.ajax ({
				    	type:"GET",
				   		url:"checkNewMessage.do",
				   		data:"m_id="+m_id,
				       	cache : false,
				       	success : function (checkMyNewMessage) {
				       		
				       		
				       		if(checkMyNewMessage != myMessageCount){
				       			//기존 메세지 카운수랑 새로 체크해본 결과가 다르다
				       			myMessageCount = checkMyNewMessage;
				       			$("#messageCount").text(myMessageCount);
				       			checkNewMessage = true;;
				       		}
				       		
				       		
				       		if(checkNewMessage){
				       			if(checkNewMessageFiveCount < 5){
				       				if($("#messageCount").css("display") == "none"){
				       					$("#messageCount").show();
				       				}else{
				       					$("#messageCount").hide();
				       				}
				       				
				       				checkNewMessageFiveCount += 1;
				       			}else{
				       				$("#messageCount").show();
				       				checkNewMessage = false;
				       				checkNewMessageFiveCount = 0;
				       			}
				       		}
				       	}
				       });
		    	}
		    	
		       
		    }, 1000);	//5초
		  });
 
 
	 });
 
 /* 팝업 사라지는 자바 스크립트*/
 
 

 
 
</script>


 <!-- Modal -->
<!--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
       	머지여긴?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->