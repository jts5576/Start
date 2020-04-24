<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
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
		alert("게시판화면으로 이동합니다.")
		location.href="/start/board";
	});
	// 등록버튼시 - 벨리데이션기능
	$("#btnWrite").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
		var dept_code = $("#dept_code").val();
		var area = $("#area").val();
		var gender = $("#gender").val();
		var kosa = $("#kosa").val();
		var mil_yn = $("#mil_yn").val();
		var hobby = $('.hobby:checked');
		var marry = $('.marry:checked');
		
		// 취미가 2개이상 체크되어있다면 오류메시지 공백
		if($('.hobby:checked').length >=2 ){ 
			$('.hobbyHelper').text('');
		}
		
		if(title == '' || title == null){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}else if(content == '' || content == null){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}else if(writer == '' || writer == null){
			alert("작성자명을 입력해주세요.");
			$("#writer").focus();
			return false;
		}else if(dept_code == '' || dept_code == null){
			alert("부서명을 선택해주세요.");
			$("#dept_code").focus();
			return false;
		}else if(area == '' || area == null){
			alert("지역을 선택해주세요.");
			$("#area").focus();
			return false;
		}else if(gender == '' || gender == null){
			alert("성별을 선택해주세요.");
			$("#gender").focus();
			return false;
		}else if(kosa == '' || kosa == null){
			alert("KOSA를 선택해주세요.");
			$("#kosa").focus();
			return false;
		}else if(mil_yn == '' || mil_yn == null){
			alert("전역유무를 선택해주세요.")
			$("#mil_yn").focus();
			return false;
		}else if ($('.hobby:checked').length < 2) {
			alert("취미는 2개이상 선택해주세요.");
			return false;
		}else if ($('.hobby:checked').length > 4) {
			alert("취미는 4개이상 선택해주세요.");
			return false;
		}else if ($(':radio[name="marry"]:checked').length < 1) {
			alert("결혼 유무를 선택해주세요.");
			return false;
		}
		alert("게시글이 저장되었습니다.");
	});
	
	// insert 파일첨부1등록 업로드(trigger)
 	$("#btn-upload-file").on("click", function(){
 		$("#upload_file").trigger("click");	
 	});	  
	// 파일첨부1 등록시 input작업
    $("#upload-file").change(function(e) {
   	 console.log(this.files[0].name);
   	 var filename = this.files[0].name;
   	 $("#file_up").val(filename);
    });
 	// 파일첨부1 업로드
    $("#upload_file").change(function() {
   	 var filename = this.files[0].name;
   	 console.log(filename);
   	 $("#file_up").val(filename);
   	 
   	// 파일첨부 // 
   	// 파일첨부1 미리보기 작업
    $("#modal_file_up").click(function() {
       var file_name = $("#modal_file_up").attr("data-img");
       var url = "/ajax/display?fileName=" + file_name;
     	 console.log("file_name: " + file_name);
       var div = "";
     	   div += "<div id='div_img'>";
     	   div += "<img src='/ajax/display?fileName=" + file_name + "' style='width:550px;'>";
     	   div += "</div>";
       $("#modal_body").append(div);
    });
   	
    // 파일첨부1 업로드
    $("#upload_file").change(function() {
   	 var filename = this.files[0].name;
   	 console.log(filename);
   	 $("#file_up").val(filename);
   	 
   	var inputFile = $("#upload_file");
   	
   	url = "/ajax/fileUpload";
   	
   	var file_name = "#modal_file_up";
   	var hidden_name = "#hidden_file_up";
   	
   	uploadAjax(url, inputFile, file_name, hidden_name); 
    });
   
    // 파일첨부1 모달창 띄우기 이미지
    $("#modal_file_up").click(function() {
        $("#btn_modal").trigger("click");
    });
    
  	// 파일첨부1, 파일첨부2 modal body 클리어
    $("#btn_modal_close").click(function() {
     	 $("#div_img").remove();
    }); 
   	$("#modal_close").click(function(){
   		$("#div_img").remove();
   	});
   	 
   	var inputFile = $("#upload_file");
   	
   	url = "/ajax/fileUpload";
   	
   	var file_name = "#modal_file_up";
   	var hidden_name = "#hidden_file_up";
   	
   	uploadAjax(url, inputFile, file_name, hidden_name); 
    });
 	
 	// 파일첨부1, 파일첨부2 upload(ajax)
    function uploadAjax(url, inputFile, file_name, hidden_name) {
   	 
   	 var files = inputFile[0].files;
   	 var formData = new FormData();
   	 
   	 console.log("files[0]: " + files[0]);
   	 formData.append("uploadFile", files[0]);
   	 
  		 $.ajax({
  			 "url" : url,
  			 "contentType" : false,
  			 "processData" : false,
  			 "data" : formData,
  			 "type" : "POST",
  			 success : function(receivedData) {
  				 alert("게시물이 등록되었습니다.");
  				 console.log("receivedData: " + receivedData);
  				$(file_name).attr("data-img", receivedData);
  				$(hidden_name).val(receivedData);
  			 },
  			 error : function() {
  				 alert("게시물이 등록되지않았습니다.");
  			 }
  		}); // ajax
    }
 	
 	////////////////////////////////////////////////////////////////////////
 	// insert 파일첨부2 등록(trigger)
	$("#btn-upload-file1").on("click", function(){
	   $("#upload_file1").trigger("click");
	});	
	// 모달창 띄우기 파일첨부2
    $("#modal_file_up1").click(function(){
       $("#btn_modal").trigger("click");	
    });
 	// 파일첨부2 등록시 input작업
    $("#upload_file1").change(function(e) {
   	 	console.log("filename: " + this.files[0].name);
   	 	var filename = this.files[0].name;
   	 	$("#file_up1").val(filename);
   	 
   		var inputFile = $("#upload_file1");
   		url = "/ajax/fileUpload";
   	
   		var file_name = "#modal_file_up1";
   		var hidden_name = "#hidden_file_up1";
   	
   	 	uploadAjax(url, inputFile, file_name, hidden_name); 
    });
 	// 파일첨부2 미리보기 작업
    $("#modal_file_up1").click(function() {
   	 var file_name = $("#modal_file_up1").attr("data-img");
		// var url = "/ajax/display?fileName=" + file_name;
		console.log("file_name: " + file_name);
		 var div = "";
		 div += "<div id='div_img'>";
		 div += "<img src='/ajax/display?fileName=" + file_name + "' style='width:550px;'>";
		 div += "</div>";
		 $("#modal_body").append(div);
    });  
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row text-center">
	<form role="form" method="post" action="write-run">
	<input type="hidden" value="${BoardVo.bno}"/>
	<h1>게시글 쓰기</h1>
	<div class="col-md-12 text-right">
		<input type="submit" class="btn btn-default" id="btnWrite" value="등록"/>
		<input type="button" class="btn btn-default" id="btnBoard" value="게시판"/>
		<div class="form-group text-left">
			<label for="title">
				제목
			</label>
			<input type="text" class="form-control" id="title" name="title"/>
		</div>
		<div class="form-group text-left">
			<label for="content">
				내용
			</label>
			<textarea class="form-control" id="content" name="content" rows="10" cols="50"></textarea>
		</div>
		<div class="form-group text-left">
			<label for="writer">
				작성자
			</label>
			<input type="text" class="form-control" id="writer" name="writer"/>
		</div>
		<div class="form-group text-left" >
			<label for="regdate">
				작성일자
			</label>
			<input type="text" class="form-control" id="regdate" name="regdate" readonly="readonly"/>
		</div>
		<div class="form-group text-left">
			<label for="viewcnt">
				조회수
			</label>
			<input type="text" class="form-control" value="0" id="viewcnt" name="viewcnt" readonly="readonly"/>
		</div>
		<div class="form-group text-left">
			<label for="dept_code">
				부서명
			</label>
			<select class="form-control" id="dept_code" name="dept_code">
			<option></option>
			<c:forEach var="BoardCom" items="${BoardComVo}">
				<c:if test="${BoardCom.node == '부서명' }">
					<option value="${BoardCom.name}">${BoardCom.name}</option>
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
			<c:forEach var="BoardCom" items="${BoardComVo}">
				<c:if test="${BoardCom.node == '지역' }">
					<option value="${BoardCom.name}">${BoardCom.name}</option>
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
			<c:forEach var="BoardCom" items="${BoardComVo}">
				<c:if test="${BoardCom.node == '성별'}">
					<option value="${BoardCom.name}">${BoardCom.name}</option>
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
			<c:forEach var="BoardCom" items="${BoardComVo}">
				<c:if test="${BoardCom.node == 'KOSA'}">
					<option value="${BoardCom.name}">${BoardCom.name}</option>
				</c:if>
			</c:forEach>
			</select>
		</div>
		<div class="form-group text-left">
			<label for="mil_yn">
				전역유무
			</label>
			<select class="form-control" id="mil_yn" name="mil_yn">
			<option></option>
			<c:forEach var="BoardCom" items="${BoardComVo}">
				<c:if test="${BoardCom.node == '전역유무' }">
					<option value="${BoardCom.name}">${BoardCom.name}</option>
				</c:if>	
			</c:forEach>
			</select>
		</div>
		<div class="form-group text-left">
			<label>
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
			<input type="checkbox" value="악기" class="hobby" name="hh"/>  
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
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>파일첨부1</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control" id="file_up" readonly="readonly"/>
				<input type="hidden" name="file_up" id="hidden_file_up" value=""/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-6">
				<input type="button" value="미리보기" id="modal_file_up" 
					class="col-md-12 btn btn-default" data-img=""/>
			</div>
		<div class="col-md-6">
			<input type="button" value="이미지 등록" id="btn-upload-file" class="col-md-12 btn btn-default"/>
			<input type="file" value="파일업로드" id="upload_file" style="display:none;"/>
		</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>파일첨부2</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control" id="file_up1" readonly="readonly"/>
				<input type="hidden" name="file_up1" id="hidden_file_up1" value=""/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-6">
				<input type="button" value="미리보기" id="modal_file_up1" 
					class="col-md-12 btn btn-default" data-img=""/>
			</div>
		<div class="col-md-6">
			<input type="button" value="이미지 등록" id="btn-upload-file1" class="col-md-12 btn btn-default"/>
			<input type="file" value="파일업로드" id="upload_file1" style="display:none;"/>
		</div>
		</div>
	</div>
	<!-- Modal -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" 
		id= "btn_modal" style="display: none;">Open Modal</button>
	<div class="modal fade" id="myModal" role="dialog">
		 <div class="modal-dialog">
		 Modal content
		 <div class="modal-content">
		 	<div class="modal-header">
		        <button type="button" id="modal_close" class="close" data-dismiss="modal">&times;</button>
					 <h4 class="modal-title">미리보기</h4>
		    </div>
		    <div class="modal-body" id="modal_body" style="text-align: center;">
		    </div>
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_modal_close">Close</button>
		    </div>
		 </div>
		 </div>
 	</div>
	</form>
	</div>
</div>
</body>
</html> 