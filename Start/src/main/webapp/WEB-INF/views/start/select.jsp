<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>직원리스트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script></head>
<!-- calendar(datepicker) -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/paging.js"></script>
<script src="../jQuery/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	
	// 상단로고버튼(Pino&System)
	$("#clickHome").click(function(){
		alert("메인화면으로 이동합니다.");
		location.href="/start/main";
	});
	
	// 상단 로고버튼(입력하기)
	$("#clickInsert").click(function(){
		alert("입력화면으로 이동합니다.");
		location.href="/start/insert";
	});
	
	// 이전버튼(main홈으로)
	$("#btnMain").click(function(){
		alert("메인화면으로 이동합니다.");
		location.href="/start/main";
	});
	
	// 초기화버튼
	$("#btnReset").click(function(){
		location.href="/start/select";
	});
	
	// 페이지
// 	function setPage() {
// 		var perPage = $("select[name=perPage]").val();
// 		var nowPage = "${pagingDto.nowPage}";
// 		if (nowPage == "") {
// 			nowPage = 1;
// 		}
// 		$("input[name=perPage]").val(perPage);
// 		$("input[name=nowPage]").val(nowPage);
// 	}
	// 페이지
// 	function setPage() {
// 		var page = "${pagingDto.page}"
// 			if (page == "") {
// 				page = 1;
// 			}
// 			$("input[name=page]").val(page);
// 	}
	
	// 페이지 번호 클릭
// 	$(".a_pagination").click(function(e){
// 		e.preventDefault();
// // 		$(this).text();
// 		var page = $(this).attr("data-page"); // 페이지 숫자 읽기
// 		$("input[name=nowPage]").val(page); // 아래쪽 폼의 page에 설정
// 		$("#pageForm").submit(); // 폼 설정
// 	});
	
	// 회사입사날짜(달력)
	$("#join_day").datepicker({
		 dateFormat: 'yy-mm-dd' //Input Display Format 변경
	     ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		 ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		 ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		 ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		 ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		 
	}); // ("#join_day").datepicker
	
	// 회사퇴사날짜(달력)
	$("#retire_day").datepicker({
		 dateFormat: 'yy-mm-dd' //Input Display Format 변경
		 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	     ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	     ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	     ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		 ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			     
	}); // $("#retire_day").datepicker
	
	// 날짜넘기기버튼
	$("#btnSearch").click(function(){
		// 입사일자
		var join_day = $("#join_day").val();
		console.log("join_day:" + join_day);
		var joinday = $("input[name=join_day]").val(join_day);
		console.log("joinday:" + joinday);
		// 퇴사일자
		var retire_day = $("#retire_day").val();
		console.log("retire_day:" + retire_day);
		var retireday = $("input[name=retire_day]").val(retire_day);
		console.log("retireday:" + retireday);
		
	});
	// sabun,name,join_yn,put_yn, join_gbn_code, join_day, retire_day, pos_gbn_code
	
	// 검색버튼시
	$("#btnSearch").click(function(){
		
// 		setPage();
// 		$("input[name=page]").val(1); // 검색시 페이지는 다시 1페이지로
		
		var sabun = $("#sabun").val();
		console.log('sabun =======' + sabun);
		$("input[name=sabun]").val(sabun);
		
		var name = $("#name").val();
		console.log('name =======' + name);
		$("input[name=name]").val(name);
		var join_yn = $("#join_yn").val();
		console.log('join_yn =======' + join_yn);
		$("input[name=join_yn]").val(join_yn);
	
		var put_yn = $("#put_yn").val();
		console.log('put_yn =======' + put_yn);
		$("input[name=put_yn]").val(put_yn);
		var join_gbn_code = $("#join_gbn_code").val();
		console.log('join_gbn_code =======' + join_gbn_code);
		$("input[name=join_gbn_code]").val(join_gbn_code);
	
		var join_day = $("#join_day").val();
		console.log('join_day =======' + join_day);
		$("input[name=join_day]").val(join_day);
		var retire_day = $("#retire_day").val();
		console.log('retire_day =======' + retire_day);
		$("input[name=retire_day]").val(retire_day);
	
		var job_type = $("#job_type").val();
		console.log('job_type =======' + job_type);
		$("input[name=job_type]").val(job_type);
		
		
		$("#pageForm").submit();
	});
	
	// 수정폼으로
