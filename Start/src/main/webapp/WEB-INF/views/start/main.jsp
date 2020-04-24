<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="/resources/js/paging.js"></script>
<style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>
<script>
$(document).ready(function(){
	//모달창show(modal-show)
	$("#myModal").show();
	
	// 입력버튼
	$("#btnInsert").click(function(){
		alert("입력화면으로 이동합니다.");
		location.href = "/start/insert";
	});
	// 상단Input이미지버튼
	$("#clickInput").click(function(){
		alert("입력화면으로 이동합니다.");
		location.href = "/start/insert";
	});
	// 조회버튼
	$("#btnSelect").click(function(){
		alert("조회화면으로 이동합니다.");
		location.href = "/start/select";
	});
	// 상단 Search버튼
	$("#clickSearch").click(function(){
		alert("조회화면으로 이동합니다.");
		location.href = "/start/select";
	});
	// 게시판버튼
	$("#btnBoard").click(function(){
		alert("게시판화면으로 이동합니다.");
		location.href = "/start/board";
	});
	// 게시판조회
	$("#btnModal").click(function(){
		var writer = $("#writer").val();
		$("input[name=writer]").val(writer);
		
		$("#pageForm").submit();
	});
	// 글 조회폼
	$(".a_title").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		$("input[name=bno]").val(bno);
		
		var href= $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});
	
});	// $(document).ready
	//팝업 Close 기능
	function close_pop(flag) {
	$("#myModal").hide();
}
//	// 변수선언 및 특성
// 	var cup = 'Coffee';
// 	cup = 'hong Tea';
// 	cup = 'Latte';
// 	alert ('Drink ' + cup + '..!');
//	// 1번 
// 	var value = 10;
// 	value += 20;
// 	alert(value);
// 	// 2번
// 	var value = 'Hello' + '..!';
// 	alert(value + ' JavaScript');
	
	// Click! red변환후 서비스View로 이동.
	window.onload = function() {
		document.getElementById("txtClick").onclick = function(){
			this.style.color = 'red';
			alert("전달사항폼으로 이동합니다.");
			location.href="/start/service";
	}
}
	
	
</script>
<meta charset="UTF-8">
<title>입사시스템</title>
</head>
<body>
<form id="pageForm" action="/start/main">
	<input type="hidden" name="bno" value="${param.bno}"/>
	<input type="hidden" name="title" value="${boardVo.title}"/>
	<input type="hidden" name="writer" value="${boardVo.writer}"/>
</form>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Pino & System</a>
  <div class="col-md-3" id="clickSearch" style="float:right; margin-right=10px;"> 	
   <ul class="navbar-nav mr-auto">
     <li class="nav-item active">
     <a class="nav-link" href="#">Search</a>
     </li>
   </ul>  
  </div>   	
  <div class="col-md-3" id="clickInput" style="float:right; margin-right=10px;"> 	
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
      <a class="nav-link" href="#">Input</a>
      </li>
    </ul>  
   </div>    
   <div class="col-md-3" id="clickHome" style="float:right; margin-right=10px;">
    <ul class="navbar-nav mr-auto"> 
      <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
      </li>
   	</ul>
   </div>	
</nav>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 text-center">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<h1>Pino System</h1>
		<br>
		<br>
		<br>
		<br>
		<form role="form" method="post">
			<div class="form-group">
			<label>데이터 조회</label>
			<input type="button" id="btnSelect" class="btn btn-result" value="조회"/>
			</div>
			<br>
			<br>
			<div class="form-group">
			<label>데이터 입력</label>
			<input type="button" id="btnInsert" class="btn btn-result" value="입력"/>
			</div>
			<br>
			<br>
			<div class="form-group">
			<label>Pino 게시판</label><br>
			<input type="button" id="btnBoard" class="btn btn-result" value="게시판"/>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="form-group">
			<label>서울시 금천구 가산동 60-44 이앤씨드림타워7차 3층<br>
			<br>
			Tel: 02-6925-2288<br>
			E-mail : pino6481@daum.net, dsk0749@hanmail.net</label>
			</div>
		</form>
		</div>
	</div>
	<!-- The Modal -->
    <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
           	<!-- modal창 모서리x닫기추가부분 -->
   	 		<span class="close" onclick="close_pop();">&times;</span> 

                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지사항</span></b></span></p>
                <div class="text-center">
					<h1 id="txtClick" style="color:red; cursor:pointer"><U>Click!</U></h1>
				</div>
                <p style="text-align: center; line-height: 1.5;"><br/>
                Pino & Soft 게시판 안내 서비스점검 : 2020-04-30일부터 2020-05-01일까지오니<br>
                게시판을 이용하실 직원분들께서는 참고해주시기바랍니다.</p>
                <p><br/></p>
                <p style="text-align: center">자유게시판(간편조회)</p>
                <div class="form text-center">
                <div>
                	<label>Label:</label>${tot_cnt}
                </div>
				<div>
					<input type="text" class="form-control-sm" id="writer" placeholder="작성자를 검색해주세요."
				<c:if test="${BoardSearchDto.writer == 'writer'}">selected</c:if>/>
				<input type="button" class="btn btn-primary" id="btnModal" value="조회"/>
				</div>
                </div>
                <br>
                <br>
                <table class="tbList paginated table" style="folat: center;">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>	
						<th>작성자</th>		
					</tr>
				</thead>
				<tbody>
					<c:forEach var="BoardVo" items="${board}">
					<tr>
						<td>${BoardVo.bno}</td>
						<td><a href="/start/read" class="a_title" data-bno="${BoardVo.bno}">${BoardVo.title}</a>
						</td>
						<td>${BoardVo.writer}</td>
					</tr>
					</c:forEach>
				</tbody>
					<tfoot>
						<tr>
							<td colspan="9" align="center">
								<div class="btnContent">
						    		<div class="pagination" id ="pagination">
						        	</div>
					    		</div>
							</td>
						</tr>
					</tfoot>
				</table>
			<!-- modal창 닫기버튼부분     -->
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: 
            	center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
    </div>
</div>
</body>
</html> 