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
			<h3 class="box-title">Board Write</h3>
		</div>
		<div style="height:20px"></div>
		<form action="../qWrite.do" id="writeForm" method="post" role="form" enctype= "multipart/form-data">
			<div class="box-body">
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
					<input type="text" id="name" name="name" size="10" class="form-control" maxlength='10'>
					</div>
				</div>
				<div class="form-group row">
					<label for="title"  class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
					<input type="text" id="title" name="title" size="50" class="form-control"
					maxlength='100' required>
					</div>
				</div>
				<div class="form-group row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
					<textarea name='content' id="content" cols='60' class="form-control" rows='15'></textarea>
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
						<input type="file" name="file" id="file">
						<small class="text-muted" id="file">(파일크기 : 2MB)</small>
					</div>
				</div>
				<div style="height:20px"></div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
					<button type="button" class="btn btn-warning" id="list" onclick="location.href='../qList.do'">목록보기</button>
				</div>
				<div style="height:20px"></div>
			</div>
		</form>
	</div><!-- /.box -->
</section>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>
<script src="../js/writervalidation.js"></script>
<%@include file="../include/footer.jsp"%>






