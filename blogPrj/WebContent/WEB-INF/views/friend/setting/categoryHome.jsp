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


<div style="width:90%; height:100%; margin:10px; padding:10px;">

	<div style="width:100%; height:100%; text-align:left;">
		<h2>카테고리 설정</h2>
		
		<hr>
	
		<div style="width:100%; height:100%; background-color:red;">
		
			<!-- 카테고리 리스트 -->
			<div style="width:40%; height:100%; display:inline-block; float:left;">
			
			<jsp:useBean id="ubbs" class="sist.co.help.arrowHelp"/>
			
				<ul >
					<c:forEach items="${blogCategoryList }" var="blogCate">
					<jsp:setProperty property="depth" name="ubbs" value="${blogCate.ca_depth }"/>
					
						<li><jsp:getProperty property="arrow" name="ubbs"/>${blogCate.ca_name }</li>
					</c:forEach>
					
				</ul>
			</div>
			<!-- 카테고리 리스트 -->
			
			
			
			
			<div style="width:60%; height:100%; display:inline-block; float:left;">
				
				
				<!-- 입력 -->
				<div class="row cursor_test" style="margin:auto; padding:auto; text-align:center;" onclick="printInsert()">
					<p class="bg-success">카테고리 추가</p>
				</div>
				
				
				<form action="insertCategory.do" id="insertForm" action="post">
				<div id="insertCategory" style="display:none" >
				
				
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">카테고리명</label>
						<input type="text" class="col-md-8" name="ca_name" id="insert_ca_name">
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">공개설정</label>
						
						<input type="radio" name="ca_hidden" value="0" checked>공개
						<input type="radio" name="ca_hidden" value="1">비공개
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">주제분류</label>
						
						<select class="col-md-8 orm-control" >
							<option>스포츠</option>
							<option>영화</option>
							<option>기타</option>
						</select>
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">글보기</label>
						
						<input type="radio" name="ca_view_type" value="0" checked>블로그형
						<input type="radio" name="ca_view_type" value="1">앨범형
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">부모 카테고리</label>
						
						<select class="col-md-8 orm-control" name="ca_parent">
							<option value="0" selected>없음</option>
							
							<c:forEach items="${blogCategoryList }" var="blogCate">
								<c:if test="${blogCate.ca_depth eq 0 }">
									<option value="${blogCate.ca_seq }">${blogCate.ca_name }</option>
								 </c:if> 
							</c:forEach>
							
						</select>
					</div>
					
					<div class="row" style="margin:auto; padding:auto; text-align:center;">
						<input type="submit" value="저장" onclick="return go_submit(1)">
					</div>
					
					
				</div>		<!-- id="insertCategory" style="display:none" -->
				</form>
				<!-- 입력 -->
				
				
				
				<!-- 수정 -->
				<div class="row cursor_test" style="margin:auto; padding:auto; text-align:center;" onclick="printUpdate()">
					<p class="bg-info">카테고리 수정</p>
				</div>
				
				<form action="ex.do" id="updateForm" method="post">
				<div id="updateCategory" style="display:none"><!--  -->
					
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">카테고리 선택</label>
						
						<select class="col-md-8 orm-control" >
							<option>aaa카테고리</option>
							<option>bbb카테고리</option>
							<option>ccc카테고리</option>
						</select>
					</div>
					
				
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">카테고리명</label>
						<input type="text" class="col-md-8">
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">공개설정</label>
						
						<input type="radio" name="option" checked>공개
						<input type="radio" name="option">비공개
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">주제분류</label>
						
						<select class="col-md-8 orm-control" >
							<option>스포츠</option>
							<option>영화</option>
							<option>기타</option>
						</select>
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">글보기</label>
						
						<input type="radio" name="option1" checked>블로그형
						<input type="radio" name="option1">앨범형
					</div>
					
					<div class="row" style="margin:auto; padding:auto;">
						<label class="col-md-4">부모 카테고리</label>
						
						<select class="col-md-8 orm-control" >
							<option selected>없음</option>
							<option>aa카테고리</option>
							<option>bb카테고리</option>
						</select>
					</div>
					
					<div class="row" style="margin:auto; padding:auto; text-align:center;">
						<input type="submit" value="저장" onclick="return go_submit(2)">
					</div>
					
					
				</div>
				</form>
				<!-- 수정 -->
				
				<!-- 삭제 -->
				<div class="row cursor_test" style="margin:auto; padding:auto; text-align:center;" onclick="printDelete()">
					<p class="bg-danger">카테고리 삭제</p>
				</div>
				
				<form action="deleteCategory.do" id="deleteForm" method="post">
					<div id="deleteCategory" style="display:none"><!--  -->
						
						<div class="row" style="margin:auto; padding:auto;">
							<label class="col-md-4">카테고리 선택</label>
							
							<select class="col-md-8 orm-control" name="ca_seq">
								<c:forEach items="${blogCategoryList }" var="blogCate">
									<option value="${blogCate.ca_seq }">${blogCate.ca_name }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="row" style="margin:auto; padding:auto; text-align:center;">
							<input type="submit" value="삭제" onclick="return go_submit(3)">
						</div>
					
					
					</div>
				</form>
				
				
				<!-- 삭제 -->


				
			</div>	
		</div>
		
	</div>
</div>


<style>
	.cursor_test {cursor: pointer;}
</style>



<script>
function go_submit(a){
	
	if(a == 1 ){
		if($("#id=insert_ca_name").val()==0){
			alert("카테고리명을 입력해주세요");
			return false;
		}
	}else if(a==3){
		if(confirm("정말 삭제 하시겠습니까?") != true){
			return false;
		}
		
	}
	
	
	return true;
}
var checkprintInsert = true;
var checkprintUpdate = true;
var checkprintDelete = true;

	function printInsert(){
		if(checkprintInsert){
			$("#insertCategory").show();
			$("#updateCategory").hide();
			$("#deleteCategory").hide();
			checkprintInsert = false;
		}else{
			$("#insertCategory").hide();
			checkprintInsert =true;
		}
	}
	
	function printUpdate(){
		if(checkprintUpdate){
			$("#updateCategory").show();
			$("#insertCategory").hide();
			$("#deleteCategory").hide();
			checkprintUpdate = false;
		}else{
			$("#updateCategory").hide();
			checkprintUpdate = true;
		}
	}
	
	function printDelete(){
		if(checkprintDelete){
			$("#deleteCategory").show();
			$("#insertCategory").hide();
			$("#updateCategory").hide();
			checkprintDelete = false;
		}else{
			$("#deleteCategory").hide();
			checkprintDelete = true;
		}
	}
</script>
