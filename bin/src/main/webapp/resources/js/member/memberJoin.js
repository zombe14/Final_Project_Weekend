
$(function() {
	$("#pw").click(function () {
		var memid = $("#memid").val();
		var result_memid = $("#result_memid").val();
		if(memid==''||result_memid==''){
			alert('아이디 중복을 확인해주세요');
			$('#id').focus();
		}else{
			
		}
	});
	$("#pwCheck").focus(function() {
		var memid = $("#memid").val();
		var result_memid = $("#result_memid").val();
		if(memid==''||result_memid==''){
			alert('아이디 중복을 확인해주세요');
			$('#id').focus();
		}else{
			
		}
	});
	
	
	$("#memEmail_select").blur(function() {
		var t = true;
		var f = true;
		var email_last = $(this).val();
		$('#email_adress').val(email_last);
		var email_first = $("#emailFirst").val();
		var email= email_first+'@'+email_last;
		$('#email').val(email);
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
			$('#email_store').val("0");
		}else{
			$('#email_store').val('');
		}
	});
	$("#emailFirst").keyup(function(e) { 
		if (!(e.keyCode >=37 && e.keyCode<=40)) {
			var v = $(this).val();
			$(this).val(v.replace(/[^a-z0-9]/gi,''));
			result_mememail.innerHTML = "영문과 숫자로 입력해주세요.";
		}else{
			
		}
	});
	$("#emailFirst").blur(function() {
		var t = true;
		var f = true;
		var email_last=$('#memEmail_select').val();
		var email_first = $("#emailFirst").val();
		var email= email_first+'@'+email_last;
		$('#email').val(email);
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
			$('#email_store').val('0');
		}else{
			$('#email_store').val('');
		}
	});
	$('.certifyButtonWrapButton').click(function() {		
		var a = $('#num_select').val();
		var b = $('#hp2').val();
		var c = $('#hp3').val();
		var s = $('#email_store').val();
		var v = true;
		var phone = a+b+c;
		$('#phone').val(phone);
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
	
	$("#id").keyup(function(e) { 
		if (!(e.keyCode >=37 && e.keyCode<=40)) {
			var v = $(this).val();
			$(this).val(v.replace(/[^a-z0-9]/gi,''));
			result_memid.innerHTML = "영문과 숫자로 입력해주세요.";
		}else{
			result_memid.innerHTML = "";
		}
	});


	$("#id").blur(function() {
		var id = document.getElementById("id").value;
		if(id.length==0){
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
		var memid = $("#memid").val();
		if(memid==''){
			$('#id').focus();
		}else{
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
		}
	});
	
	$("#pwCheck").blur(function() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		var memid = $("#memid").val();
		if(memid==''){
			$('#id').focus();
		}else{
		if(pw==pwCheck){
			result_pwpw.innerHTML = "";
			$("#pwwcheck").val('0');
		}else{
			result_pwpw.innerHTML = "비밀번호가 일치하지 않습니다";
			$("#pwwcheck").val('');
		}
	}
	});
	
	$("#name").blur(function() {
		var num_select = $("#num_select").val();
		var hp2 = $("#hp2").val();
		var hp3 = $("#hp3").val();
		var phone = num_select + hp2 + hp3;
		var memName = $(this).val();
		if(memName.length==0){
			result_memNamecheck.innerHTML = "이름을 입력하세요";
			$("#memNamecheck").val('');
		}else{
			result_memNamecheck.innerHTML = "";
			$("#memNamecheck").val('0');
		}
	});
	$("#nickname").blur(function() {
		var nickname = $(this).val();
		if(nickname.length==0){
			$("#nicknameCheck").val('');
		}else{
			$("#nicknameCheck").val('0');
		}
	});
	
	$(".certifyButtonWrap_final").click(function() {
		var num_select = $("#num_select").val();
		var hp2 = $("#hp2").val();
		var hp3 = $("#hp3").val();
		var phone = num_select + hp2 + hp3;
		var s = $('#email_store').val();
		var v = true;
		if(num_select==''||hp2==''||hp3==''){
			alert("휴대폰 번호를 입력하세요");
			v = false;
		}else if(hp3!=''&&hp2!=''&&num_select!=''&&s=='0'){
			v = true;
		}else if(s==''){
			alert("이메일을 입력하세요");
			v= false;
		}else{
			v = false;
		}
		var nicknameCheck = document.getElementById("nicknameCheck").value;
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		var pww = $("#pww").val();
		var pwwcheck = $("#pwwcheck").val();
		var memNamecheck = $("#memNamecheck").val();
		
		var finalpw = false;
		if(pw==pwCheck){
			finalpw = true;
			if(v&&pww=='0'&&pwwcheck=='0'&&memNamecheck=='0'&&nicknameCheck=='0'&&finalpw){
				alert('성공');
				$("#frm").submit();
			}else if(nicknameCheck!='0'){
				alert("활동명을 입력하세요");
			}else{	
				alert("비밀번호나 이름을 확인해주세요");
			}
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			finalpw = false;
		}
	});
	
	$("#memberidCheck").click(function() {
		var id = $('#id').val();
		idd = id.trim();
		if(idd==''){
			alert('아이디를 입력하세요');
		}else{
			$.ajax({
				data:{
					id : id
				},
				type: "POST",
				url: "../member/getId",
				success:function(data){
					if(data==1){
						alert("이미 아이디가 존재합니다");
					}else{
						alert("사용가능한 아이디 입니다")
						$('#id').attr('readonly', true);
						$("#memberidCheck").attr('type', 'hidden');
						$("#result_memid").val('0');
					}
				}
				
			});
		}
	});
	$("#nicknameCheck").click(function() {
		var nickname = $("#nickname").val();
		var nicknametrim = nickname.trim();
		if(nicknametrim==''){
			alert('활동명을 입력하세요');
		}else{
			$.ajax({
				data:{
					nickname : nickname
				},
				type: "POST",
				url: "../member/getNickname",
				success:function(data){
					if(data==1){
						alert("이미 존재하는 활동명입니다");
						$("#result_nicknameCheck").val('');
					}else{
						alert("사용가능한 활동명 입니다");
						$('#nickname').attr('readonly', true);
						$("#nicknameCheck").attr('type', 'hidden');
						$("#result_nicknameCheck").val('0');
					}
				}
				
			});
		}
	});
});
	













