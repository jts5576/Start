<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전달사항조회</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- calendar(datepicker) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
$(document).ready(function(){
	
	// 이전버튼
	$("#btnService").click(function(){
		alert("이전화면으로 이동합니다.");
		location.href="/start/service";
	});
	// 수정버튼
	$("#btnAdvice").click(function(){
		alert("수정화면으로 이동합니다.");
		var test = $('input[name=nn]').val();
		location.href="/start/advice?nn=" + test;  //+ "&title" + test1 (여러개넘기기)
	});
});
	// 전달사항 글삭제
	function del(nn) {
		var delNn = confirm("삭제를 진행하시게습니까?");
		if(delNn) {
			location.href="/start/nnDelete?nn=" + nn;
		}else{
			return false;
		}
		alert("삭제가 완료되었습니다.");
	}
</script>
<form action="start/service" method="post">
	<input type="hidden" name="nn" value="${param.nn}"/> <!-- 조회에서 수정폼으로 이동하기위한 advice param지정 -->
</form>
</head>
<body>
<div class="container-fluid">
<div class="row text-center">
	<form role="form">
	<br>
	<h1>전달사항 조회</h1>
	<br>
	<br>
	<div class="col-md-12 text-center">
		<input type="button" class="btn btn-primary" id="btnService" value="이전"/>
		&nbsp;
		<input type="button" class="btn btn-primary" id="btnAdvice" value="수정"/>
		&nbsp;
		<input type="button" class="btn btn-primary" id="btnDelete" onclick="del(${NoticeVo.nn})"  value="삭제"/>
		<div class="form-group text-left">
			<label for="tt">
			제목
			</label>
			<input type="text" class="form-control" id="tt" name="tt" readonly="readonly" value="${NoticeVo.tt}"/>
		</div>
		<div class="form-group text-left">
			<label for="cc">
			내용
			</label>
			<textarea class="form-control" id="cc", name="cc" readonly="readonly" rerows="10" cols="50">${NoticeVo.cc}</textarea>
		</div>
		<div class="form-group text-left">
			<label for="ww">
			작성자
			</label>
			<input type="text" class="form-control" id="ww" name="ww" readonly="readonly" value="${NoticeVo.ww}"/>
		</div>
		<div class="form-group text-left">
			<label for="dd">
			부서명
			</label>
			<input type="text" class="form-control" id="dd" name="dd" readonly="readonly" value="${NoticeVo.dd}"/>
		</div>
		<div class="form-group text-left">
			<label>
			지역
			</label>
			<input type="text" class="form-control" id="aa" name="aa" readonly="readonly" value="${NoticeVo.aa}"/>
		</div>
		<div class="form-group text-left">
			<label>
			성별
			</label>
			<input type="text" class="form-control" id="gg" name="gg" readonly="readonly" value="${NoticeVo.gg}"/>
		</div>
		<div class="form-group text-left">
			<label>
			취미
			</label>
			<input type="text" class="form-control" id="hh" name="hh" readonly="readonly" value="${NoticeVo.hh}"/>
		</div>
		<div class="form-group text-left">
			<label>
			결혼유무
			</label>
			<input type="text" class="form-control" id="mm" name="mm" readonly="readonly" value="${NoticeVo.mm}"/>
		</div>
		<div class="col-md-12 text-left">
		<div class="col-md-3">
		<div class="col-md-3"><label>첨부파일1</label></div>
			<div class="col-md-9">
				<!-- 이미지담기기 -->
				<c:choose>
					<c:when test="${NoticeVo.ff == null}">
						<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
					</c:when>
					<c:otherwise>
						<img alt="basic-img" src="/ajax/display?fileName=${NoticeVo.ff}" style="height: 200px;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</div>
		&nbsp;
		&nbsp;
		<div class="col-md-12 text-left">
		<div class="col-md-3">
		<div class="col-md-3"><label>첨부파일2</label></div>
			<div class="col-md-9">
				<!--  이미지담기기 -->
				<c:choose>
					<c:when test="${NoticeVo.ff1 == null }">
						<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
					</c:when>
					<c:otherwise>
						<img alt="basic-img" src="/ajax/display?fileName=${NoticeVo.ff1}" style="height: 200px;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</div>
	</div>
	</form>
</div>
</div>
</body>
</html> 