// 	$("#updateForm").click(function(){
// 		setPage();
// 		$("input[name=page]").val();
// 		$("#pageForm").submit();
// 	});
	// 제목클릭
// 	$(".c_name").click(function(e) {
// 		// prevent: 막다, 방지하다
// 		// default: 기본
// 		e.preventDefault(); // 브라우저의 기본기능
// 							// a - 링크 기능 막기				
// //		setPage();
// // 		setSearch();
// 		var sabun =$(this).attr("data-sabun");
// 		$("input[name=sabun]").val(sabun);
		
// 		var href = $(this).attr("href");
// 		$("#pageForm").attr("action", href).submit();
		
// 	}); // $(".c_name").click(function(e)
		
	// test1버튼(JAVASCRIPT)
	$("#btnTest1").click(function(){
		// 행성의 한글이름을 입력하면 영어 이름을 반환하는값출력
		const planets = {
				'수성' : 'Mecrury',
				'금성' : 'Venus',
				'지구' : 'Earth',
				'화성' : 'Mars',
				'목성' : 'Jupiter',
				'토성' : 'Saturn',
				'천왕성' : 'Uranus',
				'해왕성' : 'Neptune',
				
		};
		const name = prompt("행성의 이름을 한글로입력하세요 (영문으로 변환됨)");
		console.log(planets[name]);
		$("#txtTest1").val(planets[name]);
	});	
	// test2버튼(JAVASCRIPT)
	$("#btnTest2").click(function(){
		// 대문자이면 YES 아니면 No를 출력하는프로그램
		const data = prompt("알파벳 대문자를 입력하세요");
		
		if(data === data.toUpperCase()){
			alert("대문자가 입력되었습니다.");
			$("#txtTest2").val(data);
		} else {
			alert("대문자를 입력해주세요.");
		}
	});
	// test3버튼(JAVASCRIPT)
	$("#btnTest3").click(function(){
		// 원하는문자의 열을찾기
		const data = prompt("생각나는 알파벳문자를 입력하세요");
		const word = prompt("알파벳문자에 열을 찾고자하는 문자를 한개 입력하시오");
		$("#txtTest3").val(data.indexOf(word));
	});
	// test4버튼(JAVASCRIPT)
	$("#btnTest4").click(function(){
		// 전체문자열 출력하기
		const string = prompt("문장을 입력해주세요.").split('');
		$("#txtTest4").val(string.length);
	});
	// test5버튼(JAVASCRIPT)
	$("#btnTest5").click(function(){
		// 구구단 출력하기
		const num = prompt("1 ~ 9까지의 숫자 중 하나를 입력하세요.")
		let result = '';
		
		for (let i=1; i<=9; i++) {
			result += i*num + ',';
		}
		$("#txtTest5").val(result);
	});
	// test6버튼(JAVASCRIPT)
	$("#btnTest6").click(function(){
		// 2020년도 요일을 출력하기
		const month = prompt("월을 입력하세요.");
		const date = prompt("일을 입력하세요.");
		
		function solution(a,b) {
			const day = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
			
			const x = new Date('2020-' + a + '-' + b);
			return day[x.getDay()];
		}
		$("#txtTest6").val(solution(month, date));
	});
	// test7버튼(JAVASCRIPT)
	$("#btnTest7").click(function(){
		// 대소문자 바꿔서 출력하기
		let a = prompt('대문자와 소문자를 입력해주세요.');
		let b = [];
		let s = '';
		
		for(let i=0; i<a.length; i++) {
			// toLowerCase() 메서드는 문자열을 소문자로, toUpperCase() 메서드는 문자열을 대문자로 변환하여 반환합니다.
			if(a[i] === a[i].toLowerCase()){
				b.push(a[i].toUpperCase());
			} else {
				b.push(a[i].toLowerCase());
			}	
		}
		for(let j=0; j<b.length; j++) {
			s += b[j];
		}	
		$("#txtTest7").val(s);
	});
	// test8버튼(JAVASCRIPT)
	$("#btnTest8").click(function(){
		// 연산자
// 		var a = "오늘은";
// 		var b = 4;
// 		var c = "월";
// 		var d = 17;
// 		var e = "일 입니다";
// 		var sum = a + b + c + d + e;
// 		alert(sum);
// 		$("#txtTest8").val(sum);
		
		// 조건문의 중첩 사용
// 		var a = 30;
// 		var b = 20;
		
// 		if(a != b) {
// 			if(a > b) {
// 				$("#txtTest8").val(a);
// 				alert("a는 b보다 크다");
// 			}else{
// 				$("txtTest8").val(b);
// 				alert("a는 b보다 작다.");
// 			}
// 		}
// 		// 인자값 매개변수
// 		var i = 1;
// 		var j = 2;
		
// 		var sum = add(i,j);
		
// 		function add(v1, v2) {
// 			var sum = v1 + v2;
// 			alert(sum);
// 			$("#txtTest8").val(sum);
// 		}
// 		// Return 반환값
// 		var i = 1;
// 		var j = 2;
		
// 		var sum = add(i,j);
		
// 		function add(v1, v2) {
// 		var sum = v1 + v2;
// 		return sum;
// 		}
// 		alert(sum);
// 		$("#txtTest8").val(sum);
		// Object,객체 (빈 객체를 생성해서 그 안에서 변수와 함수를 추가할수 있다. 오브젝트란, 변수와 함수가 모여진 꾸러미라고볼수있다.)
		// 객체의 프로퍼티 생성은 '.'뒤에 프로퍼티명을 붙인다.
// 		var member = {};
// 		member.age = "30살";
// 		member.sex = "남자";
// 		member.birthday = "4월18일";
		
// 		alert(member.age);
// 		alert(member.sex);
// 		$("#txtTest8").val(member.birthday);
		// 객체에 메소드 추가하는법은 프로퍼티를 추가하는것과 비슷하다.
// 		var member = {
// 		age:"30살",
// 		sex:"남자",
// 		birthday:"4월19일",
// 		getSex:function() { // 함수의 선언과 동시에 할당한것
// 		return this.sex; // this는 member객체가됨	
// 		}
// 		};
		
// 		var sex = member.getSex();
// 		alert(sex);
// 		$("#txtTest8").val(sex);

		// 위와 같이 객체에 함수명을 참조해서 메소드로 추가시켜주는 방법이 있으며 결과는 동일하다.
		var member = {
		age: "30살",
		sex: "남자",
		birthday:"4월18일",
		getAge:getAge
		};
		
		function getAge() {
		return this.age;
		}
		
		var age = member.getAge();
		alert(age);
		$("#txtTest8").val(age);
 	});
	
	// 암호확인 비교 
	// lblError 레이어 클리어
	$("#txtPassword").keyup(function(){
		//$("#lblError").remove();// 제거
		$("#lblError").text(''); // 제거가 아니라 클리어
	});
	// 암호 확인 기능 구현
	$("#txtPasswordConfirm").keyup(function(){
		if($("#txtPassword").val() != $('#txtPasswordConfirm').val()) {
			$("#lblError").text(''); // 클리어
			$("#lblError").html("<b>암호가 틀립니다.</b>"); // 레이어에 HTML 출력
		}
		else {
			$("#lblError").text('') // 클리어
			$("#lblError").html("<b>암호가 맞습니다.</b>");
		}
	});
	
	// 배열연결 concat
	$("#btnTest9").click(function(){
		var test1 = [1,2,3];
		var test2 = [4,5,6];
		var test3 = [7,8,9];
		
//		var aeen = been.concat(ceen);
//		console.log(aeen);
		
		var test5 = test1.concat(test2,test3);
		alert(test5);
		$("#txtTest9").val(test5);
	});
	// if기능
	$("#btnTest10").click(function(){
		
		// if문
// 		var date = new Date();
// 		var hour = date.getHours();
		
// 		if (hour < 11) {
// 			alert("아침");
// 		}
// 		else if (hour < 15) {
// 			alert("점심");
// 		}
// 		else {
// 			alert("저녁");
// 		}
// 		$("#txtTest10").val(hour);
		
		// 반복문(while)
// 		value = 0;
// 		while (value < 5) {
// 			alert(value + '번째 반복');
// 			value++;
// 		}
		// for 반복문
		var array = ['포도', '사과', '바나나', '망고'];
		
		for (var i=0; i<array.length; i++) {
			alert(array[i]);
			$("#txtTest10").val(array);
	}
	});	
	// 스위치기능
	$("#btnTest11").click(function(){
		
	 	var num = prompt("숫자를 입력하세요.","");
		// 스위치
	 	switch (num) 
	 	{
	 		case "1": alert("하나");
	 			break;
	 		case "2": alert("둘");		
	 			break;
	 		case "3": alert("셋");
	 			break;
	 		case "4": alert("넷");	
	 			break
	 		case "5": alert("다섯");
	 			break;
	 		default : alert("몰라!!!");
	 	}
	 	$("#txtTest11").val(num);
	 });
});
//	<Java Script - TestStudy>
	// 2019/04/26 11:34:27 날짜출력
