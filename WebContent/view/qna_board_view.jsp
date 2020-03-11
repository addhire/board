<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
	<div class="box box-primary">
		<div class="box-header">
			<h3 class="box-title">Read Board</h3>
		</div>
		<div style="height:20px"></div>
		<form action="" method="post" role="form">
			<div class="box-body">
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">글쓴이</label>
					<div class="col-sm-10">
						<input type="text" name="name" size="10" class="form-control" maxlength='10' value='${vo.name}' readonly>
					</div>
				</div>
				<div class="form-group  row">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" name="title" size="50" class="form-control"	maxlength='100' value='${vo.title}' readonly>
					</div>
				</div>
				<div class="form-group  row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea name='board_content' cols='60' class="form-control" rows='15' readonly>${vo.content}</textarea>
					</div>
				</div>
				<div class="form-group  row">
					<label for="filename" class="col-sm-2 col-form-label">파일첨부</label>
					<div class="col-sm-10">
					<c:if test="${empty vo.attach}">
						첨부파일 없음
					</c:if>
					
					<c:if test="${!empty vo.attach}"> <!-- 이거 안해도 되긴했었음. 메모. -->
					
					
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
				<div style="height:10px"></div>
				<div class="box-footer text-center">
					<button type="button" class="btn btn-success" id="reply">답변</button>
					<button type="button" class="btn btn-warning" id="modify">수정</button>
					<button type="button" class="btn btn-danger" id="delete">삭제</button>
					<button type="button" class="btn btn-primary" id="list" onclick="location.href='qList.do'">목록보기</button>
				</div>
				<div style="height:20px"></div>
			</div>
		</form>
	</div>
</section>
<!-- 버튼 클릭 시 같이 전송할 폼 -->
<form action="" method="post" role="form">   <!-- 보낼게 많아서 폼으로! -->
	<input type="hidden" name="bno" value="${vo.bno }" />
	<input type="hidden" name="page" value="<%=request.getParameter("page") %>" />
	<input type="hidden" name="criteria" value="${search.criteria}" />
	<input type="hidden" name="keyword" value="${search.keyword }" />
	
	
</form>

<script>
$(function(){
	
	//form 가져오기
	let formObj = $("form[role='form']");
	
	$("#list").click(function(){
		// formObj.attr("action","qList.do");
		let criteria = $("input[name='criteria']").val();
		if(criteria === ''){
			formObj.attr("action", "qList.do");
		}else{
			formObj.attr("action", "qSearch.do");
		}
		
		formObj.submit();
	})
	$("#modify").click(function(){
		//form action 지정하기
		formObj.attr("action","qModify.do");
		formObj.submit();
		/* location.href="qModify.do"; 이제 여기로 움직일 필요 없다.*/
	})
	$("#reply").click(function(){
		formObj.attr("action", "qReplyView.do");
		formObj.submit();
	})
	$("#delete").click(function(){
		formObj.attr("action", "view/qna_board_pwdCheck.jsp");
		formObj.submit();
	})	
})


</script>
<%@include file="../include/footer.jsp"%>
