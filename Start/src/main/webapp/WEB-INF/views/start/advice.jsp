<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전달사항수정</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	
	// 수정버튼
	$("#btnAdvice").click(function(){
		
		// 처리할변수지정
		var hobby = $('.hobby:checked');
		var mm = $('.mm:checked');
		
		// 취미가 2개이상체크되어있다면 오류메시지 공백
		if($('.hobby:checked').length >= 2) {
			$('#hobbyHelper').text('');
		}
		
		// 벨리데이션처리 - 취미2개이상, 결혼유무 선택
		if($('.hobby:checked').length < 2){
			alert("취미는 2개이상 선택해주세요.");
			return false;
		}else if ($('.hobby:checked').length > 4){
			alert("취미는 4개이상 선택해주세요.");
			return false;
		}else if ($(':radio[name="mm"]:checked').length < 1) {
			alert("결혼 유무를 선택해주세요.");
			return false;
		}
		alert("수정이 완료되었습니다.");
		alert("공지화면으로 이동합니다.");
	});
	// 이전버튼
	$("#btnView").click(function(){
		alert("이전화면으로 이동합니다.");
		var test = $('input[name=nn]').val();
		location.href="/start/view?nn=" + test
	});
	// 공지화면버튼
	$("#btnService").click(function(){
		alert("공지화면으로 이동합니다.");
		location.href="/start/service";
	});
	
///////////////////////////////////////////////////////////////////////////////////(파일첨부2) - start
	// 이미지2 사진올리기 파일첨부
	$("#btn-file-up1").on("click", function() {
		$("#ff1").trigger("click");
	});
	// 이미지2 올리기
	$("#ff1").change(function(){
		var filename = this.files[0].name;
		console.log(filename);
		$("#img_span1").val(filename);
	});
	// 이미지2 사진 올리기
	$("#ff1").change(function(){
	console.log("filename:" + this.files[0].name);
	var filename = this.files[0].name;
	
	url = "/ajax/fileUpload";
	
	var inputFile = $("#ff1");
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
					$("#ff1").attr("data-img", receivedData);
					$("#hidden_file_up1").val(receivedData);
			 },
			 error : function() {
				 alert("수정되지않았습니다.");
			 }
	  	}); // ajax
	});
