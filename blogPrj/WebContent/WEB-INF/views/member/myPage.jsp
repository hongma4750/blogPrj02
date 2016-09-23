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
    

<!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
    
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
				
				
					<div style="height:100%;">
						<h2><bold>회원 프로필</bold></h2>
						
						<div class="row">
						  <div class="col-xs-6 col-md-3" style="text-align:center">
						    <a href="myProfile.do" class="thumbnail">
						      <img src='${login.m_photo }' alt="이미지없음" style="width:200px; height:250px;"> 
						    </a>
						 	 
						 	 
						    <input type="button" onclick="location.href='myProfile.do'" value="수정">
						   
						  </div>
						 	

						</div>
						
						
					</div>
					
					
				</div>
			</div>
			
			
			
			<div class="column">
				<div class="sh_group">
					<div style="height:100%;">
						<h2><bold>회원 연락처</bold></h2>
						
						<h3><bold>이메일 : </bold> ${login.m_email}</h3>
						<h3><bold>휴대전화 : </bold> ${login.m_phone }</h3>
						
						<div style="margin-left: 60px;">
						<input type="button" onclick="location.href='myInfo.do'" value="수정">
						</div>
					</div>
				</div>
			</div>
			
			<div class="column">
				<div class="sh_group">
					<div style="height:100%;">
						<h2><bold>비밀번호</bold></h2>

						<div style="margin-left: 60px;">
						<input type="button" onclick="location.href='myPw.do'" value="수정">
						</div>
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>
	
	
	<!-- 회원 정보 -->
	
	
	
	
	<!-- 푸터!!! -->
	<div id="footer">
		
	</div>
</div>

