$(function() {
	$("#memEmail_select").blur(function() {
		var t = true;
		var f = true;
		var email_last = $(this).val();
		$('#email_adress').val(email_last);
		var email_first = $("#emailFirst").val();
		var email= 'email_last' +'@'+'email_first';
		if(email_last==''){
			t =false;
		}else{
			t = true;
		}
		if(email_first==''){
			f = false;
		}else{
			f = true;
		}
		if(t&&f){
			$('#email_store').val("true");
		}else{
			$('#email_store').val("false");
		}
	});
	$("#emailFirst").blur(function() {
		var t = true;
		var f = true;
		var email_last=$('#memEmail_select').val();
		var email_first = $("#emailFirst").val();
		var email= 'email_last' +'@'+'email_first';
		if(email_last==''){
			t =false;
		}else{
			t = true;
		}
		if(email_first==''){
			f = false;
		}else{
			f = true;
		}
		if(t&&f){
			$('#email_store').val("true");
		}else{
			$('#email_store').val("false");
		}
	});
	$('.certifyButtonWrap').click(function() {
		var a = $('#num_select').val();
		var b = $('#hp2').val();
		var c = $('#hp3').val();
		var s = $('#email_store').val();
		var v = true;
		var phone = a+b+c;
		if(a==''||b==''||c==''){
			alert("휴대폰 번호를 입력하세요");
			v = false;
		}else if(a!=''&&b!=''&&c!=''&&s=='true'){
			v = true;
		}else{
			v = false;
		}
		if(v){
			location.href="../";
		}else{
			alert("필수 항목을 입력하세요");
		}
	});
	
	$("#idCheck").blur(function() {
		var idCheck = document.getElementById("idCheck").value;
		if(idCheck.length==0){
			result_memid.innerHTML = "아이디를 입력해 주세요.";
			$("#memid").val('');
		}else{
			result_memid.innerHTML = "";
			$("#memid").val('0');
		}
		
	});
	
	$('#pw').blur(function() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@\#$%<>^&*()_+-]/;
			if (pw.length == 0) {
			result_pw.innerHTML = "비밀번호를 입력해 주세요.";
			$("#pww").val('');
		} else if (!pattern1.test(pw) || !pattern2.test(pw)	|| !pattern3.test(pw)) {
			result_pw.innerHTML = "비밀번호 대문자, 소문자, 숫자, 특수문자 중 3가지가 포함되야 합니다";
			$("#pww").val('');
			return false;
		} else if (pw.length<=12&&pw.length>=8) {
			result_pw.innerHTML = "";
			$("#pww").val('0');
		} else{
			result_pw.innerHTML = "8~12자까지 설정해 주세요";
			$("#pww").val('');
		}
	});
	
	$("#pwCheck").blur(function() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		if(pw==pwCheck){
			result_pwpw.innerHTML = "";
			$("#pwwcheck").val('0');
		}else{
			result_pwpw.innerHTML = "비밀번호가 일치하지 않습니다";
			$("#pwwcheck").val('');
		}
	});
	
	$("#memName").blur(function() {
		var memName = $(this).val();
		if(memName.length==0){
			result_memNamecheck.innerHTML = "이름을 입력하세요";
			$("#memNamecheck").val('');
		}else{
			result_memNamecheck.innerHTML = "";
			$("#memNamecheck").val('0');
		}
	});
	$(".certifyButtonWrap_final").click(function() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		var pww = $("#pww").val();
		var pwwcheck = $("#pwwcheck").val();
		var memNamecheck = $("#memNamecheck").val();
		
		var finalpw = true;
		if(pw==pwCheck){
			finalpw = true;
			if(pww=='0'&&pwwcheck=='0'&&memNamecheck=='0'&&finalpw){
				alert("회원가입성공");
			}else{
				alert("비밀번호나 이름을 확인해주세요");
			}
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			finalpw = false;
		}
		
		
	});
	
	
});
	














