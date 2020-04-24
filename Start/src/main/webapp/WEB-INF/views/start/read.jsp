<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글조회</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- calendar(datepicker) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	
	// 게시판버튼
	$("#btnBoard").click(function(){
		alert("게시판화면으로 이동합니다.");
		location.href="/start/board";
	});
	// 수정버튼
	$("#btnRegist").click(function(){
		alert("수정화면으로 이동합니다.");
		var test = $('input[name=bno]').val();
		location.href="/start/regist?bno=" + test; //+ "&title" + test1 (여러개넘기기)
	});
});
	// 게시글삭제버튼
	function del(bno) {	
		var delBno = confirm("삭제를 진행하시겠습니까?");
		if (delBno) {
			location.href="/start/bnoDelete?bno=" + bno;
		}else{
			return false;
		}
	}
</script>
<form id="pageForm" action="start/board" method="post">
	<input type="hidden" name="bno" value="${param.bno}"/>
</form>
</head>
<body>
<div class="condainer-fluid">
<div class="row text-center">
	<h1>게시글 조회</h1>
	<div class="col-md-12 text-right">
	<form role="form">
		<input type="hidden" value="${BoardVo.bno}" name="writer"/>
		<input type="button" class="btn btn-default" id="btnRegist" value="수정"/>
		<input type="button" class="btn btn-default" id="btnDelete" value="삭제" onclick="del(${BoardVo.bno})"/>
		<input type="button" class="btn btn-default" id="btnBoard" value="게시판"/>
			<div class="form-group text-left">
				<label for="title">
					제목
				</label>
				<input type="text" class="form-control" id="title" name="title" readonly="readonly" value="${BoardVo.title}"/>
			</div>
			<div class="form-group text-left">
				<label for="content">
					내용
				</label>
				<textarea type="text" class="form-control" id="content" name="content" 
				readonly="readonly" rows="10" cols="50">${BoardVo.content}</textarea>
			</div>
			<div class="form-group text-left">
				<label for="writer">
					작성자
				</label>
				<input type="text" class="form-control" id="writer" name="writer"
				readonly="readonly" value="${BoardVo.writer}"/>
			</div>
			<div class="form-group text-left">
				<label for="regdate">
					작성일자
				</label>
				<input type="text" class="form-control" id="regdate" name="regdate"
				readonly="readonly" value="${BoardVo.regdate}"/>
			</div>
			<div class="form-group text-left">
				<label for="viewcnt">
					조회수
				</label>
				<input type="text" class="form-control" id="viewcnt" name="viewcnt" 
				readonly="readonly" value="${BoardVo.viewcnt}"/>
			</div>
			<div class='form-group text-left'>
				<label for="dept_code">
					부서명
				</label>
				<input type="text" class="form-control" id="dept_code" name="dept_code" 
				readonly="readonly" value="${BoardVo.dept_code}"/>
			</div>
			<div class="form-group text-left">
				<label for="area">
					지역
				</label>
				<input type="text" class="form-control" id="area" name="area"
				readonly="readonly" value="${BoardVo.area}"/>
			</div>
			<div class="form-group text-left">
				<label for="gender">
					성별
				</label>
				<input type="text" class="form-control" id="gender" name="gender"
				readonly="readonly" value="${BoardVo.gender}"/>
			</div>
			<div class="form-group text-left">
				<label	for="kosa">
					KOSA
				</label>
				<input type="text" class="form-control" id="kosa" name="kosa"
				readonly="readonly" value="${BoardVo.kosa}"/>
			</div>
			<div class="form-group text-left">
				<label for="mil_yn">
					군별유무
				</label>
				<input type="text" class="form-control" id="mil_yn" name="mil_yn"
				readonly="readonly" value="${BoardVo.mil_yn}"/>
			</div>
			<div class="form-group text-left">
				<label for="hobby">
					취미
				</label>
				<input type="text" class="form-control" id="hobby" name="hobby"
				readonly="readonly" value="${BoardVo.hobby}"/>
			</div>
			<div class="form-group text-left">
				<label for="marry">
					결혼유무
				</label>
				<input type="text" class="form-control" id="marry" name="marry"
				readonly="readonly" value="${BoardVo.marry}"/>
			</div>
			<div class="col-md-12 text-left">
				<div class="col-md-3">
				<div class="col-md-3"><label for="file_up">파일1</label></div>
					<div class="col-md-9">
						<!-- 이미지 D.B담긴파일불러오기 -->
						<c:choose>
							<c:when test="${BoardVo.file_up == null}">
								<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
							</c:when>
							<c:otherwise>
								<img alt="basic-img" src="/ajax/display?fileName=${BoardVo.file_up}" style="height: 200px;"><br>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-3">
				<div class="col-md-3"><label for="file_up1">파일2</label></div>
					<div class="col-md-9">
						<!-- 이미지 D.B담긴파일불러오기 -->	
						<c:choose>
							<c:when test="${BoardVo.file_up1 == null}">
								<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
							</c:when>
							<c:otherwise>
								<img alt="basic-img" src="/ajax/display?fileName=${BoardVo.file_up1}" style="height: 200px;"><br>
							</c:otherwise>
						</c:choose>     
					</div>	
				</div>
			</div>
	</form>
	</div> 
</div>
</div>
</body>
</html> 