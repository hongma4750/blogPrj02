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
			<col style="width:30%"/>
			<col style="width:70%"/>
	 		<tr>
	 			<td colspan = "2" > 꽃보다 블로그 </td>
	 		</tr>
	 		
	 		<tr>
	 			<td rowspan="3"><img src="${detailMessage.m_photo }" style="width:85px; height:100px;"></td>
	 			<td>보낸사람 : ${detailMessage.m_name} [${detailMessage.message_sender }]</td>
	 		</tr>
	 		
	 		<tr>
	 			<td>보낸 시간 : ${fn:substring(detailMessage.message_date,0,12)}</td>
	 		</tr>
	 		
	 		<tr>
	 			<td>받는이 : ${detailMessage.message_receiver }</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2">
	 				<textarea rows="10" cols="45" name="message_content" id="message_content" readonly>${detailMessage.message_content }
	 				</textarea>
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2" style="text-align:center">
	 				<button type="button" class="btn btn-success" onclick="okayMessage('${detailMessage.message_seq}')">확인</button>
	 				<button type="button" class="btn btn-info" onclick="reSendMessage('${detailMessage.message_sender}','${detailMessage.message_seq}')">답장</button>
	 				<button type="button" class="btn btn-danger" onclick="cancelMessage()">취소</button>
	 			</td>
	 		</tr>
		</table>
	</form>
</div>



<script>
	function okayMessage(a){
		$.ajax({
			type:"POST",
			url:"updateMessageRead.do",
			data:"message_seq="+a,
			success:function(msg){
				if(msg.message == "Suc"){
					self.close();
				}else{
					alert("확인실패");
				}
			}
			
		});

	}
	
	function reSendMessage(a,b){
		alert("a : "+a);
		alert("seq : "+b);
		var popUrl = "sendMessage.do?fndid="+a+"&status=re&message_seq="+b;   //팝업창에 출력될 페이지 URL
		var w = 370;
		var h = 400;
		   
		var LeftPosition=(screen.width-w)/2;		//화면의 가로
		var TopPosition=(screen.height-h)/2;		//화면의 세로
		var popOption = "width=370, height=455, resizable=no, scrollbars=no, status=no,top="+TopPosition+",left="+LeftPosition;    //팝업창 옵션(optoin)
		window.open(popUrl,"메세지보내기",popOption);

		
		
	}
	
	function cancelMessage(){
		self.close();
	}
	
	
	
</script>