<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search.css">
<meta charset="UTF-8">
<title> 패스워드 찾기</title>
</head>
<body>
<script type="text/javascript">
	$(function () {
		var emailId = "";
		var emailAddress = "";
		var email = "";
		$("#emailCheckNumber").hide();
		$("#finalCheck").hide();
		$("#changePw").hide();
		$("#checkPw").hide();
		$("#pwInsert").hide();
		$("#emailCheck").on("click", function () {
			var emailId = $("#emailId").val();
			var add = $("#add").text();
			var emailAddress = $("#emailAddress").val();
			var email = emailId + add + emailAddress;
			$.post("../search/mailSearch",{
				email : email
			}, function (data) {
				if(data == 1){
					// 이메일의 존재여부를 확인 이제 인증번호를 보내면 된다.
					$.post("../search/mailSending",{
						email : email
						}, function (data) {
							if(data == 1){
								alert("인증번호가 발송되었습니다.\n확인후 번호를 입력해주세요.");
								$("#emailCheck").hide();
								$("#emailCheckNumber").show();
								$("#finalCheck").show();
								$("#changePwId").prop('readonly', true);
								$("#emailId").prop('readonly', true);
								$("#emailAddress").prop('readonly', true);
								}else{
									alert("인증번호 발송에 실패하였습니다.\다시 시도해주세요.");
								}
							}
					)
				}else{// 이메일이 없음을 확인. 다시 입력하게 해야한다.
					alert("존재하지 않는 이메일 입니다.\n다시 확인해 주세요.");
					$("#emailId").val('');
					$("#emailAddress").val('');
				}
			}
			)
		})
		$("#finalCheck").on("click", function(){
			var id = $("#changePwId").val();
			var emailId = $("#emailId").val();
			var add = $("#add").text();
			var emailAddress = $("#emailAddress").val();
			var email = emailId + add + emailAddress;
			var Code = $("#emailCheckNumber").val();
			$("#emailCheckNumber").prop('readonly', true);
			$.post("../search/mailCheck",{
				Code : Code
			}, function (data) {
				if(data == 1){
					alert("이메일 인증이 완료되었습니다.\n사용하실 새 비밀번호를 입력해 주세요.");
					$("#changePwId").hide();
					$("#emailCheckNumber").hide();
					$("#finalCheck").hide();
					$("#pwInsert").show();
					$("#changePw").show();
					$("#checkPw").show();
					$("#pwInsert").show();
				}else{
					alert("인증번호를 잘못 입력하셨습니다.\n다시 시도해주세요.");
				}
			})
		})
		// 새 비밀번호 조건 충족 확인;
		$("#changePw").blur(function (){
			var nPw = $("#changePw").val();
			var ncPw = $("#checkPw").val();
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@\#$%<>^&*()_+-]/;
			// 비밀번호 길이 확인;
			if(nPw.length < 8 || nPw.length > 12){
				result_emailNo.innerHTML = "비밀번호는 8~12자로 설정해야 합니다.";
				nPw = $("#changePw").val('');
				event.stiplmmediatePropagation();
			// 특수문자 조건 확인;
			}else if(!pattern1.test(nPw) || !pattern2.test(nPw)	|| !pattern3.test(nPw)){
				result_emailNo.innerHTML = "비밀번호는 대문자, 소문자, 숫자, 특수문자 3가지가 포함되야 합니다";
				nPw = $("#changePw").val('');
				event.stiplmmediatePropagation();
			}
			result_emailNo.innerHTML = "";
			result_emailOk.innerHTML = "입력완료 되었습니다.";
		});// npw focus 끝;
		
		$("#pwInsert").on("click", function(){
			var id = $("#changePwId").val();
			var nPw = $("#changePw").val();
			var ncPw = $("#checkPw").val();
			if(nPw !== ncPw){
				alert("입력하신 두 비밀번호가 다릅니다.\n다시 입력해주세요.");
				$("#changePw").val('');
				$("#checkPw").val('');
			}else{
				var email = $("#emailId").val() + $("#add").text() + $("#emailAddress").val();
				$.post("./pwResult", {
					id : id,
					pw : nPw,
					email : email
				}, function(data){
					if(data == 1){
						alert("비밀번호 변경 성공");
					}else{
						alert("비밀번호 변경 실패");
					}
				})
			}
		})
		$("#closeWindow").on("click", function () {
			window.close();
		})
	})
</script>
<div class="container">
	<div class="search_wrap">
			<div class="search_logo">
				<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo111.png"></a>
			</div>
			<div class="search_inner">
				<div class="search_title">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/profile.png" class="strongimg"><strong>패스워드 찾기</strong>
				</div>
			<form class="sc_form">
				<input type="text" id = "changePwId" class="sctxt1" placeholder="아이디를  입력해주세요.">
				<div id="titleimg">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/envelope.png" class="titleimg">
				</div>
				<input type="text" class="form-control sctxt" title="이메일 아이디" placeholder="" id="emailId" name="emailId" maxlength="50">
					<span class="from-control" id = "add">@</span>
				<input type="text" class="form-control sctxt" title="이메일 주소" id="emailAddress" name="emailAddress">
				<div class="es">
				<select class = "form-control eSelect" id = "emailSelect">
					<option value = "">선택해주세요</option>
					<option value = "naver.com">naver.com</option>
					<option value = "hanmail.net">hanmail.net</option>
					<option value = "gmail.com">gmail.com</option>
					<option value = "nate.com">nate.com</option>
					<option value = "hotmail.com">hotmail.com</option>
					<option value = "dreamwiz.com">dreamwiz.com</option>
					<option value = "freechal.com">freechal.com</option>
					<option value = "hanmir.com">hanmir.com</option>
					<option value = "korea.com">korea.com</option>
					<option value = "paran.com">paran.com</option>
					<option value = "etc"> 직접입력</option>
				</select>
				</div>
				<button type="button" id="emailCheck" class="emailCheck">이메일 전송</button>
				<input type="text" id ="emailCheckNumber" title="인증번호 입력" name="emailCheckNumber" placeholder="인증번호를 입력해 주세요.">
				<button type="button" id="finalCheck">확인</button>
				<input type="password" id = "changePw" placeholder="변경할 비밀번호를 입력.">
				<input type="password" id = "checkPw" placeholder="비밀번호를 다시 한번 입력.">
				<button type="button" id = "pwInsert" class="finalCheck">확인</button>
					<div id="result_emailNo" class="result_font" style="color: red"></div>
					<div id="result_emailOk" class="result_font" style="color: green"></div>
				</form>
				<a type="button" id="closeWindow" class="close_btn">닫기</a>
				</div>
			</div>
		</div>
</body>
</html>