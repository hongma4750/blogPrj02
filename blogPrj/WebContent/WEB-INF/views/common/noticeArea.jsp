<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="sist.co.Model.SistMessage" %>
<%@ page import="java.util.*" %>

<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<fmt:requestEncoding value="utf-8"/>
<!-- tag들 필요하면 Ctrl+c  /   Ctrl+v -->

<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 부트스트랩 링크 -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- 부트스트랩 링크 -->


<c:if test="${login.m_id ne null }">
	<div style="background-color:#EFF0F1; " id="temps">
	
	<div style="width:100%; height:10%; text-align:center;">
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" 
		aria-expanded="false" aria-controls="collapseExample" id="myCollapse">
		  메세지 접기
		</button>
	</div>
	
	<!--  페이징 -->
		<%
			String pageobj = request.getParameter("page");
			int currentpage;
			if (pageobj == null) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(pageobj);
			}
			
			List<SistMessage> plist = (List<SistMessage>)request.getAttribute("pageList");
			List<SistMessage> reList = (List<SistMessage>)session.getAttribute("allMyMessageList");
			
			int pnum;
			int pageblock = 20;
			int block = (int) Math.ceil((double) currentpage / pageblock);
			int bstartpage = (block - 1) * pageblock + 1;
			int bendpage = bstartpage + pageblock - 1;
			pnum = (int) Math.ceil((double) reList.size() / 10);
		%>
	<!--  페이징 -->
	
	<div style="width:100%; height:90%; margin:0; padding:0;" class="collapse in" id="collapseExample">

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
							<c:forEach items="${pageList }" var="myMessage"> 
						
								<c:choose>
									<c:when test="${myMessage.message_read == 1 }">
										<tr style="background-color:#BDBDBD;">
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

				
				<div align="center" style="width:100%;heigth:15%">
					
						<nav>
							<ul class="pagination">
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">처음</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="index.do?page=1">처음</a></li>
								<%
									}
								%>
			
								<%
									if (currentpage <= 1) {
								%>
								<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Previous"
									href="index.do?page=<%=currentpage - 1%>"><span
										aria-hidden="true">&laquo;</span></a></li>
								<%
									}
								%>
			
								<%
									if (bendpage > pnum) {
										bendpage = pnum;
									}
									for (int i = bstartpage; i <= bendpage; i++) {
										if (currentpage == i) {
								%>
								<li class='active'><a href="#"><%=i%></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="index.do?page=<%=i%>"><%=i%></a></li>
								<%
									}
									}
								%>
			
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">&raquo;</span></a></li>
								<%
									} else {
								%>
								<li><a style="color: black;" aria-lable="Next"
									href="index.do?page=<%=currentpage + 1%>"><span
										aria-hidden="true">&raquo;</span></a></li>
								<%
									}
								%>
								<%
									if (currentpage >= pnum) {
								%>
								<li class="disabled"><span aria-hidden="true">끝</span></li>
								<%
									} else {
								%>
								<li><a style="color: black;"
									href="index.do?page=<%=pnum%>">끝</a></li>
								<%
									}
								%>
							</ul>
						</nav>

				</div>		<%--style="width:100%;heigth:10%" --%>
		</div>		
		
	</div><%--id="temps" --%>
</c:if>





<style>
	.cursor_test {cursor: pointer;}
</style>


<script>
var checkCollapse = 1;

function deleteBtn(a){
	location.href="deleteMessage.do?message_seq="+a;
}

function detailBtn(seq){

   var popUrl = "detailMessage.do?message_seq="+seq;   //팝업창에 출력될 페이지 URL

   var w = 500;
   var h = 600;
   
   var LeftPosition=(screen.width-w)/2;		//화면의 가로
   var TopPosition=(screen.height-h)/2;		//화면의 세로

   var popOption = "width=370, height=455, resizable=no, scrollbars=no, status=no,top="+TopPosition+",left="+LeftPosition;    //팝업창 옵션(optoin)
   
      window.open(popUrl,"메세지보내기",popOption);

}


$("#myCollapse").click(function(){

	if(checkCollapse == 0){
		$('#collapseExample').show();
		$("#myCollapse").text("메세지 접기");
		checkCollapse = 1;
	}else{
		$('#collapseExample').hide();
		$("#myCollapse").text("메세지 펼치기");
		checkCollapse = 0;	
	}
});


//실시간 확인


</script>