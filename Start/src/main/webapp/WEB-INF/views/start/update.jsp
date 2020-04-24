<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원조회 및 수정</title>
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
	
	// 상단로고버튼(Pino&System)
	$("#clickHome").click(function(){
		alert("메인화면으로 이동합니다.");
		location.href="/start/main";
	});
	
	// 상단조회하기버튼
	$("#clickSelect").click(function(){
		alert("조회화면으로 이동합니다.");
		location.href="/start/select";
	});
	
	// 상단입력하기버튼
	$("#clickInsert").click(function(){
		alert("입력화면으로 이동합니다.");
		location.href="/start/insert";
	});
	
	// 이전버튼
	$("#btnMain").click(function(){
		alert("조회화면으로 이동합니다.");
		location.href="/start/select";
	});
	
	// 수정버튼
	$("#btnUpdate").click(function(){
		// 벨리데이션체크 update수정시 null데이터확인
		var name = $("#name").val();
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		var hp = $("#hp").val();
		var email1 = $("#email1").val();
		var join_day = $("#join_day").val();
		
		if(name == '' || name == null){
			alert("한글성명을 입력해주세요.");
			$("#name").focus();
			return false;
		}else if(id == '' || id == null){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}else if(pwd == '' || pwd == null){
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return false;
		}else if(hp == '' || hp == null){
			alert("핸드폰번호를 입력해주세요.")
			$("#hp").focus();
			return false;	
		}else if(email1 == '' || email1 == null){
			alert("이메일을 입력해주세요.");
			$("#email1").focus();
			return false;
		}else if(join_day == '' || join_day == null){
			alert("입사일을 선택해주세요.")
			$("#join_day").focus();
			return false;
		}
		alert("회원정보가 입력되었습니다.");
	});
	
	// 우편검색(Daum 주소검색창으로
	//"http://dmaps.daum.net/map_js_init/postcode.v2.js")
	$("#addrSearch").click(function(){
		daumPost();
	});
	
	// 이메일 및 이력서 사업자등록중 주민번호  D.B통합연결 
	$("#btnUpdate").click(function(){
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		console.log(email1);
		var totalemail = email1 + email2;
		$("input[name=email]").val(totalemail);
		console.log(totalemail);
	});
	
	//키를 누르거나 떼었을때 이벤트 발생
	$("input[name=salary]").bind('keyup keydown',function(){
        inputNumberFormat(this);
    });
	
	//입력한 문자열 전달
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
      
    //콤마찍기
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
    //콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
    
  	//숫자만 리턴(저장할때)
    //alert(cf_getNumberOnly('1,2./3g')); -> 123 return
    function cf_getNumberOnly (str) {
        var len      = str.length;
        var sReturn  = "";
        for (var i=0; i<len; i++){
            if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
                sReturn += str.charAt(i);
            }
        }
        return sReturn;
    }
    
 	// disabled 입사여부 유무
    $("select[name=put_yn]").change(function() {
    	var put_yn = $("select[name=put_yn]").val();
	//	var put_yn = $("#put_yn").val();
	// console.log(put_yn);
	// 	var strHtml = "";
		if (put_yn == "Y") {
// 			strHtml += '<div class="col-md-3">'
// 				+ '<label class="col-md-3">KOSA등록</label>'
// 				+ '<select id="kosa_reg_yn" name="kosa_reg_yn" class="col-md-3 form-control">'
// 				+ '<c:forEach var="StartCom" items="${StartComVo}">'
// 				+ '<c:if test="${StartCom.note eq 'KOSA등록'}">'
// 				+ '<option value="${StartCom.name}">${StartCom.name}</option>'
// 				+ '</c:if>'
// 				+ '</c:forEach>'
// 				+ '</select>'
// 				+ '</div>'
// 				+ '<div class="col-md-3">'
// 				+ '<label class="col-md-3">KOSA등급</label>'
// 				+ '<select id="kosa_class_code" name=kosa_class_code class="col-md-3 form-control">'
// 				+ '<c:forEach var="StartCom" items="${StartComVo}">'
// 				+ '<c:if test="${StartCom.note eq 'KOSA등급'}">'
// 				+ '<option value="${StartCom.name}">${StartCom.name}</option>'
// 				+ '</c:if>'
// 				+ '</c:forEach>'
// 				+ '</select>'
// 				+ '</div>';
// 				$("#join_day").attr("disabled", false);
// 				$("#retire_day").attr("disabled", false);
				$("#kosa_reg_yn").attr("disabled", false);
				$("#kosa_class_code").attr("disabled", false);
//				$("#join_day").attr();
//				$("#retire_day").attr();
	 }else{
			(put_yn == "N")
// 			strHtml += '<div class="col-md-3">'
// 				+ '<label class="col-md-3">KOSA등록</label>'
// 				+ '<select class="form-control" id="kosa_reg_yn" name="kosa_reg_yn" disabled="disabled">'
// 				+ '<option value="N">해당없음</option>'
// 				+ '</select>'
// 				+ '</div>'
// 				+ '<div class="col-sm-3">'
// 				+ '<label class="col-md-3">KOSA등급</label>'
// 				+ '<select class="form-control" id="kosa_class_code" name="kosa_class_code" disabled="disabled">'
// 				+ '<option value="N">해당없음</option>'
// 				+ '</select>'
// 				+ '</div>';
// 				$("#join_day").attr("disabled", true);
// 				$("#retire_day").attr("disabled", true);
				$("#kosa_reg_yn").attr("disabled", true);
				$("#kosa_class_code").attr("disabled", true);
// 				$("#join_day").val("");
// 				$("#retire_day").val("");
				$("#kosa_reg_yn").val("");
				$("#kosa_class_code").val("");
// 				$("#join_day").attr("value", "해당없음");
// 				$("#join_day").attr("disabled");
// 				$("#retire_day").attr("value", "해당없음");
// 				$("#retire_day").attr("disabled");
		} 
		$(".put_test").html(strHtml);
	});
 	
 	// disabled 군 입대유무
    $("select[name=mil_yn]").change(function() {
		var mil_yn = $("select[name=mil_yn]").val();
	//	var mil_yn = $("#mil_yn").val();
		console.log(mil_yn);
	// console.log(mil_yn);
	//	var strHtml = "";
		if (mil_yn == "Y") {
			/* strHtml += '<div class="col-md-3">'
				+ '<label class="col-md-3">군별</label>'
				+ '<select id="mil_type" name="mil_type" class="col-md-3 form-control">'
				+ '<c:forEach var="StartCom" items="${StartComVo}">'
				+ '<c:if test="${StartCom.note eq '군별'}">'
				+ '<option value="${StartCom.name}">${StartCom.name}</option>'
				+ '</c:if>'
				+ '</c:forEach>'
				+ '</select>'
				+ '</div>'
				+ '<div class="col-md-3">'
				+ '<label class="col-md-3">계급</label>'
				+ '<select id="mil_level" name=mil_level class="col-md-3 form-control">'
				+ '<c:forEach var="StartCom" items="${StartComVo}">'
				+ '<c:if test="${StartCom.note eq '계급'}">'
				+ '<option value="${StartCom.name}">${StartCom.name}</option>'
				+ '</c:if>'
				+ '</c:forEach>'
				+ '</select>'
				+ '</div>'; */
				$("#mil_startdate").attr("disabled", false);
				$("#mil_enddate").attr("disabled", false);
				$("#mil_type").attr("disabled", false);
				$("#mil_level").attr("disabled", false);
//				$("#mil_startdate").attr();
//				$("#mil_enddate").attr();
	 }else{
			(mil_yn == "N")
// 			strHtml += '<div class="col-md-3">'
// 				+ '<label class="col-md-3">군별</label>'
// 				+ '<select class="form-control" id="mil_type" name="mil_type" disabled="disabled">'
// 				+ '<option value="N">해당없음</option>'
// 				+ '</select>'
// 				+ '</div>'
// 				+ '<div class="col-sm-3">'
// 				+ '<label class="col-md-3">계급</label>'
// 				+ '<select class="form-control" id="mil_level" name="mil_level" disabled="disabled">'
// 				+ '<option value="N">해당없음</option>'
// 				+ '</select>'
// 				+ '</div>';
				$("#mil_startdate").attr("disabled", true);
				$("#mil_enddate").attr("disabled", true);
				$("#mil_type").attr("disabled", true);
				$("#mil_level").attr("disabled", true);
				$("#mil_startdate").val("");
				$("#mil_enddate").val("");
				$("#mil_type").val("");
				$("#mil_level").val("");
//				$("#mil_startdate").attr("value", "해당없음");
//				$("#mil_startdate").attr("disabled");
//				$("#mil_enddate").attr("value", "해당없음");
//				$("#mil_enddate").attr("disabled");
		}
//		$(".mil_test").html(strHtml);
	});
	
 	// 입대날짜-전역날짜 지정시(startDate > endDate날짜기능)        		 
	$('#mil_enddate').change(function(){
		// 날짜 데이터
		var startDate = $("#mil_startdate").val();
		var endDate = $("#mil_enddate").val();
		
		if (startDate > endDate) {
			alert("전역일자를 확인해주세요.")
			$("#mil_enddate").focus();
			$("#mil_enddate").val('');
		}
	});        		
	        		
	// 입사날짜-퇴사날짜 지정시(startDate > endDate날짜기능)        		 
	$("#retire_day").change(function(){
		// 날짜 데이터
		var startDate = $("#join_day").val();
		var endDate = $("#retire_day").val();
		   
		if(startDate > endDate) {
		   alert("퇴사일자를 확인해주세요.");
		   $("#retire_day").focus();
		   $("#retire_day").val('');
		}
	});
	
  	//군대입대날짜(달력)
	$("#mil_startdate").datepicker({
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
         
    }); // ("#mil_startdate").datepicker
	
	// 군대전역날짜(달력)
	$("#mil_enddate").datepicker({
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
	     
	}); // ("#mil_enddate").datepicker
	
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
	
	// 영문이름만 
	$("#eng_name").on("keyup", function() {
		$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
	});
	
	// 한글이름만
	$("#name").on("keyup", function() {
		$(this).val($(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,"") );
	});
	
	// 아이디영문숫자만
	$("input[name=id]").keyup(function(event){ 
	if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
	
	});	// $("input[name=id]")
	
	// 연령숫자만
	$("#years").on("keyup", function() {
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	
	// 패스워드확인비교
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#pwd1").keyup(function(){
			var pwd=$("#pwd").val();
			var pwd1=$("#pwd1").val();
			if(pwd != "" || pw1 != ""){
				if(pwd == pwd1){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	}); // $(function(){ 패스워드확인비교
	
	// 전화번호 하이픈자동삽입	
	$("#phone").on("keyup", function() {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").
				replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--","-") );
	});
	
	// 휴대폰번호 하이픈자동삽입
	function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    } // function autoHypenPhone(str)
    
	 // 휴대폰 하이픈적용
	var cellPhone = document.getElementById('hp'); // $("#id") * 같은코딩 다른방법 *
		cellPhone.onkeyup = function(event){
    		event = event || window.event;
    var _val = this.value.trim();
    	this.value = autoHypenPhone(_val) ;
    	
	} // cellPhone.onkeyup = function(event)
	
	// 주민번호 하이픈자동삽입
	$("#reg_no").on("keyup", function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").
				replace(/(^[0-9]{6})([0-9]{7})/, "$1-$2").replace("--","-") );
	});
	
	// 숫자만입력되는부분
    function onlyNum(key, spanId) {
   	 var onlyNum = /^[0-9]+$/;
//    	 console.log("ck : " + key + spanId );
   	 if (!onlyNum.test(key)) {
   		 $(spanId).text("숫자만 입력하세요").css("font-size", "5px").css("color", "red");
   		 check = 1;
   	 } else {
   		 $(spanId).text("");
   		 check = 0;
   	 }
   	 if (spanId == "") {
   		 $(spanId).text("");
   		 check = 0;
   	  }
    }
	
    //주민번호
	  var reg_no_array = new Array();
	     $("#reg_no").on("keyup", function(e) {
	    	 var reg_no = $("#reg_no").val();
	    	 var key = reg_no.replace(/\-/g,'');
	    	 var spanId = "#reg_no-span";
	    	 var num = "";
	    	 var ch_num = "";
	    	 var star_num = "";
	   			var key_num = e.key;
	   		 	var hidden_num = "";
	   		if (key.length < 7) {
	   		 	$(this).val(key);
	   		 	ch_num = key;
		   	 } else if (key.length >= 7 && key.length < 14) {
		  			 reg_no_array.push(key_num);
		   		 post_reg_no = key.substr(6, 7);
		   		 for(i = 0; i < post_reg_no.length-1; i++) {
		   			 star_num += "*";
		   		 }
		   		 
		   		 num += key.substr(0, 6);
		   		 num += "-";
		   		 num += key.substr(6, 1);
		   		 num += star_num;
		   		 num += key.substr(12, 1);
		   		 $(this).val(num);
		   		 
		   		 ch_num += key.substr(0, 7);
		   		 ch_num += reg_no_array.join("");
		   	 }
//	 	   	 console.log("reg_no_array" + reg_no_array.join(""));
		   	 hidden_num += key.substr(0, 6);
		   	 hidden_num += "-";
		   	 hidden_num += reg_no_array.join("");
		   	 $("#reg_no-hidden").val(hidden_num);
		   	 onlyNum(ch_num, spanId);
//	    	 console.log($("#reg_no-hidden").val() + "ck");
	    	 
	    	 if (ch_num.length == 14) {
	    		var age = agecalc(hidden_num) + 1;
	    		$("#years").val(age);
	    }
	});
	     
	// 주민번호 나이계산
	$("#reg_no").on("keyup", function(){
	var regno = $("#reg_no").val();	// 주민번호
	//console.log(regno);
	 			
	var firstNum = regno.substring(0, 2);	// 주민번호 앞두자리(87)
 	//console.log(firstNum)
	var curDateObj = new Date();	// 날짜 Object 생성
	var curDate = "";	// 현재일자
	var tmpAge = 0;		//	임시나이
	var curYear = curDateObj.getFullYear();		//	현재년도
	 			
	curDate = curYear;	
	//console.log(curYear);
	var genType = regno.substring(7,8);	// 주민번호 뒷끝자리(1) 성별구분 문자 추출
	//console.log(genType);
	 			
	// genType(성별구분 1,2)
	if(genType <= 2) {
	 	totalAge = curYear - (1900 + parseInt(firstNum)); // 1,2 일 경우
	} else {
	 	totalAge = curYear - (2000 + parseInt(firstNum));
	}	
	 	totalAge += 1;
	 	console.log(totalAge); // 나이추출(totalAge)
	 			
	// totalAge변수담아 Vo-years에 적용
	$("input[name=years]").val(totalAge);
	}); 
	
	// 우편번호 및 주소검색
	function daumPost() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	               
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zip').value = data.zonecode;
	                document.getElementById("addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	          }
	        
	      }).open();
	        
	  }	// function sample6_execDaumPostcode() 우편번호 주소검색
	  
	// 날짜넘기기버튼
	$("#btnUpdate").click(function(){
		// 입영일자
		var mil_startdate = $("#mil_startdate").val();
		console.log("mil_startdate:" + mil_startdate);
		var mil_start = $("input[name=mil_startdate]").val(mil_startdate);
		console.log("mil_start:" + mil_start);
		// 전역일자
		var mil_enddate = $("#mil_enddate").val();
		console.log("mil_enddate:" + mil_enddate);
		var mil_end = $("input[name=mil_enddate]").val(mil_enddate);
		console.log("mil_end:" + mil_end);
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
			
	}); // $("#InsertForm").click
	
	// 사업자등록번호 
	 $('#cmp_reg_no').keydown(function (event) {
        var key = event.charCode || event.keyCode || 0;
        $text = $(this); 
        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3) {
                $text.val($text.val() + '-');
            }
            if ($text.val().length === 6) {
                $text.val($text.val() + '-');
            }
        }
        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
		 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
		 
    }) //  $('#cmp_reg_no').keydown(function
    
    
    // 이력서 파일첨부
    $("#btn-upload-file").on("click", function() {
   	 $("#upload_file").trigger("click");
    });
    
 	// 업로드 파일첨부
	$("#btn-upload").on("click", function(){
		$("#upload_cmp").trigger("click");
	});
	// 직원 사진 올리기
     $("#profile").change(function() {
    	 console.log("filename: " + this.files[0].name);
    	 var filename = this.files[0].name;
    	 
    	 url = "/ajax/fileUpload";
    	
    	 var inputFile = $("#profile");
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
 					$("#profile").attr("data-img", receivedData);
 					$("#hidden_profile").val(receivedData);
 				 },
 				 error : function() {
 					 alert("수정되지않았습니다.");
 				 }
 			 }); // ajax
    		 
     });
	
  // 모달창 띄우기 사업자등록증
     $("#modal-cmp").click(function() {
    	 $("#btn_modal").trigger("click");
     });
     
     // 사업자 등록증 등록시 input작업
     $("#upload_cmp").change(function(e) {
    	 console.log("filename: " + this.files[0].name);
    	 var filename = this.files[0].name;
    	 $("#cmp_reg_image").val(filename);
    	 
    	var inputFile = $("#upload_cmp");
    	url = "/ajax/fileUpload";
    	
    	var file_name = "#modal-cmp";
    	var hidden_name = "#cmp_hidden_image";
    	
    	 uploadAjax(url, inputFile, file_name, hidden_name); 
     });
     
     // 사업자 등록증 미리보기 작업
     $("#modal-cmp").click(function() {
    	 var file_name = $("#modal-cmp").attr("data-img");
//     	 var url = "/ajax/display?fileName=" + file_name;
 		console.log("file_name: " + file_name);
 		 var div = "";
 		 div += "<div id='div_img'>";
 		 div += "<img src='/ajax/display?fileName=" + file_name + "' style='width:550px;'>";
 		 div += "</div>";
 		 $("#modal_body").append(div);
    	 
     }); 
     
     // 모달창 띄우기 이력서
     $("#modal_carrier").click(function() {
    	 $("#btn_modal").trigger("click");
     });
     
     // 이력서 업로드
     $("#upload_file").change(function() {
    	 var filename = this.files[0].name;
    	 $("#carrier").val(filename);
    	 
    	var inputFile = $("#upload_file");
    	
    	url = "/ajax/fileUpload";
    	
    	var file_name = "#modal_carrier";
    	var hidden_name = "#hidden_carrier";
    	uploadAjax(url, inputFile, file_name, hidden_name); 
     });
     
     // 이력서 미리보기 작업
     $("#modal_carrier").click(function() {
    	 var file_name = $("#modal_carrier").attr("data-img");
//     	 var url = "/ajax/display?fileName=" + file_name;
 		 console.log("file_name: " + file_name);
 		 var div = "";
 		 div += "<div id='div_img'>";
 		 div += "<img src='/ajax/display?fileName=" + file_name + "' style='width:550px;'>";
 		 div += "</div>";
 		 $("#modal_body").append(div);
     });
 		 
     // modal body 클리어
     $("#btn_modal_close").click(function() {
    	 $("#div_img").remove();
     });
     $("#modal_close").click(function(){
  		 $("#div_img").remove(); 
  	 });
     
  	// 업로드 ajax
     function uploadAjax(url, inputFile, file_name, hidden_name) {
    	 
    	 var files = inputFile[0].files;
    	 var formData = new FormData();
//    	 console.log("files[0]: " + files[0]);
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
	
  	// 이력서 등록시 input작업
     $("#upload-file").change(function(e) {
//   	 console.log(this.files[0].name);
    	 var filename = this.files[0].name;
    	 $("#carrier").val(filename);
     });
     
     // 이미지 올리기
     $("#profile").change(function() {
    	 var filename = this.files[0].name;
//    	 console.log(filename);
    	 $("#img_span").val(filename);
     });
     
	  // 이미지 사진올리기 파일첨부
 	 $("#btn-profile").on("click", function() {
     	 $("#profile").trigger("click");
      });
	  
});// $(document).ready(function()
		
	//게시글삭제 확인유무판단
	function del(sabun) {
		var chk = confirm("삭제를진행하시겠습니까?");
		if (chk) {
			location.href="/start/sabunDelete?sabun=" + sabun;
		}else{
			return false;
		}
}	
</script>
<form id="pageForm" action="/start/" method="post">
	<input type="hidden" name="sabun" value="${StartVo.sabun}">
	<input type="hidden" name="page"  value="${pagingDto.page}">
