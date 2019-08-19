<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(function () {
		$("#emailCheck").on("click", function () {
			var emailId = $("#emailId").val();
			var add = $("#add").text();
			var emailAddress = $("#emailAddress").val();
			var email = emailId + add + emailAddress;
			alert(email);
			console.log(email);
			$.post("../myPage/mEmailCheck",{
				email : email
			}, function (data) {
					console.log(data);
				if(data == 1){
					alert("이제 이메일 인증번호를 보내면 된다!");
				}else{
					alert("존재하지 않는 이메일 입니다.\n다시 확인해 주세요.");
				}
			}
			)
		})
	})
</script>
	<form>
		<input type="text" class="form-control" title="이메일 아이디" placeholder="회원가입당시 이메일 주소" id="emailId" name="emailId" maxlength="50">
			<span class="from-control" id = "add">@</span>
		<input type="text" class="form-control" title="이메일 주소" id="emailAddress" name="emailAddress">
			<select class = "form-control" id = "emailSelect" class="eSelect">
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
		<button type="button" id="emailCheck" class="emailCheck">인증번호 보내기</button>
		<input type="text" id ="emailCheckNumber" title="인증번호 입력" name="emailCheckNumber" placeholder="인증번호를 입력해 주세요.">
		<button type="button" id="finalCheck">확인</button>
		<div id="result_emailOk" class="result_font" style="color: green"></div>
	</form>

</body>
</html>