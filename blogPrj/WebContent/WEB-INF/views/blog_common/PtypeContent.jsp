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

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/blog_pic.css"/>
<!-- css  -->



<div class="pcon">
	<div class="pic_view">
		<a href="#none" class ="pview1" title="pic"><strong>앨범형&nbsp;&nbsp;(8)</strong></a>
		<a href="#none" class ="pview2" title="listopen2"><strong>목록열기</strong></a>
	</div>

	<div class="piccon">
		<table>
			<tr>
				<td>
					<dl>
						<dd>
							<p class="list_img"><img src="image/55.png"></p>
							<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 10시 46분에 저장한 글입니다.</a></p>
							<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
				
				<td>
					<dl>
						<dd>
						<p class="list_img"><img src="image/4.jpg"></p>
						<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 10시 38분에 저장한 글입니다.</a></p>
						<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
				
				<td>
					<dl>
						<dd>
							<p class="list_img"><img src="image/22.png"></p>
							<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 10시37분에 저장한 글입니다.</a></p></p>
							<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>	
				</td>
				
				<td>
					<dl>
						<dd>
						<p class="list_img"><img src="image/33.png"></p>
						<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 9시 32분에 저장한 글입니다.</a></p>
						<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
			</tr>
			
			
		<!-- 한줄 끝 -->	
			<tr>
				<td>
					<dl>
						<dd>
							<p class="list_img"><img src="image/2.jpg"></p>
							<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 9시 30분에 저장한 글입니다.</a></p>
							<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
				
				<td>
					<dl>
						<dd>
							<p class="list_img"><img src="image/11.jpg"></p>
							<p class="list_txt"><a href="PbbsDetail.do">아 졸려</a></p>
							<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
				
				<td>	
					<dl>
						<dd>
							<p class="list_img"><img src="image/3.jpg"></p>
							<p class="list_txt"><a href="PbbsDetail.do">2016년 9월 7일 오전 9시 02분에 저장한 글입니다.</a></p>
							<p class="list_date">2016.09.07.</p>	
						</dd>
					</dl>
				</td>
				
				<td>
					<dl>
						<dd>
							<p class="list_img"><img src="image/5.jpg"></p>
							<p class="list_txt"><a href="PbbsDetail.do">아 진짜 졸리다</a></p>
							<p class="list_date">2016.09.07.</p>
						</dd>
					</dl>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="paginglist">
		<nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
	</div>

</div>
