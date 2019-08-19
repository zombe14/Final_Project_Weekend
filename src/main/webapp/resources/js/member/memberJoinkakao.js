
$(function() {
	$('#emailCodeCheckbt').hide();
	$('#id').attr('readonly', true);
	$('#name').attr('readonly', true);
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
				url: "../mail/mailSending",
				success:function(data){
					if(data==1){
						$('#emailFirst').attr('readonly', true);
						$('#memEmail_select').hide();
						$('#emailCodeCheckbt').show();
						$("#emailCodeCheck").attr('type', 'text');
					}else{
						alert("중복된 이메일입니다.");
					}
				}
			});
		}else{
			$('#email_store').val('');
		}
	});
	$("#emailCodeCheckbt").click(function() {
		var emailCode = $('#emailCodeCheck').val();
		$.ajax({
			data:{
				Code : emailCode
			},
			type: "POST",
			url: "../mail/mailCheck",
			success:function(data){
				if(data==1){
					$("#result_emailCodeCheckbt").val('0');
					$('#emailCodeCheckbt').hide();
					$('#emailCheck').hide();
					$("#emailCodeCheck").attr('type', 'hidden');
					alert("인증이 완료되었습니다.");
				}else{
					alert("코드가 일치하지 않습니다.");
				}
			}
		});
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
		var v = true;
		var nicknameCheck = document.getElementById("nicknameCheck").value;
		var pw = 1;
		var pwCheck = 1;
		var pww =0;
		var pwwcheck = 0;
		var memNamecheck = $("#memNamecheck").val();
		var jumin = $("#juminnumCheck").val();
		var emailCheck = $("#result_emailCodeCheckbt").val();
		var age = $('#age').val();
		var a = $('#num_select').val();
		var b = $('#hp2').val();
		var c = $('#hp3').val();
		var s = $('#email_store').val();
		var d = true;
		var phone = a+b+c;
		$('#phone').val(phone);
		if(a==''||b==''||c==''){
			alert("휴대폰 번호를 입력하세요");
			d = false;
		}else if(a!=''&&b!=''&&c!=''){
			d = true;
		}else{
			d=false;
		}
		var finalpw = false;
		if(pw==pwCheck){
			finalpw = true;
			if(nicknameCheck=='0'&&finalpw&&jumin=='0'&&d){
				alert("완료");
				$("#frm").submit();
			}else if(nicknameCheck!='0'){
				alert("활동명을 입력하세요");
			}else if(jumin!='0'){	
				alert("주민번호를 확인해주세요");
			}else{
				alert("비밀번호나 이름을 확인해주세요");
			}
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			finalpw = false;
		}
		
	});

	$("#nicknameCheckbt").click(function() {
		var nickname = $("#nickname").val();
		nicknametrim = nickname.trim();
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
						$("#nicknameCheckbt").attr('type', 'hidden');
						$("#result_nicknameCheck").val('0');
					}
				}
				
			});
		}
	});
	
	$('#juminnum').click(function() {
		var num1 = document.getElementById("unum1");
        var num2 = document.getElementById("unum2");
        var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        var arrNum2 = new Array();
        var jumins3 = $("#unum1").val() + $("#unum2").val(); //주민등록번호 생년월일 전달 
        var jumin1 = jumins3;
        var fmt = RegExp(/^\d{6}[1234]\d{6}$/) //포멧 설정 
		var buf = new Array(13); //주민번호 유효성 검사
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1);
	    var day = date.getDate();  
	    if (month < 10) month = '0' + month;
	    if (day < 10) day = '0' + day;
	    var monthDay = month + day;
		var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
		birthYear += $("#unum1").val().substr(0, 2); 
		birthmd = $("#unum1").val().substr(2, 4);
		
		var age = monthDay < birthmd ? year - birthYear - 1 : year - birthYear;
		$('#age').val(age);
		$("#jumin").val(jumin1);
		var jumins = $("#jumin").val();
		if (!fmt.test(jumins3)) {
			alert("주민등록번호 형식에 맞게 입력해주세요"); $("#unum1").focus(); 
			$("#juminnumCheck").val('');
		}else{
		//주민번호 존재 검사 
		for (var i = 0; i < buf.length; i++){ 
			buf[i] = parseInt(jumins3.charAt(i)); 
		} 
		var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
		var sum = 0; 
		for (var i = 0; i < 12; i++){ 
			sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
		}
		if ((11 - (sum % 11)) % 10 != buf[12]) { 
			alert("잘못된 주민등록번호 입니다."); 
			$("#unum1").focus(); 
			$("#juminnumCheck").val('');
		}else{
			$.ajax({
				data:{
					jumin : jumins
				},
				type: "POST",
				url: "../member/getjumin",
				success:function(data){
					
				}
				
			});
			alert("사용가능한 주민번호입니다.");
			$("#juminnumCheck").val('0');
			$('.iTextnum').attr('readonly', true);
			$("#juminnum").attr('type', 'hidden');
		}
		}

	});
	


		
	

});
	














