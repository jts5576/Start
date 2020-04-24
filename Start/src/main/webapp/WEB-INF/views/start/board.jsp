<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
<script src="/resources/js/paging.js"></script>
<script>
$(document).ready(function(){
	
	// 메인홈버튼
	$("#btnMain").click(function(){
		alert("메인화면으로 이동합니다.");
		location.href="/start/main";
	});
	// 초기화버튼
	$("#btnBoard").click(function(){
		location.href="/start/board";
	});
	// 글쓰기버튼
	$("#btnWrite").click(function(){
		alert("글쓰기폼으로 이동합니다.");
		location.href="/start/write";
	});
	// 글조회폼으로
	$(".a_title").click(function(e){
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		$("input[name=bno]").val(bno);
		
		var href = $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});
	// 검색버튼
	$("#btnSearch").click(function(){
		var writer = $("#writer").val();
		$("input[name=writer]").val(writer);
		// alert("writer" + writer);
		
		var dept_code = $("#dept_code").val();
		$("input[name=dept_code]").val(dept_code);
		
		var area = $("#area").val();
		$("input[name=area]").val(area);
		
		var gender = $("#gender").val();
		$("input[name=gender]").val(gender);
		
		var kosa = $("#kosa").val();
		$("input[name=kosa]").val(kosa);
		
		var mil_yn = $("#mil_yn").val();
		$("input[name=mil_yn]").val(mil_yn);
		
		$("#pageForm").submit();
	});
});
</script>
</head>
<body>
<h1>view.jsp입니다.</h1>
당신의 id는 ${id} 입니다.

<form id="pageForm" action="/start/board">
	<input type="hidden" name="bno" value="${param.bno}"/>
	<input type="hidden" name="writer" value="${boardVo.writer}"/>
	<input type="hidden" name="dept_code" value="${boardVo.dept_code}"/>
	<input type="hidden" name="area" value="${boardVo.area}"/>
	<input type="hidden" name="gender" value="${boardVo.gender}"/>
	<input type="hidden" name="kosa" value="${boardVo.kosa}"/>
	<input type="hidden" name="mil_yn" value="${boardVo.mil_yn}"/>
	<input type="hidden" name="marry" value="${boardVo.marry}"/>
</form>

<div class="container-fluid">
<div class="row text-center">
	<h1>Pino & System 게시판</h1>
	<br>
	<div class="col-md-12">
	<form role="form" method="get">
	<br>
		<div class="row">
		<div class="col-md-3">
			<div class="col-md-3"><label for="writer">작성자</label></div>
			<div class="col-md-3">
			<input type="text" class="form-control-sm" id="writer"
			<c:if test="${BoardSearchDto.writer == 'writer'}">selected</c:if>/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label for="dept_code">부서명</label></div>
			<div class="col-md-3">
			<select class="form-control-sm" id="dept_code">
				<option value="">(부서선택)</option>
				<c:forEach var="boardCom" items="${BoardComVo}">
					<c:if test="${boardCom.node == '부서명'}">
						<option value="${boardCom.name}"
							<c:if test="${boardCom.name == BoardVo.dept_code}">
							selected="selected"</c:if>>${boardCom.name}</option>
					</c:if>
				</c:forEach>
				<c:if test="${BoardSearchDto.dept_code == 'dept_code'}">selected</c:if>
			</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label for="area">지역</label></div>
			<div class="col-md-3">
			<select	class="form-control-sm" id="area">
				<option value="">(지역선택)</option>
				<c:forEach var="boardCom" items="${BoardComVo}">
					<c:if test="${boardCom.node == '지역' }">
						<option value="${boardCom.name}"
							<c:if test="${boardCom.name == BoardVo.area}">
							selected="selected"</c:if>>${boardCom.name}</option>
					</c:if>
				</c:forEach>
				<c:if test="${BoardSearchDto.area == 'area'}">selected</c:if>
			</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label for="gender">성별</label></div>
			<div class="col-md-3">
			<select class="form-control-sm" id="gender">
				<option value="">(성별선택)</option>
				<c:forEach var="boardCom" items="${BoardComVo}">
					<c:if test="${boardCom.node == '성별'}">
						<option value="${boardCom.name}"
							<c:if test="${boardCom.name == BoardVo.gender}">
							selected="selected"</c:if>>${boardCom.name}</option>
					</c:if>		
				</c:forEach>
				<c:if test="${BoardSearchDto.gender == 'gender'}">selected</c:if>
			</select>
			</div>
			<div>
				<label>total :</label>${tot_cnt}
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label for="kosa">KOSA</label></div>
			<div class="col-md-3">
			<select class="form-control-sm" id="kosa">
				<option value="">(KOSA선택)</option>
				<c:forEach var="boardCom" items="${BoardComVo}">
					<c:if test="${boardCom.node == 'KOSA'}">
						<option value="${boardCom.name}"
							<c:if test="${boardCom.name == BoardVo.kosa}">
							selected="selected"</c:if>>${boardCom.name}</option>
					</c:if>
				</c:forEach>
				<c:if test="${BoardSearchDto.kosa == 'kosa'}">selected</c:if>
			</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label for="mil_yn">전역유무</label></div>
			<div class="col-md-3">
			<select class="form-control-sm" id="mil_yn">
				<option value="">(전역유무선택)</option>
				<c:forEach var= "boardCom" items="${BoardComVo}">
					<c:if test="${boardCom.node == '전역유무'}">
						<option value="${boardCom.name}"
							<c:if test="${boardCom.name == BoardVo.mil_yn}">
							selected="selected"</c:if>>${boardCom.name}</option>
					</c:if>
				</c:forEach>
				<c:if test="${BoardSearchDto.mil_yn == 'mil_yn'}">selected</c:if>
			</select>
			</div>
		</div>
		<br>
		<br>
		<div class="col-md-12 text-right">
			<input type="button" class="btn btn-default" id="btnSearch" value="검색"/>
			<input type="button" class="btn btn-default" id="btnBoard" value="초기화"/>
			<input type="button" class="btn btn-default" id="btnMain" value="메인홈"/>
			<input type="button" class="btn btn-default" id="btnWrite" value="글쓰기"/>
		</div>
	</div>
	</form>
	</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-md-12">
			<table class="tbList paginated table" style="folat: center;">
				<thead>
					<tr>
						<th>글번호</th>	
						<th>글제목</th>	
						<th>작성자</th>	
						<th>작성일</th>	
						<th>조회수</th>	
						<th>부서명</th>	
						<th>지역</th>	
						<th>성별</th>
						<th>KOSA</th>
						<th>전역유무</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="BoardVo" items="${board}">
					<tr>
						<td>${BoardVo.bno}</td>	
						<td><a href="/start/read" class="a_title" data-bno="${BoardVo.bno}">${BoardVo.title}</a>
							<c:if test="${BoardVo.viewcnt >=100 }">
							<img src="<c:url value='/resources/heart_fill.png'/>" width="15">
							<span style="color: red;">hot</span>
							</c:if>
						</td>	
						<td>${BoardVo.writer}</td>	
						<td>${BoardVo.regdate}</td>	
						<td>${BoardVo.viewcnt}</td>	
						<td>${BoardVo.dept_code}</td>	
						<td>${BoardVo.area}</td>	
						<td>${BoardVo.gender}</td>	
						<td>${BoardVo.kosa}</td>
						<td>${BoardVo.mil_yn}</td>
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
		</div>
	</div>
</div>
</body>
</html> 