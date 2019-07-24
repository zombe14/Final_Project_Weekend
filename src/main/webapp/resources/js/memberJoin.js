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
	
	
	
	
});
	