//	var year = '2019';
//	var month = '04';
//	var day = '26';
//	var hour = '11';
//	var minute = '34';
//	var second = '27';
	//concat() 메서드는 매개변수로 전달된 문자열을 메서드를 호출한 문자열에 붙여 새로운 문자열로 반환합니다.
//	var result = year.concat('/', month, '/', day, ' ', hour, ':', minute, ':', second);
//	console.log(result);
	// 행성의순서 숫자n입력값출력
//	const planets = ['수성', '금성', '지구', '화성', '목성', '토성', '천왕성', '해왕성'];
//	const n = prompt('몇 번째 행성인가요?');
//	console.log(planets[n-1]);
	// 거꾸로 결과값진행
//	const n = prompt('입력하세요.');
//	const reverseString = n.split('').reverse().join('');
//	console.log(reverseString);
	// 150cm이상의 제약결과값출력
//	const height = prompt('키를 입력하세요');
//	if(height >= 150) {
//		console.log('YES');
//	} else {
//		console.log(;NO');
//	}
	
	
	// 몫과 나머지
//	const n = prompt('수를 입력하세요.').split(' ');
//	const result = Math.floor(parseInt(n[0], 10) / parseInt(n[1], 10));
//	const left = parseInt(n[0], 10) % parseInt(n[1], 10);
//	console.log(result, left);
	
	
	// 소문자입력시 대문자값출력
