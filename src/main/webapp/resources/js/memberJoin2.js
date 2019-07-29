/**
 * 
 */$(function() {
/*<%-- 이메일  --%>*/
	$('#email_last')
				.blur(
						function() {
							var email_first = $('#email_first').val();
							var email_last = $(this).val();
							var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							var email = email_first + "@" + email_last;

							if (email.match(emailexp) != null) {
								// ajax 실행
								$
										.ajax({
											type : 'post',
											url : './memberemailCheck',
											data : {
												'email' : email
											},
											success : function(data) {
												if (data == 0) {
													$("#result").html("");
													$("#email").val('0');

												} else {
													$("#result").html(
															"이미 가입된 이메일입니다.");
													$("#email").val('');
												}
											}
										}); // end ajax
							} else {
								result.innerHTML = "이메일 형식이 올바르지 않습니다.";
								$("#email").val('');
							}

						});
		$('#email_first')
				.blur(
						function() {
							var email_first = $(this).val();
							var email_last = $('#email_last').val();
							var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							var email = email_first + "@" + email_last;
							if (email.match(emailexp) != null) {
								// ajax 실행
								$
										.ajax({
											type : 'post',
											url : './memberemailCheck',
											data : {
												'email' : email
											},
											success : function(data) {
												if (data == 0) {
													$("#result").html("");
													$("#email").val('0');
												} else {
													$("#result").html(
															"이미 가입된 이메일입니다.");
													$("#email").val('');
												}
											}
										}); // end ajax
							} else {
								result.innerHTML = "이메일 형식이 올바르지 않습니다.";
								$("#email").val('');
							}

						});
/*<%-- 비밀번호 --%>*/
	$('#pw')
				.blur(
						function() {
							var pw = document.getElementById("pw").value;
							var pwcheck = document.getElementById("pwcheck").value;
							var pattern1 = /[0-9]/;
							var pattern2 = /[a-zA-Z]/;
							var pattern3 = /[~!@\#$%<>^&*()_+-]/;

							if (pw.length == 0) {
								result_pw.innerHTML = "비밀번호를 입력해 주세요.";
								$("#pww").val('');
							} else if (!pattern1.test(pw) || !pattern2.test(pw)
									|| !pattern3.test(pw)) {
								result_pw.innerHTML = "비밀번호 대문자, 소문자, 숫자, 특수문자 중 3가지가 포함되야 합니다";
								$("#pww").val('');
								return false;
							} else if (pw.length<8&&pw.length>0) {
								result_pw.innerHTML = "비밀번호는 8글자 이상어야합니다";
								$("#pww").val('');
							} else {
								result_pw.innerHTML = "";
								$("#pww").val('0');
							}

						});
		$('#pwcheck').blur(function() {
			var pw = document.getElementById("pw").value;
			var pwcheck = document.getElementById("pwcheck").value;
			if (pwcheck.lenght == 0) {
				result_pwpw.innerHTML = "비밀번호 확인을 입력해 주세요.";
				$("#pwwcheck").val('');
			} else if (pw == pwcheck) {
				result_pwpw.innerHTML = "";
				$("#pwwcheck").val('0');
			} else {
				result_pwpw.innerHTML = "비밀번호가 일치하지 않습니다.";
				$("#pwwcheck").val('');
			}
		});
/*<%-- 별명  --%>*/
	$('#nickname').blur(function() {
			var nickname = document.getElementById("nickname");
			var nickname_val = document.getElementById("nickname").value;
			if (nickname_val.length == 0) {
				result_nickname.innerHTML = "별명을 입력 해 주세요";
				$("#nickname1").val('');
			} else if (nickname_val.length > 1 && nickname_val.length < 16) {
/*<%-- 닉네임중복 확인 --%>*/
	var nickname = $(this).val();
				// ajax 실행
				$.ajax({
					type : 'post',
					url : './membernicknameCheck',
					data : {
						'nickname' : nickname
					},
					success : function(data) {
						if (data == 0) {
							$("#result_nickname").html("사용 가능한 아이디 입니다.");
							$("#nickname1").val('0');

						} else {
							$("#result_nickname").html("사용 불가능한 아이디 입니다.");
							$("#nickname1").val('');
						}
					}
				}); // end ajax
				// end keyup

			} else if (nickname_val.length > 15) {
				result_nickname.innerHTML = "별명은 15글자 이하여야 합니다.";
				$("#nickname1").val('');
			} else if (nickname_val.length == 1) {
				result_nickname.innerHTML = "별명은 최소 2글자 이상이어야 합니다.";
				$("#nickname1").val('');
			} else {

			}

		});
/*<%--  약관 동의  --%>*/
	$('#checkAll').click(function() {
			var c = $(this).prop('checked');
			$('.check').prop('checked', c);
		});
		//*************************************

		$('.check').click(function() {
			var c = true;
			$('.check').each(function() {
				if (!$(this).prop('checked')) {
					c = false;
				}
			});
			$('#checkAll').prop('checked', c);
		});

		//*************************************

		$('#join').click(function() {
			var d = $('#checkAll').prop('checked');
			/*
<%-- 약관동의 필수와 선택 --%>*/
			var a = $('#checka').prop('checked');
			var b = $('#checkb').prop('checked');
			var c = $('#checkc').prop('checked');
			var r = true;
			$(".form-control").each(function() {
				var nickname1 = $('#nickname1').val();
				var pwwcheck = $('#pwwcheck').val();
				var pww = $('#pww').val();
				var email = $('#email').val();
				if ($(this).val() == ''||nickname1==''  ||pwwcheck==''  ||pww==''||email=='') {
					r = false;
				}
			});
			var pw = document.getElementById("pw").value;
			var pwcheck = document.getElementById("pwcheck").value;
			if(pw==pwcheck){
				
			}else{
				result_pwpw.innerHTML = "비밀번호가 일치하지 않습니다.";
				r=false;
			}
			if (r) {
				if (d) {
					$("#frm").submit();
					//	location.href="./memberJoin";
				} else if (a & b & c) {
					$("#frm").submit();
					//	location.href="./memberJoin";
				} else {
					//	alert('약관에 동의');
				}
			} else {
				// alert('모두 작성');
			}
		});
	});