///////////////////////////////////////////////////////////////////////////////////(파일첨부2) - end
	
	
///////////////////////////////////////////////////////////////////////////////////(파일첨부1) - start	
	// 이미지파일수정부분 //
	// 이미지1 사진올리기 파일첨부
	$("#btn-file-up").on("click", function() {
    	$("#ff").trigger("click");
    });
	
	// 이미지1 올리기
    $("#ff").change(function() {
   	 var filename = this.files[0].name;
	 //  console.log(filename);
   	 $("#img_span").val(filename);
    });
	
	// 이미지1 사진 올리기
    $("#ff").change(function() {
   	 console.log("filename: " + this.files[0].name);
   	 var filename = this.files[0].name;
   	 
   	 url = "/ajax/fileUpload";
   	
   	 var inputFile = $("#ff");
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
					$("#ff").attr("data-img", receivedData);
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
});
</script>
</head>
<body>
<div class="container-fluid">
<div class="row text-center">
	<form role="form" method="post" action="/start/advice">
	<br>
	<h1>전달사항 수정</h1>
	<br>
	<br>
	<div class="col-md-12 text-center">
		<input type="hidden" name="nn" value="${NoticeVo.nn}"/> <!-- 수정에서 조회폼으로 이동하기위한 advice param값 -->
		<input type="submit" class="btn btn-primary" id="btnAdvice" value="수정"/>
		&nbsp;
		<input type="button" class="btn btn-primary" id="btnView" value="이전"/>
		&nbsp;
		<input type="button" class="btn btn-primary" id="btnService" value="공지화면"/>
		<div class="form-group text-left">
			<label for="tt">
			제목
			</label>
			<input type="text" class="form-control" id="tt" name="tt" value="${NoticeVo.tt}"/>
		</div>
		<div class="form-group text-left">
			<label for="cc">
			내용
			</label>
			<textarea type="text" class="form-control" id="cc" name="cc" rows="10" cols="50">${NoticeVo.cc}</textarea>
		</div>
		<div class="form-group text-left">
			<label for="ww">
			작성자
			</label>
			<input type="text" class="form-control" id="ww" name="ww" value="${NoticeVo.ww}"/>
		</div>
		<div class="form-group text-left">
			<label for="dd">
			부서명
			</label>
			<select class="form-control" id="dd" name="dd">
			<option></option>
				<c:forEach var="noticeCom" items="${NoticeComVo}">
					<c:if test="${noticeCom.note == '부서명' }">
						<option value="${noticeCom.name}"
							<c:if test="${noticeCom.name == NoticeVo.dd }">
							selected="selected"</c:if>>${noticeCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="form-group text-left">
			<label for="aa">
			지역
			</label>
			<select class="form-control" id="aa", name="aa">
			<option></option>
				<c:forEach var="noticeCom" items="${NoticeComVo}">
					<c:if test="${noticeCom.note == '지역' }">
						<option value="${noticeCom.name }"
							<c:if test="${noticeCom.name == NoticeVo.aa }">
							selected="selected"</c:if>>${noticeCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="form-group text-left">
			<label for="gg">
			성별
			</label>
			<select class="form-control" id="gg" name="gg">
			<option></option>
				<c:forEach var="noticeCom" items="${NoticeComVo}">
					<c:if test="${noticeCom.note == '성별' }">
						<option value="${noticeCom.name}"
						<c:if test="${noticeCom.name == NoticeVo.gg }">
						selected="selected"</c:if>>${noticeCom.name}</option>
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
			<input type="checkbox" value="구기종목" class="hobby" name="hh"/>
			<label>
			여행
			</label>
			<input type="checkbox" value="여행" class="hobby" name="hh"/> 
			<label>
			독서
			</label>
			<input type="checkbox" value="독서" class="hobby" name="hh"/>
			<label>
			음악감상
			</label>
			<input type="checkbox" value="음악감상" class="hobby" name="hh"/> 
			<label>
			조깅
			</label>
			<input type="checkbox" value="조깅" class="hobby" name="hh"/> 
			<label>
			요리
			</label>
			<input type="checkbox" value="요리" class="hobby" name="hh"/> 
			<label>
			등산
			</label>
			<input type="checkbox" value="등산" class="hobby" name="hh"/> 
			<label>
			수영
			</label>
			<input type="checkbox" value="수영" class="hobby" name="hh"/> 
			<label>
			악기
			</label>
			<input type="checkbox" value="악기" class="hobby" name="hh"/>  
			<input type="text" class="form-control" value="${NoticeVo.hh}" readonly="readonly"/>
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
			<input type="radio" name="mm" value="기혼"/>
			<label>
			미혼
			</label>
			<input type="radio" name="mm" value="미혼"/>
			<input type="text" class="form-control" value="${NoticeVo.mm}" readonly="readonly"/>
		</div>
		<div class="col-md-12 text-left">
		<div class="col-md-3">
		<div class="col-md-3"><label>파일첨부1</label></div>
			<div class="col-md-9">
				<!-- 이미지 D.B담긴파일불러오기 -->
				<c:choose>
					<c:when test="${NoticeVo.ff == null}">
						<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
					</c:when>
					<c:otherwise>
						<img alt="basic-img" src="/ajax/display?fileName=${NoticeVo.ff}" style="height: 200px;"><br>
					</c:otherwise>
				</c:choose>
					<input type="button" value="이미지 변경" class="btn btn-default" 
						id="btn-file-up" data-img="${NoticeVo.ff}">
					<input type="file" id="ff" style="display:none;">
					<input type="hidden" name="ff" id="hidden_file_up" value="${NoticeVo.ff}">
				<div><span id="img_span" style="z-index: 100000;"></span></div>  
			</div>
		</div>
		</div>
		&nbsp;
		<div class="col-md-12 text-left">
		<div class="col-md-3">
		<div class="col-md-3"><label>파일첨부2</label></div>
			<div class="col-md-9">
				<!-- 이미지 D.B담긴파일불러오기 -->
				<c:choose>
					<c:when test="${NoticeVo.ff1 == null}">
						<img alt="basic-img" src="/resources/file_no.jpg" style="height: 200px;"><br>
					</c:when>
					<c:otherwise>
						<img alt="basic-img" src="/ajax/display?fileName=${NoticeVo.ff1}" style="height: 200px;"><br>
					</c:otherwise>
				</c:choose>
					<input type="button" value="이미지 변경" class="btn btn-default"
						id="btn-file-up1" data-img="${NoticeVo.ff1}">
					<input type="file" id="ff1" style="display:none;">
					<input type="hidden" name="ff1" id="hidden_file_up1" value="${NoticeVo.ff1}">
				<div><sapn id="img_span1" style="z-index: 100000;"></sapn></div>
			</div>
		</div>
	</div>
	</form>
</div>
</div>

</body>
</html> 