//	var name = prompt('What your name?');
//	console.log(name.toUpperCase());
	
	
	// 오타수정하기
// 	const word = prompt('입력하세요');
// 	function replaceAll(str, searchStr, replaceStr) {
// 		return str.split(searchStr).join(replaceStr);
// 	}
// 	console.log(replaceAll(word,"q","e"));
	// 오타수정하기(정규식)
//	const word = prompt('입력하세요');
//	console.log(word.replace(/q/gi, 'e'));
	
	
	// 소수점 판별
// 	const num = prompt('숫자를 입력하세요.');
	
// 	function check_prime(num) {
// 		for(let i=2; i<num; i++) {
// 			const result = num %i;
// 			if(result === 0) {
// 				alert("소수점이 아닙니다.")
// 				return false;
// 			}
// 		}
// 		if (num === 1) {
// 			alert("소수점이 아닙니다.");
// 			return;
// 		}
// 		alert("소수점이 맞습니다.");
// 	}
// 	check_prime(num);
	
	
	// getTime()함수 사용하여 현재연도구하기
// 	const d = new Date();
// 	let year = d.getTime();
// 	year = Math.floor(year/(3600*24*365*1000))+ 1970
// 	console.log(year);
</script>
</head>
<form id="pageForm" method="get" action="/start/select">
	<input type="hidden" name="sabun"/>
	<input type="hidden" name="name"/>
	<input type="hidden" name="join_yn"/>
	<input type="hidden" name="put_yn"/>
	<input type="hidden" name="join_gbn_code"/>
	<input type="hidden" name="join_day"/>
	<input type="hidden" name="retire_day"/>
	<input type="hidden" name="job_type"/>
