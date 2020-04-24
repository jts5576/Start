<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전달사항작성</title>
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
	
	// 이전화면버튼
	$("#btnService").click(function(){
		alert("이전화면으로 이동합니다.")
		location.href="/start/service";
	});
	// 공지글등록버튼
	$("#btnMade").click(function(){
		
		var tt = $("#tt").val();
		var cc = $("#cc").val();
		var ww = $("#ww").val();
		var dd = $("#dd").val();
		var aa = $("#aa").val();
		var gg = $("#gg").val();
		var hobby = $('.hobby:checked');
		var mm = $('.mm:checked');
		
		// 취미가 2개이상 체크되어있다면 오류메시지 공백
		if($('.hobby:checked').length >=2 ){ 
			$('.hobbyHelper').text('');
		}
	
		// 전체검사 - 벨리데이션처리
		if (tt == '' || tt == null) {
			alert("제목을 입력해주세요.");
			$("#tt").focus();
			return false;
		}else if (cc == '' || cc == null) {
			alert("내용을 입력해주세요.");
			$("#cc").focus();
			return false;
		}else if (ww == '' || ww == null) {
			alert("작성자명을 입력해주세요.");
			$("#ww").focus();
			return false;
		}else if (dd == '' || dd == null) {
			alert("부서명을 선택해주세요.");
			$("#dd").focus();
			return false;
		}else if (aa == '' || aa == null) {
			alert("지역을 선택해주세요.");
			$("#aa").focus();
			return false;
		}else if (gg =='' || gg == null) {
			alert("성별을 선택해주세요.");
			$("#gg").focus();
			return false;
		}else if ($('.hobby:checked').length < 2) {
			alert("취미는 2개이상 선택해주세요.");
			return false;
		}else if ($('.hobby:checked').length > 4) {
			alert("취미는 4개이상 선택해주세요.");
			return false;
		}else if($(':radio[name="mm"]:checked').length < 1) {
			alert("결혼 유무를 선택해주세요.");
			return false;
		}
		alert("전달사항이 저장되었습니다.");
	}); // $("#btnInsert").click(function()
	
					
	// insert 파일첨부1등록 업로드(trigger)
 	$("#btn-upload-file").on("click", function(){
 		$("#upload_file").trigger("click");	
 	});	  
	// 파일첨부1 등록시 input작업
    $("#upload_file").change(function(e) {
   	 console.log(this.files[0].name);
   	 var filename = this.files[0].name;
   	 $("#ff").val(filename);
    });
 	// 파일첨부1 업로드
    $("#upload_file").change(function() {
   	 var filename = this.files[0].name;
   	 console.log(filename);
   	 $("#ff").val(filename);
   	 
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
   	 $("#ff").val(filename);
   	 
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
 	
 	// insert 파일첨부2등록 업로드(trigger)
	$("#btn-upload-file1").on("click", function(){
		$("#upload_file1").trigger("click");
	});		
	// 파일첨부2 등록시 input작업		
	$("#upload_file1").change(function(){
		console.log(this.files[0].name);
		var filename = this.files[0].name;
		$("#ff1").val(filename);
	});		
	// 파일첨부2 업로드
	$("#upload_file1").change(function(){
		var filename = this.files[0].name;
		console.log(filename);
		$("#ff1").val(filename);
	});
	// 파일첨부2 미리보기 작업
    $("#modal_file_up1").click(function() {
       var file_name = $("#modal_file_up1").attr("data-img");
       var url = "/ajax/display?fileName=" + file_name;
     	 console.log("file_name: " + file_name);
       var div = "";
     	   div += "<div id='div_img'>";
     	   div += "<img src='/ajax/display?fileName=" + file_name + "' style='width:550px;'>";
     	   div += "</div>";
       $("#modal_body").append(div);
    });
   	
    // 파일첨부2 업로드
    $("#upload_file1").change(function() {
   	 var filename = this.files[0].name;
   	 console.log(filename);
   	 $("#ff1").val(filename);
   	 
   	var inputFile = $("#upload_file1");
   	
   	url = "/ajax/fileUpload";
   	
   	var file_name = "#modal_file_up1";
   	var hidden_name = "#hidden_file_up1";
   	
   	uploadAjax(url, inputFile, file_name, hidden_name); 
    });
   
    // 파일첨부2 모달창 띄우기 이미지
    $("#modal_file_up1").click(function() {
        $("#btn_modal").trigger("click");
    });
   	
});
</script>
</head>
<body>
<div class="container-fluid">
<div class="row text-center">
	<form role="form" method="post" action="made-run">
	<input class="hidden" value="${NoticeVo.nn}"/>
	<br>
	<h1>전달사항 작성</h1>
	<br>
	<br>
	<div class="col-md-12 text-center">
		<input type="submit" class="btn btn-primary" id="btnMade" value="등록"/>
		&nbsp;
		<input type="button" class="btn btn-primary" id="btnService" value="이전"/>
		<div class="form-group text-left">
			<label for="tt">
			제목
			</label>
			<input type="text" class="form-control" id="tt" name="tt"/>
		</div>
		<div class="form-group text-left">
			<label for="cc">
			내용 
			</label>
			<textarea class="form-control" id="cc" name="cc" rows="10" cols="50"></textarea>
		</div>
		<div class="form-group text-left">
			<label for="ww">
			작성자
			</label>
			<input type="text" class="form-control" id="ww" name="ww"/>
		</div>
		<div class="form-group text-left">
			<label for="dd">
			부서명
			</label>
			<select class="form-control" id="dd" name="dd">
			<option></option>
			<c:forEach var="noticeCom" items="${NoticeComVo}">
				<c:if test="${noticeCom.note == '부서명' }">
					<option value="${noticeCom.name}">${noticeCom.name}</option>
				</c:if>
			</c:forEach>
			</select>
		</div>
		<div class="form-group text-left">
			<label for="aa">
			지역
			</label>
			<select class="form-control" id="aa" name="aa">
			<option></option>
			<c:forEach var="noticeCom" items="${NoticeComVo}">
				<c:if test="${noticeCom.note == '지역' }">
					<option value="${noticeCom.name}">${noticeCom.name}</option>
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
						<option value="${noticeCom.name}">${noticeCom.name}</option>
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
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>첨부파일1</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control" id="ff" readonly="readonly"/>
				<input type="hidden" name="ff" id="hidden_file_up" value=""/>
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
			<div class="col-md-3"><label>첨부파일2</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control" id="ff1" readonly="readonly"/>
				<input type="hidden" name="ff1" id="hidden_file_up1" value=""/>
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