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

	<!-- 페이징 -->
<style type="text/css">
	#paging{text-align:center;}
	a.paging-item,a.paging-side{margin:0 .25em;}
	a.paging-item.selected{font-weight:bold;}
</style>
<script type="text/javascript" src="js/paging.js"></script>





<div style="width:100%; height:85%;">
				<table class="table table-condensed">
					<col style="width:75px">
					<col style="width:auto;">
					<col style="width:50px">
					<tr><td>보낸사람</td><td>내용</td><td>삭제</td></tr>
					
					<c:choose>
						<c:when test="${allMyMessageList eq null }">
							<tr style="background-color:#BDBDBD;"><td colspan="3">받은 쪽지가 없습니다.</td></tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach items="${pageList }" var="myMessage" varStatus = "varstat"> 
						
								<c:choose>
									<c:when test="${myMessage.message_read == 1 }">
										<tr style="background-color:#BDBDBD;">
											<td><span class="message_name">${myMessage.m_name }</span></td>
											
											<td onclick="detailBtn('${myMessage.message_seq}')" class="cursor_test">
												<c:if test="${fn:length(myMessage.message_content)>8 }">
													<span class="message${varstat.index}">${fn:substring(myMessage.message_content,0,7)}...</span>
												</c:if>
												
												<c:if test="${fn:length(myMessage.message_content) <8 }">
													<span class="message${varstat.index}">${myMessage.message_content }</span>
												</c:if>
											</td>
											
											<td>
												<button type="button" onclick="deleteBtn('${myMessage.message_seq}')" id="btnClose" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true" id="spanClose">&times;</span>
												</button >
											</td>
										</tr>
									</c:when>
									
									<c:otherwise>
										<tr>
											<td>${myMessage.m_name }</td>
											
											<td onclick="detailBtn('${myMessage.message_seq}')" class="cursor_test">
												<c:if test="${fn:length(myMessage.message_content)>8 }">
													<span class="message">${fn:substring(myMessage.message_content,0,7)}...</span>
												</c:if>
												
												<c:if test="${fn:length(myMessage.message_content) <8 }">
													<span class="message">${myMessage.message_content }</span>
												</c:if>
											</td>
											
											<td>
												<button type="button" onclick="deleteBtn('${myMessage.message_seq}')" id="btnClose" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true" id="spanClose">&times;</span>
												</button >
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
								
								</c:forEach>
						</c:otherwise>
					</c:choose>
					
						
						
					</table>
				</div>		<%--width:100%; height:90%;" --%>

<div id="paging"></div>

<script type="text/javascript">

$('#paging').paging({
	current:1,max:100,
	onclick:function(e,page){
		
		$.ajax({
			type:"POST",
			url:"paging.do",
			data:"page="+page,
			success:function(pageMessageList){
				printMessage(pageMessageList);
			}
			
		});
	}
});

function printMessage(pageMessageList){
	var messageList = pageMessageList;
	
	for(var j =0;j<messageList.length;j++){
		 $(".message_name").html(messageList[j].message_seq);
		 
		 $(".message"+j).html(messageList[j].message_receiver);
		 
		 alert($(".message1").val());
		
		//alert("확인 : "+messageList[j].m_name);
	}
}


</script>
		




