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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="js/myProfile.js"></script>
    
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">
    
    
<style type="text/css">
html {
    
    background-color:#F5F6F8;
}
	body {
    width: 100%;
    height: 100%;
    background-color:#F5F6F8;
    margin:0;
    padding:0;
}
	#wrap {
    position: relative;
    min-width: 700px;
    height: 100%;
    background-color:#F5F6F8;
        margin:0;
    padding:0;
    
}
	#header {
    position: relative;
    width: 100%;
    margin: 0 ;
    padding: 0 ;
    background-color: #00c73c;
    font-size:12px;
}
#container {
    position: relative;
    z-index: 20;
    max-width: 954px;
    height: 100%;
    margin: 0 auto;
}
	#footer {
    clear: both;
    position: relative;
    z-index: 10;
    max-width: 914px;
    margin: 0 auto;
    padding: 0 20px;
}

.top {
    position: relative;
    max-width: 914px;
    height: 55px;
    margin: 0 auto;
    padding: 0;
    
}


#content.section_home {
    padding: 16px 12px 94px;
    line-height: 14px;
    zoom: 1;
}
#content {
    position: relative;
    padding: 32px 51px 95px;
    /* background-color:red; */
}

div {
    display: block;
}

.section_home .column {
    float: left;
    width: 50%;
}

.sh_group {
    min-height: 185px;
}
.sh_group, .sh_group2, .sh_group3, .sh_group4 {
    margin: 16px 8px 0;
    padding: 31px 29px 32px;
    border: 1px solid #dadada;
    border-radius: 2px;
    background: #fff;
    text-align: left;
}


.navbar-default {
	background-color: #00c73c;
	border-color: #00c73c;
}

<!-- 오른쪽 사람 정렬 css-->
.top-nav>li>a {
    padding-top: 15px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #999;
   
}

.top-nav>li>a:hover,
.top-nav>li>a:focus,
.top-nav>.open>a,
.top-nav>.open>a:hover,
.top-nav>.open>a:focus {
    color: #fff;
    background-color: #00c73c;
}

.top-nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    border: 1px solid rgba(0,0,0,.15);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.top-nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

ul.message-dropdown {
    padding: 0;
    max-height: 250px;
    overflow-x: hidden;
    overflow-y: auto;
}

li.message-preview {
    width: 275px;
    border-bottom: 1px solid rgba(0,0,0,.15);
}

li.message-preview>a {
    padding-top: 15px;
    padding-bottom: 15px;
}


#loginBtn{
    	 background-color: #1FBC02;
    	 border-color: #1FBC02;
    }
    
    .form-control:focus{
   		  outline: none !important;
    border-color: #1FBC02;
    box-shadow: 0 0 10px #1FBC02;
    }
    
    .form-control-1:focus{
   		  outline: none !important;
    border-color: #337AB7;
    box-shadow: 0 0 10px #1FBC02;
    }



</style>



    


<div id="wrap">
	<div id="header">
		<div class="top">

		<nav class="navbar navbar-default" >
		
			<a class="navbar-brand" href="index.do" style="color:white;font-size:30px;">꽃밭에 블로그</a>
			
		<ul class="nav navbar-right top-nav" >	
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                    	
                        <li class="message-preview">
                            <a href="#">
                            
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                        
                    </ul>
                    
                    
                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
		</nav>



		</div>
	</div>
	
	<!-- 회원 정보 -->
	
	<div id="container">
		<div id="content">
			<div class="column">
				<div class="sh_group">
				
				<h2><bold>프로필 수정</bold></h2>
				
				<form action="myProfile.do" method="post" enctype="multipart/form-data">
					<div style="height:100%; width:100%; ">
						<table class="table" style="text-align:center;">
							<col style="width:30%;"/>
							<col style="width:70%;"/>
						  <tr>
						  	<td style="height:300px;">프로필 사진</td>
						  	<td style="height:300px; text-align:left;">
						  		<div style=" height:85%; ">
						  			<img src="" alt="이미지 없음" class="img-rounded" style="width:200px; height:250px;" id="myImg">	
						  		</div>
						  		
						  		<div style="height:15%;">
						  			<input type="hidden" value="${login.m_id }" name="m_id">
						  			<input type="hidden" value="${login.m_photo }" name="m_photo" id="m_photo">
						  			<input type="file" id="exampleInputFile" name="fileload" onchange="UploadImg(this)">
						  			<input type="button" value="삭제" onclick="deleteImg()">
						  		</div>
						  	</td>
						  </tr>
						  
 
						  <tr>
						  	<td colspan="2">
						  		<button type="submit" class="form-control btn btn-primary" id="loginBtn" style="height:50px; width:100px;" >변경</button>
						  		<button type="button" class="form-control-1 btn btn-primary" 
						  		id="cancelBtn" style="height:50px; width:100px;" onclick="location.href='myPage.do'">취소</button>
						  	</td>
						  </tr>
						</table>
	
					</div>
					</form>
					
					
				</div>
			</div>

		</div>
	</div>
	
	
	
	<!-- 회원 정보 -->
	
	
	
	
	<!-- 푸터!!! -->
	<div id="footer">
		
	</div>
</div>


