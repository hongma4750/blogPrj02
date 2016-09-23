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

<div style="width:100%; height:100%;">
	<form action="sendMessageAF.do" method="POST" id="message-form">
		<table class="table table-hover">
	 		<tr>
	 			<td colspan = "2"> 꽃보다 블로그 </td>
	 		</tr>
	 		
	 		<tr>
	 			<td>받는 사람</td>
	 			<td>${fndInfo.m_name} [${fndInfo.m_id }]
	 				<input type="hidden" value="${login.m_id }" name="message_sender" id="test">
	 				<input type="hidden" value="${fndInfo.m_id }" name="message_receiver">
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2">
	 				<textarea rows="10" cols="45" name="message_content" id="message_content"></textarea>
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2" style="text-align:center">
	 				<button type="submit" class="btn btn-success" onclick="return sendMessage()">전송</button>
	 				<button type="button" class="btn btn-danger" onclick="cancelMessage()">취소</button>
	 			</td>
	 		</tr>
		</table>
	</form>
</div>


<script>
	function sendMessage(){
		if($("#message_content").val()==0){
			alert("메세지를 입력해주세요");
			return false;
		}
		self.close();
		
		return true;
		
	}
	
	function cancelMessage(){
		self.close();
	}
</script>