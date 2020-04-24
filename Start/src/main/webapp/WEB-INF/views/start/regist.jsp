<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	
	// 게시판버튼
	$("#btnBoard").click(function(){
		alert("게시판화면으로 이동합니다.");
		location.href="/start/board";
	});
	// 수정버튼
	$("#btnRegist").click(function(){
		
		// 변수에 name값체크 담기
		var hobby = $('.hobby:checked');
		var marry = $('.marry:checked');
		
		// 취미가 2개이상체크되어있다면 오류메시지 공백
		if($('.hobby:checked').length >= 2) {
			$('#hobbyHelper').text('');
		}
		
		// 벨리데이션처리 - 취미2개이상, 결혼유무선택
		if($('.hobby:checked').length < 2) {
			alert("취미는 2개이상 선택해주세요.");
			return false;
		}else if ($('.hobby:checked').length > 4) {
			alert("취미는 4개이상 선택해주세요.");
			return false;
		}else if($(':radio[name="marry"]:checked').length < 1) {
			alert("결혼 유무를 선택해주세요.");
			return false;
		}
		alert("게시글이 수정되었습니다.");
	});
	// 이전버튼
	$("#btnRead").click(function(){
		var test = $('input[name=bno]').val();
		location.href="/start/read?bno=" + test
	});
	
	// 이미지파일수정부분 //
	// 이미지 사진올리기 파일첨부
	$("#btn-file-up").on("click", function() {
    	$("#file_up").trigger("click");
    });
	
	// 이미지 올리기
    $("#file_up").change(function() {
   	 var filename = this.files[0].name;
	 //  console.log(filename);
   	 $("#img_span").val(filename);
    });
	
	// 이미지1 사진 올리기
    $("#file_up").change(function() {
   	 console.log("filename: " + this.files[0].name);
   	 var filename = this.files[0].name;
   	 
   	 url = "/ajax/fileUpload";
   	
   	 var inputFile = $("#file_up");
    	 var files = inputFile[0].files;
	 	 var formData = new FormData();
	 	 formData.append("uploadFile", files[0]);
	 	 
			 $.ajax({
				 "url" : url,
				 "contentType" : false,
				 "processData" : false,
				 "data" : formData,
				 "type" : "POST",
				 success : function(receivedData) {
					 alert("수정완료되었습니다.");
					 console.log("receivedData: " + receivedData);
					$("#file_up").attr("data-img", receivedData);
					$("#hidden_file_up").val(receivedData);
				 },
				 error : function() {
					 alert("수정되지않았습니다.");
				 }
		  }); // ajax
   	});
	
 	// 업로드 ajax
    function uploadAjax(url, inputFile, file_name, hidden_name) {
   	 
   	 var files = inputFile[0].files;
   	 var formData = new FormData();
	 //   console.log("files[0]: " + files[0]);
   	 formData.append("uploadFile", files[0]);
   	 
  		 $.ajax({
  			 "url" : url,
  			 "contentType" : false,
  			 "processData" : false,
  			 "data" : formData,
  			 "type" : "POST",
  			 success : function(receivedData) {
  				 alert("게시물이 수정되었습니다.");
  				 console.log("receivedData: " + receivedData);
  				$(file_name).attr("data-img", receivedData);
  				$(hidden_name).val(receivedData);
  			 },
  			 error : function() {
  				 alert("게시물이 수정되지않았습니다.");
  			 }
  		 }); // ajax
    }
 	
 	// 이미지2 사진 올리기
    $("#file_up1").change(function() {
   	 console.log("filename: " + this.files[0].name);
   	 var filename = this.files[0].name;
   	 
   	 url = "/ajax/fileUpload";
   	
   	 var inputFile = $("#file_up1");
    	 var files = inputFile[0].files;
	 	 var formData = new FormData();
	 	 formData.append("uploadFile", files[0]);
	 	 
			 $.ajax({
				 "url" : url,
				 "contentType" : false,
				 "processData" : false,
				 "data" : formData,
				 "type" : "POST",
				 success : function(receivedData) {
					 alert("수정완료되었습니다.");
					 console.log("receivedData: " + receivedData);
					$("#file_up1").attr("data-img", receivedData);
					$("#hidden_file_up1").val(receivedData);
				 },
				 error : function() {
					 alert("수정되지않았습니다.");
				 }
		  }); // ajax
   	});
 	
 	// 이미지2파일수정부분 //
	// 이미지 사진올리기 파일첨부
	$("#btn-file-up1").on("click", function() {
    	$("#file_up1").trigger("click");
    });
	
	// 이미지2 올리기
    $("#file_up1").change(function() {
   	 var filename = this.files[0].name;
	 //  console.log(filename);
   	 $("#img_span1").val(filename);
    });
});
</script>
</head>
<body>
<div class="container-fluid">
<div class="row text-center">
	<h1>게시글 수정</h1>
	<div class="col-md-12 text-right">
		<form role="form" method="post" action="/start/regist">
		<input type="hidden" value="${BoardVo.bno}" name="bno"/>
		<input type="submit" class="btn btn-default" id="btnRegist" value="수정하기"/>
		<input type="button" class="btn btn-default" id="btnRead" value="이전화면"/>
		<input type="button" class="btn btn-default" id="btnBoard" value="게시판"/>
			<div class="form-group text-left">
				<label for="title">
					제목
				</label>
				<input type="text" class="form-control" id="title" name="title" value="${BoardVo.title}"/>
			</div>
			<div class="form-group text-left">
				<label for="content">
					내용
				</label>
				<textarea class="form-control" id="content" name="content" rows="10" cols="50">${BoardVo.content}</textarea>
			</div>
			<div class="form-group text-left">
				<label for="writer">
					작성자
				</label>
				<input type="text" class="form-control" id="writer" name="writer" readonly="readonly" value="${BoardVo.writer}"/>
			</div>
			<div class="form-group text-left">
				<label for="regdate">
					작성일자
				</label>
				<input type="text" class="form-control" id="regdate" name="regdate" readonly="readonly" value="${BoardVo.regdate }"/>
			</div>
			<div class="form-group text-left">
				<label for="viewcnt">
					조회수
				</label>
				<input type="text" class="form-control" id="viewcnt" name="viewcnt" readonly="readonly" value="${BoardVo.viewcnt}"/>
			</div>
			<div class="form-group text-left">
				<label for="dept_code">
					부서명
				</label>
				<select class="form-control" id="dept_code" name="dept_code">
				<option></option>
					<c:forEach var="boardCom" items="${BoardComVo}">
						<c:if test="${boardCom.node == '부서명'}">
							<option value="${boardCom.name}"
								<c:if test="${boardCom.name == BoardVo.dept_code}">
								selected="selected"</c:if>>${boardCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group text-left">
				<label for="area">
					지역
				</label>
				<select class="form-control" id="area" name="area">
				<option></option>
					<c:forEach var="boardCom" items="${BoardComVo}">
						<c:if test="${boardCom.node == '지역' }">
							<option value="${boardCom.name}"
								<c:if test="${boardCom.name == BoardVo.area}">
								selected="selected"</c:if>>${boardCom.name}</option>
						</c:if>
					</c:forEach>	
				</select>
			</div>
			<div class="form-group text-left">
				<label for="gender">
					성별
				</label>
				<select class="form-control" id="gender" name="gender">
				<option></option>
					<c:forEach var="boardCom" items="${BoardComVo}">
						<c:if test="${boardCom.node == '성별'}">
							<option value="${boardCom.name }"
								<c:if test="${boardCom.name == BoardVo.gender}">
								selected="selected"</c:if>>${boardCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group text-left">
				<label for="kosa">
					KOSA
				</label>
				<select class="form-control" id="kosa" name="kosa">
				<option></option>
					<c:forEach var="boardCom" items="${BoardComVo}">
						<c:if test="${boardCom.node == 'KOSA'}">
							<option value="${boardCom.name}"
								<c:if test="${boardCom.name == BoardVo.kosa}">
								selected="selected"</c:if>>${boardCom.name}</option>
						</c:if>				
					</c:forEach>
				</select>
			</div>
			<div class="form-group text-left">
				<label for="mil_yn">
					군별유무
				</label>
				<select class="form-control" id="mil_yn" name="mil_yn">
				<option></option>
					<c:forEach var="boardCom" items="${BoardComVo}">
						<c:if test="${boardCom.node == '전역유무'}"	>
							<option value="${boardCom.name}"
								<c:if test="${boardCom.name == BoardVo.mil_yn }">
								selected="selected"</c:if>>${boardCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group text-left">
				<label for="hh">
				취미
				</label>
				<br>
				<label>
				구기종목
				</label> 
				<input type="checkbox" value="구기종목" class="hobby" name="hobby"/>
				<label>
				여행
				</label>
				<input type="checkbox" value="여행" class="hobby" name="hobby"/> 
				<label>
				독서
				</label>
				<input type="checkbox" value="독서" class="hobby" name="hobby"/>
				<label>
				음악감상
				</label>
				<input type="checkbox" value="음악감상" class="hobby" name="hobby"/> 
				<label>
				조깅
				</label>
				<input type="checkbox" value="조깅" class="hobby" name="hobby"/> 
				<label>
				요리
				</label>
				<input type="checkbox" value="요리" class="hobby" name="hobby"/> 
				<label>
				등산
				</label>
				<input type="checkbox" value="등산" class="hobby" name="hobby"/> 
				<label>
				수영
				</label>
				<input type="checkbox" value="수영" class="hobby" name="hobby"/> 
				<label>
				악기
				</label>
				<input type="checkbox" value="악기" class="hobby" name="hobby"/>  
				<input type="text" class="form-control" value="${BoardVo.hobby}" readonly="readonly"/>
				<span id="hobbyHelper"></span>
			</div>
			<div class="form-group text-left">
				<label>
				결혼유무
				</label>
				<br>
				<label>
				기혼
				</label>
				<input type="radio" name="marry" value="기혼"/>
				<label>
				미혼
				</label>
				<input type="radio" name="marry" value="미혼"/>
				<input type="text" class="form-control" value="${BoardVo.marry}" readonly="readonly"/>
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
						<input type="button" value="이미지 변경" class="btn btn-default" 
							id="btn-file-up" data-img="${BoardVo.file_up }">
						<input type="file" id="file_up" style="display:none;">
						<input type="hidden" name="file_up" id="hidden_file_up" value="${BoardVo.file_up}">
						<div><span id="img_span" style="z-index: 100000;"></span></div>  
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
						<input type="button" value="이미지 변경" class="btn btn-default" 
							id="btn-file-up1" data-img="${BoardVo.file_up1}">			
						<input type="file" id="file_up1" style="display:none;">
						<input type="hidden" name="file_up1" id="hidden_file_up1" value="${BoardVo.file_up1}">
						<div><span id="img_span1" style="z-index: 100000;"></span></div>    
					</div>	
				</div>
			</div>
		</form>
	</div>	
</div>
</div>
</body>
</html> 