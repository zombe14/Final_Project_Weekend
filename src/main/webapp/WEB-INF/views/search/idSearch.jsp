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
		<button type="submit" id="emailCheck" class="emailCheck">인증번호 보내기</button>
		<input type="text" id ="emailCheckNumber" name="emailCheckNumber" placeholder="인증번호를 입력해 주세요.">
	</form>

</body>
</html>