</form>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" id="clickHome">Pino & System</a>

  <div class="col-md-3" id="clickInsert" style="float:right; margin-right=20px;"> 	
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
      <a class="nav-link" href="#">입력하기</a>
      </li>
    </ul>  
   </div>    
   <div class="col-md-3" id="clickSelect" style="float:right; margin-right=20px;">
    <ul class="navbar-nav mr-auto"> 
      <li class="nav-item">
        <a class="nav-link" href="#">조회하기</a>
      </li>
   	</ul>
   </div>	
</nav>
<h1>직원조회리스트</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<form role="form" method="get">
		<br>
			<div class="row">
			<div class="col-md-3">
				<div class="col-md-3"><label for="sabun">사번</label></div>
				<div class="col-md-3">
				<input type="text" class="form-control-sm" id="sabun"
				<c:if test="${SearchDto.sabun == 'sabun' }">selected</c:if>/>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="name">성명</label></div>
				<div class="col-md-3">
				<input type="text" class="form-control-sm" id="name"
				<c:if test="${SearchDto.name == 'name' }">selected</c:if>/>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="join_yn">입사구분</label></div>
				<div class="col-md-3">
				<select class="form-control-sm" id="join_yn">
					<option value="">(선택)</option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '입사구분' }">
							<option value="${StartCom.name}"
							 <c:if test= "${StartCom.name == StartVo.join_yn}">
							 selected="selected</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
					<c:if test="${SearchDto.join_yn == 'join_yn'}">selected</c:if>
				</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="put_yn">투입여부</label></div>
				<div class="col-md-3">
				<select class="form-control-sm" id="put_yn">
					<option value="">(선택)</option>
					<c:forEach var ="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '투입여부' }">
							<option value="${StartCom.name}"
							<c:if test="${StartCom.name == StartVo.put_yn}">
							selected="selected</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
					<c:if test="${SearchDto.put_yn == 'put_yn'}">selected</c:if>
				</select>
				</div>
			</div>
			</div>
			<br>
			<div class="row">
			<div class="col-md-3">
				<div class="col-md-3"><label for="join_gbn_code">직위</label></div>
				<div class="col-md-3">
				<select class="form-control-sm" id="join_gbn_code">
					<option value="">(선택)</option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '직위'}">
							<option value="${StartCom.name }"
							<c:if test="${StartCom.name == StartVo.join_gbn_code}">
							selected="selected</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
					<c:if test="${SearchDto.join_gbn_code == 'join_gbn_code'}">selected</c:if>
				</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="join_day">입사일자</label></div>
				<div class="col-md-9">
				<input type="text" disabled="disabled" class="form-control-sm" id="join_day"/>
				<c:if test="${SearchDto.join_day == 'join_day' }">selected</c:if>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="retire_day">퇴사일자</label></div>
				<div class="col-md-9">
				<input type="text" disabled="disabled" class="form-control-sm" id="retire_day"/>
				<c:if test="${SearchDto.retire_day  == 'retire_day' }">selected</c:if>
				</div>
			</div>
			<div class="col-md-3">
				<div class="col-md-3"><label for="job_type">직종체크</label></div>
				<div class="col-md-9">
				<select class="form-control-sm" id="job_type">
					<option value="">(선택)</option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '직종체크' }">
							<option value="${StartCom.name}"
							<c:if test="${StartCom.name == StartVo.job_type }">
							selected="selected</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
					<c:if test="${SearchDto.job_type == 'job_type' }">selected</c:if>
				</select>
				</div>
			</div>
			</div>
		</form>
		</div>
	</div>
	<div style="float: right; margin-right: 20px; magin-bottom: 10px;">
		<input type="button" class="btn btn-default" id="btnSearch" value="검색"/>
		<input type="button" class="btn btn-default" id="btnReset" value="초기화"/>
		<input type="button" class="btn btn-default" id="btnMain" value="이전"/>
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-12" >
		<table class="tbList paginated table" style="folat: center;">
			<thead>
				<tr>
					<th>사번</th>
					<th>성명</th>
					<th>주민번호</th>
					<th>핸드폰번호</th>
					<th>직위</th>
					<th>입사일자</th>
					<th>퇴사일자</th>
					<th>투입여부</th>
					<th>연봉</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="StartVo" items="${list}">
				<tr>
					<td>${StartVo.sabun}</td>
					<td><a href="/start/update?sabun=${StartVo.sabun}" id="updateForm" class="c_name" 
 							data-sabun="${StartVo.sabun}">${StartVo.name}</a>
 					</td>
					<td>${StartVo.reg_no}</td>
					<td>${StartVo.hp}</td>
					<td>${StartVo.join_gbn_code}</td>
					<td>${StartVo.join_day}</td>
					<td>${StartVo.retire_day}</td>
					<td>${StartVo.put_yn}</td>
					<td>${StartVo.salary}</td>
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
	<div class="col-md-12">
	<div class="col-md-3">
	<div class="col-md-3"><label>암호</label></div>
	<div class="col-md-9">
	<table>
		<tr>
			<td>암호 :</td>
			<td><input type="password" id="txtPassword" size="20" /></td>
		</tr>
		<tr>
			<td>암호확인:</td>
			<td><input type="password" id="txtPasswordConfirm" size="20"/></td>
		</tr>
	</table>
	<br>
	<div id="lblError">암호를 입력하시오.</div>
	</div>
	</div>
	</div>
	<div class="text-center">
	<h1>Java Script기능</h1>
	<br>
	<input type="text" class="form-control-sm" id="txtTest1" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest1" value="행성" />
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest2" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest2" value="대문자"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest3" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest3" value="문자열 찾기"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest4" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest4" value="문자열 출력"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest5" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest5" value="구구단"/>
	<br> <br>
	<input type="text" class="form-control-sm" id="txtTest6" disabled="disabled" placeholder="2020년 날짜로 입력."/>
	<input type="button" class="btn btn-default" id="btnTest6" value="요일 조회" />
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest7" disabled="disabled" placeholder="영문으로 입력."/>
	<input type="button" class="btn btn-default" id="btnTest7" value="대소문자 체인지"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest8" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest8" value="변수조회"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest9" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest9" value="배열연결"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest10" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest10" value="for반복문"/>
	&nbsp; &nbsp;
	<input type="text" class="form-control-sm" id="txtTest11" disabled="disabled"/>
	<input type="button" class="btn btn-default" id="btnTest11" value="스위치"/>
	</div>


	<!-- 페이지네이션(페이지클릭창)-->
		<%-- <div class="row">
		<div class="col-md-12 text-center">
			<nav>
				<ul class="pagination" >
				<!-- 이전 -->
				<c:if test="${paginationDto.prev == true }">
					<li class="page-item">
						<a class="page-link a_pagination" href="#"
						data-page="${paginationDto.startPage - 1}">이전</a>
					</li>
				</c:if>	
				<!-- 페이징 -->
				<c:forEach var="i" begin="${paginationDto.startPage}" 
									end="${paginationDto.endPage }">
					<li class="page-item
					<c:if test="${paginationDto.pagingDto.page == i}">active</c:if>	
					">
						<a class="page-link a_pagination" href="#"
							data-page="${i}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${paginationDto.next == true }">
					<li class="page-item">
						<a class="page-link a_pagination"  href="#"
						data-page= "${paginationDto.endPage +1}">다음</a>
				</li>		
				</c:if>		
				</ul>
			</nav>
		</div>
	</div> --%>
</div>
</body>
</html> 