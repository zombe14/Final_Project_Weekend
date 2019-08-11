$(function() {

	
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
		var email = $('#email').val();
		var phone = a+b+c;
		$('#phone').val(phone);
		if(a==''||b==''||c==''){
			alert("휴대폰 번호를 입력하세요");
			v = false;
		}else if(a!=''&&b!=''&&c!=''&&s=='0'){
			v = true;
		}else{
			v = false;
		}
		if(v){
			$("#frm").submit();
		}else{
			alert("필수 항목을 입력하세요");
		}
	});
	$('#emailCheck').click(function name() {
		var t = true;
		var f = true;
		var email_last = $('#memEmail_select').val();
		$('#email_adress').val(email_last);
		var email_first = $("#emailFirst").val();
		var email= email_first+'@'+email_last;
		$('#email').val(email);
		if(email_last==''){
			alert("이메일 주소를 입력하세요");
			t =false;
		}else{
			t = true;
		}
		if(email_first==''){
			alert("이메일 주소를 입력하세요");
			f = false;
		}else{
			f = true;
		}
		if(t&&f){
			$.ajax({
				data:{
					email : email
				},
				type: "POST",
				url: "../mail/mailSend",
				success:function(data){
					
				}
			});
		}else{
			$('#email_store').val('');
		}
	});
});