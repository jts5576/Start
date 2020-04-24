<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service View</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- calendar(datepicker) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/resources/js/paging.js"></script>	
<script>
$(document).ready(function() {
	// 메인홈버튼
	$("#btnMain").click(function() {
		alert("메인화면으로 이동합니다.")
		location.href = "/start/main";
	});
	// 공지글작성버튼
	$("#btnMade").click(function() {
		alert("작성화면으로 이동합니다.")
		location.href = "/start/made";
	});
	// 글조회버튼
	$(".a_title").click(function(e){
		e.preventDefault();
		var nn = $(this).attr("data-nn");
		$("input[name=nn]").val(nn);
		
		var href = $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});
});
	// 공유링크주소(Naver,Daum,Google)
	window.onload = function() {
		document.getElementById("txtNaver").onclick = function() {
			this.style.color = 'red';
			alert("네이버주소로 이동합니다.");
			location.href = "https://www.naver.com/";
		}
		document.getElementById("txtDaum").onclick = function() {
			this.style.color = 'red';
			alert("다음주소로 이동합니다.");
			location.href = "https://www.daum.net/";
		}
		document.getElementById("txtGoogle").onclick = function() {
			this.style.color = 'red';
			alert("구글주소로 이동합니다.");
			location.href = "https://www.google.co.kr/";
		}
	}
</script>
</head>
<body>
<form id="pageForm" action="start/serivce">
	<input type="hidden" name="nn" value="${param.nn}"/>
	<input type="hidden" name="tt" value="${noticeVo.tt}"/>
	<input type="hidden" name="cc" value="${noticeVo.cc}"/>
	<input type="hidden" name="ww" value="${noticeVo.ww}"/>
	<input type="hidden" name="gg" value="${noticeVo.gg}"/>
	<input type="hidden" name="mm" value="${noticeVo.mm}"/>
</form>
	<div class="container-fluid">
		<div class="row text-center">
			<div class="col-md-12 text-center">
				<br>
				<h1>관련자료 링크 및 전달사항</h1>
				<br> <br>
				<div>
					<!-- 공유링크부분 -->
					<div class="text-center">
						<h1 id="txtNaver" style="cursor: pointer;">
							<U>[https://www.naver.com]</U>
						</h1>
						<p style="text-align: center;">
							<span style="font-size: 14pt;"><b><span style="font-size: 11pt; color: red;">주소클릭! (naver.com)</span></b></span>
						</p>
					</div>
					<br>
					<div class="text-center">
						<h1 id="txtDaum" style="cursor: pointer;">
							<U>[https://www.daum.net]</U>
						</h1>
						<p style="text-align: center;">
							<span style="font-size: 14pt;"><b><span style="font-size: 11pt; color: red;">주소클릭! (daum.net)</span></b></span>
						</p>
					</div>
					<br>
					<div class="text-center">
						<h1 id="txtGoogle" style="cursor: pointer;">
							<U>[https://www.google.co.kr]</U>
						</h1>
						<p style="text-align: center;">
							<span style="font-size: 14pt;"><b><span style="font-size: 11pt; color: red;">주소클릭! (google.co.kr)</span></b></span>
						</p>
					</div>
				</div>
				<br>
				<div>
					<input type="button" class="btn btn-primary" id="btnMade"
						value="작성" />
					&nbsp;	
					<input type="button" class="btn btn-primary"
						id="btnMain" value="메인홈" />
				</div>
			</div>
			<div class="row">
			<div class="col-md-12">
			<table class="tbList paginated table" style="folat: center;">
				<br>
				<br>
				<h2>Pino & System 전달사항</h2>
				<br>
				<br>
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>글번호</th> -->
<!-- 						<th>제목</th> -->
<!-- 						<th>작성자</th> -->
<!-- 						<th>부서명</th> -->
<!-- 						<th>지역</th> -->
<!-- 						<th>성별</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
				<tbody>
					<c:forEach var="NoticeVo" items="${board}">
						<tr>
							<td>${NoticeVo.nn}</td>
							<td><a href="/start/view" class="a_title"
								data-nn="${NoticeVo.nn}">${NoticeVo.tt}</a></td>
							<td>${NoticeVo.ww}</td>
							<td>${NoticeVo.dd}</td>
							<td>${NoticeVo.aa}</td>
							<td>${NoticeVo.gg}</td>
							<td>${NoticeVo.mm}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" align="center">
							<div class="btnContent">
								<div class="pagination" id="pagination"></div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
			</div>
		</div>
	</div>
</body>
</html> 