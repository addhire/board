<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
	.text-info{
	
		color: red;
		font-size: 0.8rem;
	}
	span.error{
		color: red;
		font-size: 0.8rem;
	}
</style>
<!-- Main content -->
<section class="content">
	<div class="box box-primary">
		<div class="box-header">
			<h3 class="box-title">Board Modify</h3>
		</div>
		<div style="height:20px"></div>
		<form action="qUpdate.do" method="post" enctype="multipart/form-data" role="form" id="writeForm">
			<div class="box-body">			    <!-- 파일 첨부가 들어 올수도 있으므로. -->
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">글쓴이</label>
					<div class="col-sm-10" >
					<input type="text" id="name" name="name" size="10" class="form-control"	maxlength='10' value="${vo.name }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" id="title" name="title" size="50" class="form-control"	maxlength='100' value="${vo.title }">
					</div>
				</div>
				<div class="form-group row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea id="content" name='content' cols='60' class="form-control" rows='15'>${vo.content }</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" id="password" name="password" class="form-control" size="10" maxlength='10'>
					</div>
				</div>
				<div class="form-group row">
					<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
					<div class="col-sm-10">
					
					<c:if test="${empty vo.attach}">
						<input type="file" id="file" name="file"/>
						<small class="text-muted" id="file">(파일크기 : 2MB / *** 여기는 수정페이지오.)</small>
					</c:if>
					
					<c:if test="${!empty vo.attach}">
						<!-- 현재 페이지에서 사용할 변수 설정 -->
					<c:set value="${vo.attach} " var="attach"></c:set>
					<%
						//vo.attach로 가져오는 값에서 파일명만 보여주기
						String attach = (String)pageContext.getAttribute("attach");
						int start = attach.indexOf("_");
						pageContext.setAttribute("attach", attach.substring(start+1));
					
					%>
						<a href="view/download.jsp?fileName=${vo.attach }">${attach}</a>
						
						
					</c:if>
					</div>
				</div>
				<div style="height:20px"></div>
				<div class="box-footer text-center">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger" onclick="location.href='qList.do'">취소</button>
					
				</div>
				<div style="height:20px"></div>
			</div>
			<input type="hidden" name="bno" value="${vo.bno }" />
			<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
			<input type="hidden" name="criteria" value="${search.criteria}" />
			<input type="hidden" name="keyword" value="${search.keyword }" />
		</form>
	</div>
</section>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>
<script src="js/writervalidation.js"></script>

<%@include file="../include/footer.jsp"%>








