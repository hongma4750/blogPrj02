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
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 링크 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 부트스트랩 링크 -->

<style type="text/css">
	
</style>

<div style="width:100%; height:35px;background-color:#333947; color:#5DBB1D;">
	<div id="row" style="padding:auto; margin:auto;">
       	<small><a href="index.do" style="text-decoration: none;color:#5DBB1D; font-size:20px;">꽃밭에 홍미니</a></small>
       	<small><a href="#"style="text-decoration: none;color:white; font-size:20px;">내블로그</a></small>
       	 <div style="float:right;">
	    	<button class="form-control btn btn-primary" style="height:100%; background-color:#525763; border-color:#525763;"
	    	onclick="location.href='login.do'">로그인</button>
	    </div>
    </div>
    
   
</div>