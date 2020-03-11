<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
	<div class="box box-primary">
		<div class="box-header">
			<h3 class="box-title">List Board</h3>
		</div>
		<div class="row">
			<div class="col-md-4">
				<button type="button" onclick="location.href='view/qna_board_write.jsp'" class="btn btn-success">글작성</button>
			</div><!--글쓰기 버튼-->
			<div class="col-md-4 offset-md-4"><!--검색 들어갈 부분-->
				<form action="qSearch.do" name="search" method="post">
					<select name="criteria" id="">
						<option value="n"<c:out value="${search.criteria==null? 'selected':'' }"/>>-------</option>
						<option value="title" <c:out value="${search.criteria=='title'? 'selected':'' }"/>>title</option>
						<option value="content" <c:out value="${search.criteria=='content'? 'selected':'' }"/> >content</option>
						<option value="name" <c:out value="${search.criteria=='name'? 'selected':'' }"/> >name</option>
					</select>
					<input type="text" name="keyword" value="${search.keyword }"/>
					<input type="hidden" name="page" value="${pageVO.page }"/>
					<button type="button" class="btn btn-primary">검색</button>
				</form>
			</div>
		</div>
		<br>
		<table class="table table-bordered">
			<tr>
				<th class='text-center' style='width:100px'>번호</th>
				<th class='text-center'>제목</th>
				<th class='text-center'>작성자</th>
				<th class='text-center'>날짜</th>
				<th class='text-center' style='width:100px'>조회수</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			<tr><!-- 리스트 목록 보여주기 -->
				<td class='text-center'>${vo.bno}</td><!--번호-->
				<td>
					<c:if test="${vo.re_lev!=0 }">
						<c:forEach begin="0" end="${vo.re_lev*1 }">
							&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</c:if>
					<a href="qHitUpdate.do?bno=${vo.bno}&page=${pageVO.page}&criteria=${search.criteria}&keyword=${search.keyword}">${vo.title}</a></td><!--제목-->
				<td class='text-center'>${vo.name}</td><!--작성자-->
				<td class='text-center'>${vo.regdate}</td><!--날짜-->
				<td class='text-center'>${vo.readcount}<span class="badge badge-pill badge-primary"></span></td>
			</tr>		
			</c:forEach>
		</table>
		<div class="container">
			<div class="row  justify-content-md-center">
				<nav aria-label="Page navigation example">
				  <ul class="pagination"><!--하단의 페이지 나누기 부분-->
						<li class="page-item">
							<c:if test="${pageVO.page<=1}">
								<a class="page-link">이전</a>
							</c:if>
							<c:if test="${pageVO.page>1}">
							<!-- 전체 리스트 or 검색 리스트인지 여부 분류 -->
								<c:choose>
									<c:when test="${empty search.criteria }">
										<a class="page-link" href="qList.do?page=${pageVO.page -1 }">이전</a>
									</c:when>	
									<c:otherwise>
										<a class="page-link" href="qSearch.do?page=${pageVO.page -1 }&criteria=${search.criteria}&keyword=${search.keyword}">이전</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</li>
						<c:forEach begin="${pageVO.startPage }" end= "${pageVO.endPage }" var = "idx">							
							<c:choose>
								<c:when test = "${idx==pageVO.page }">
									<li class="page-item"`>
										<a class="page-link">${idx}</a>
									</li>	
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="">
											<li class="page-item">
												<a class="page-link" href="qList.do?page=${idx }">${idx}</a>
											</li>	
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="qSearch.do?page=${idx }&criteria=${search.criteria}&keyword=${search.keyword}">${idx}</a>
											</li>	
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach><!-- 여기까지가 페이지 번호 나오는 부분 -->
						<c:if test="${pageVO.page >= pageVO.totalPage }">
							<li class="page-item">
								<a class="page-link">다음</a>
							</li>
						</c:if>
						<c:if test="${pageVO.page < pageVO.totalPage }">
							<c:choose>
								<c:when test="${search.criteria==null}">
									<li class="page-item">
										<a class="page-link" href="qList.do?page=${pageVO.page + 1 }">다음</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="qSearch.do?page=${pageVO.page + 1 }&criteria=${search.criteria}&keyword=${search.keyword}">다음</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:if>
				  </ul>
				</nav>					
			</div>
		</div>
		<div style="height:20px"></div>
	</div>	
</section>
<script>
	//검색 폼의 값이 비어서 움직이지 않도록 메시지 띄워주기.
	$(function(){
		$('input[type="text"]').keydown(function(){
			if(event.keyCode === 13){
				event.preventDefault();
			};
		});
		$(".btn-primary").click(function(){
			if($("[name='<criteria></criteria>']").val()=="n"){
				alert("검색 조건이 없습니다.");
				$("[name='criteria']").focus();
				return false;
			}
			if($("[name='keyword']").val()==""){
				alert('검색어가 없습니다.');
				$("[name='keyword']").focus();
				return false;
			}
			$("form[name='search']").submit();
		})
		
	})
</script>
<%@include file="../include/footer.jsp"%>