</form>
</head>
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
<h1>직원상세정보</h1>
<div class="container-flude">
	<div class="row">
	<form role="form" method="POST" action="/start/update" >
	<div style ="float:right; margin-right=20px; magin-bottm: 10px;">
	<input type="submit" class="btn btn-default" id="btnUpdate" value="수정"/>
	<input type="button" class="btn btn-default" id="btnDelete" value="삭제" onclick="del(${startVo.sabun})"/>
	<input type="button" class="btn btn-default" id="btnMain" value="이전"/>
	</div>
	<div class="col-md-12">
		<div class="row">
		<br>
		<div class="col-md-3" style="text-align:center;">
		<!-- 이미지 D.B담긴파일불러오기 -->
			<c:choose>
				<c:when test="${startVo.profile == null}">
					<img alt="basic-img" src="/resources/image.jpg" style="height: 200px;"><br>
				</c:when>
				<c:otherwise>
					<img alt="basic-img" src="/ajax/display?fileName=${startVo.profile}" style="height: 200px;"><br>
				</c:otherwise>
			</c:choose>
			<input type="button" value="프로필사진 변경" class="btn btn-default" 
					id="btn-profile" data-img="${StartVo.profile }">
			<input type="file" id="profile" style="display:none;">
			<input type="hidden" name="profile" id="hidden_profile" value="${startVo.profile}">
			<div><span id="img_span" style="z-index: 100000;"></span></div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*사번</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control" 
				readonly="readonly" id="sabun" name="sabun" value="${startVo.sabun}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*한글성명</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control"
				id="name" name="name" value="${startVo.name}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>영문성명</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control"
				id="eng_name" name="eng_name" value="${startVo.eng_name}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*아이디</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control"
				id="id" name="id" value="${startVo.id}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*비밀번호</label></div>
			<div class="col-md-9">
			<input type="password" class="form-control"
				id="pwd" name="pwd" maxlength="8" value="${startVo.pwd}"/> 
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*암호확인</label></div>
			<div class="col-md-9">
			<input type="password" class="form-control"  id="pwd1" name="pwd1" maxlength="8" disabled="disabled"/>
				<span>
					<div class="alert alert-success" 
						id="alert-success" style="height:20px; font-size: 10px; ">&nbsp; 비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" 
						id="alert-danger" style="height:20px; font-size: 9px; ">&nbsp; 비밀번호가 일치하지 않습니다.</div>
				</span>	
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>전화번호</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control" 
				id="phone" name="phone" maxlength="12" value="${startVo.phone}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*핸드폰번호</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control"
				id="hp" name="hp" maxlength="13" value="${startVo.hp}"/>	
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>주민번호</label></div>
			<div class="col-md-9">
			<div class="location-top"><span id="reg_no-span"></span></div>
			<input type="text" class="form-control" 
				id="reg_no" value="${startVo.reg_no}" maxlength="14"/>
				<input type="hidden" id="reg_no-hidden" name="reg_no" value="${startVo.reg_no}">
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>연령</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control"
				id="years" name="years" maxlength="3" value="${startVo.years}"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*이메일</label></div>
			<div class="col-md-5">
			<input type="text" class="form-control" id="email1" value="${startVo.email}"/>
			</div>
			<div class="col-md-4">
			<select class="form-control" id="email2">
				<option value="@naver.com">@naver.com</option>
				<option value="@daum.com">@daum.com</option>
				<option value="@nate.com">@nate.com</option>
			</select>
			</div>
			<input type="hidden" name="email"/>
		</div>
		<div class="col-md-3">
			<div class="col-md-12">
				<div class="col-md-6">
					<div class="col-md-4"><label>직종체크</label></div>
					<div class="col-md-8">
					<select class="form-control" id="job_type" name="job_type">
						<option></option>
						<c:forEach var="StartCom" items="${StartComVo}">
							<c:if test="${StartCom.note == '직종체크'}">
								<option value="${StartCom.name }"
								<c:if test="${StartCom.name == startVo.job_type}">
								selected="selected"</c:if>>${StartCom.name}</option>
							</c:if>
						</c:forEach>
					</select>	
					</div> 
				</div>
				<div class="col-md-6">
					<div class="col-md-5"><label>성별</label></div>
					<div class="col-md-7">
					<select class="form-control" id="sex" name="sex">
						<option></option>
						<c:forEach var="StartCom" items="${StartComVo}">
							<c:if test="${StartCom.note == '성별' }">
								<option value="${StartCom.name }"
								<c:if test="${StartCom.name == startVo.sex }">
								selected="selected"</c:if>>${StartCom.name}</option>
							</c:if>
						</c:forEach>
					</select>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-9">
		<div class="col-md-4">
			<div class="col-md-3"><label>주소</label></div>
			<div class="col-md-4">
				<input type="text" class="form-control" 
					id="zip" name="zip" placeholder="우편번호" value="${startVo.zip }"/>
			</div>
			<div class="col-md-5">
				<input type="button" class="btn btn-default" 
					value="주소검색" id="addrSearch" name="addrSearch"/>
			</div>
		</div>
		<div class="col-md-4">
			<input	type="text" class="form-control"
				id="addr1" name="addr1" placeholder="주소" value="${startVo.addr1}"/>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control"
				id="addr2" name="addr2" placeholder="세부주소" value="${startVo.addr2 }"/>
		</div>
		</div>
		<div class="col-md-9">
		<div class="col-md-4">
			<div class="col-md-3"><label>직위</label></div>
			<div class="col-md-9">
			<select class="form-control" id="join_gbn_code" name="join_gbn_code">
				<option></option>
				<c:forEach var="StartCom" items="${StartComVo}">
					<c:if test="${StartCom.note == '직위' }">
						<option value="${StartCom.name }"
						<c:if test="${StartCom.name == startVo.join_gbn_code }">
						selected="selected"</c:if>>${StartCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="col-md-3"><label>부서</label></div>
			<div class="col-md-9">
			<select class="form-control" id="dept_code" name="dept_code">
				<option></option>
				<c:forEach var="StartCom" items="${StartComVo}">
					<c:if test="${StartCom.note == '부서' }">
						<option value="${StartCom.name}"
						<c:if test="${StartCom.name == startVo.dept_code }">
						selected="selected"</c:if>>${StartCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="col-md-3"><label>연봉</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control" 
				id="salary" name="salary" placeholder="(만원)" value="${startVo.salary}"/>
			</div>
		</div>
		</div>
		</div>
		<div class="col-md-12">
		<div class="col-md-3">
			<div class="col-md-3"><label>입사구분</label></div>
			<div class="col-md-9">
				<select class="form-control" id="join_yn" name="join_yn">
					<option></option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '입사구분' }">
							<option value="${StartCom.name }"
							<c:if test="${StartCom.name == startVo.join_yn }">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>등급</label></div>
			<div class="col-md-9">
				<select class="form-control" id="gart_level" name="gart_level">
					<option></option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '등급' }">
							<option value="${StartCom.name}"
							<c:if test="${StartCom.name == startVo.gart_level }">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>투입여부</label></div>
			<div class="col-md-9">
				<select	class="form-control" id="put_yn" name="put_yn">
					<option></option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '투입여부' }">
							<option value="${StartCom.name}"
							<c:if test="${StartCom.name == startVo.put_yn}">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>군필여부</label></div>
			<div class="col-md-9">
				<select class="form-control" id="mil_yn" name="mil_yn">
					<option></option>
					<c:forEach var="StartCom" items="${StartComVo}">		
						<c:if test="${StartCom.note == '군필여부' }">
							<option value="${StartCom.name}"
							<c:if test="${StartCom.name == startVo.mil_yn}">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		</div>
		<div class="col-md-12">
		<div class="mil_test">
		<div class="col-md-3">
			<div class="col-md-3"><label>군별</label></div>
			<div class="col-md-9">
				<select class="form-control" id="mil_type" name="mil_type">
					<option></option>
					<c:forEach	var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '군별'}">
							<option value="${StartCom.name }"
							<c:if test="${StartCom.name == startVo.mil_type }">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>계급</label></div>
			<div class="col-md-9">
				<select class="form-control" id="mil_level" name="mil_level">
					<option></option>
					<c:forEach var="StartCom" items="${StartComVo}">
						<c:if test="${StartCom.note == '계급' }">
							<option value="${StartCom.name }"
							<c:if test="${StartCom.name == startVo.mil_level}">
							selected="selected"</c:if>>${StartCom.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>입영일자</label></div>
			<div class="col-md-9">
			<input type="text" class="form-control-sm" 
				readonly="readonly" id="mil_startdate" value="${startVo.mil_startdate}"/>
			<input type="hidden" name="mil_startdate"/>	
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>전역일자</label></div>
			<div class="col-md-9">
			<input type="text"class="form-control-sm"
				readonly="readonly" id="mil_enddate" value="${startVo.mil_enddate}"/>
			<input type="hidden" name="mil_enddate"/>	
			</div>
		</div>
		</div>
		</div>
		<div class="col-md-12">
		<div class="put_test">
		<div class="col-md-3">
			<div class="col-md-3"><label>KOSA등록</label></div>
			<div class="col-md-9">
			<select	class="form-control" id="kosa_reg_yn" name="kosa_reg_yn">
				<option></option>
				<c:forEach var="StartCom" items="${StartComVo}">
					<c:if test="${StartCom.note == 'KOSA등록'}">
						<option value="${StartCom.name }"
						<c:if test="${StartCom.name == startVo.kosa_reg_yn }">
						selected="selected"</c:if>>${StartCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>KOSA등급</label></div>
			<div class="col-md-9">
			<select class="form-control" id="kosa_class_code" name="kosa_class_code">
				<option></option>
				<c:forEach var="StartCom" items="${StartComVo}">
					<c:if test="${StartCom.note == 'KOSA등급'}">
						<option value="${StartCom.name }"
						<c:if test="${StartCom.name == startVo.kosa_class_code }">
						selected="selected"</c:if>>${StartCom.name}</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>*입사일자</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control-sm" 
					readonly="readonly" id="join_day" value="${startVo.join_day}"/>
				<input type="hidden" name="join_day"/>	
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>퇴사일자</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control-sm"
					readonly="readonly" id="retire_day" value="${startVo.retire_day }"/>
				<input type="hidden" name="retire_day"/>	
			</div>
		</div>
		</div>
		</div>
		<div class="col-md-12">
		<div class="col-md-3">
			<div class="col-md-3"><label>사업자번호</label></div>
			<div class="col-md-9" id="cmp_reg">
				<input type="text" class="form-control" 
				 id="cmp_reg_no" name="cmp_reg_no" value="${startVo.cmp_reg_no}" maxlength="12"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>업체명</label></div>
			<div class="col-md-9">
				<input type="text" class="form-control" 
					id="crm_name" name="crm_name" value="${startVo.crm_name }"/>
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-3"><label>사업자등록증</label></div>
			<div class="col-md-9"><p></p>
				<input type="text" class="form-control" 
					id="cmp_reg_image" value="${startVo.cmp_reg_image}" readonly="readonly">
			<input type="hidden" name="cmp_reg_image" id = "cmp_hidden_image" value="${startVo.cmp_reg_image}">
			</div>
		</div>
		<div class="col-md-3">
			<div class="col-md-6">
				<input type="button" value="미리보기" id="modal-cmp" class="col-md-12 btn btn-default" data-img="${startVo.cmp_reg_image}">
			</div>
			<div class="col-md-6">
				<input type="button" value="사업자등록증 변경" id="btn-upload" class="col-md-12 btn btn-default">
				<input type="file" value="등록" id="upload_cmp"  style="display: none;" multiple="multiple">
			</div>
		</div>
	</div>
	<div class="col-md-12">
	<div class="col-md-6">
		<div class="col-md-2"><label>자기소개</label></div>
		<div class="col-md-10">
			<textarea rows="3" id="self_info" name="self_info"  style="width:100%;text-overflow:ellipsis;" 
				placeholder="100자 이내로 작성하세요." >${startVo.self_info}</textarea>
		</div>
	</div>
	<div class="col-md-3">
		<div class="col-md-3"><label>이력서</label></div>
		<div class="col-md-9">
			<input type="text" class="form-control" id="carrier"  value="${startVo.carrier}" readonly="readonly">
			<input type="hidden" name="carrier"  id="hidden_carrier" value="${startVo.carrier}">
		</div>	
	</div>
	<div class="col-md-3">
		<div class="col-md-6">
			<input type="button" value="미리보기" id="modal_carrier" class="col-md-12 btn btn-default"  data-img="${startVo.carrier}">
		</div>
		<div class="col-md-6">
			<input type="button" value="이력서 변경" id="btn-upload-file" class="col-md-12 btn btn-default">
			<input type="file" value="파일업로드" id="upload_file" style="display: none;">
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