<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - ${title} </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		/////////////////////////////// 닉네임 변경;
		// 기존 닉네임 보관;
		var oNickname = $("#nickname").val();
		// 닉네임 확인 여부;
		var nCheck = false;
		// 닉네임 중복 확인;
		$("#nCheck").on("click", function () {
			var nickname = $("#nickname").val();
			if(nickname == oNickname){
				var check = confirm("기존의 닉네임을 그대로 사용하시겠습니까?");
				if (check){
					//기존 닉네임을 사용한다고 누른 경우;
					result_nicknameOk.innerHTML='기존 닉네임을 사용합니다.';
					$("#nickname").prop('readonly', true);
					$("#nCheck").hide();
					nCheck = true;
				}else{
					// 기존 닉네임을 사용하지 않는다고 누른 경우;
					alert("사용하실 닉네임을 기입 후 \n중복체크를 눌러주세요.");
					event.preventDefault();
				}//기존 닉네임 사용여부 끝
			}else{
				// 여기는 기존 닉네임이랑 다른데 중복체크를 누른 경우;
				$.post("../member/getNickname",{
					nickname : nickname
				}, function(data){
					if(data == 1){
						// 사용불가능한 닉네임일때
						alert("이미 사용중인 닉네임 입니다.")
						$("#nickname").val(oNickname);
					}else{
						//여기는  data == 0 일때, 즉 사용가능한 닉네임일때
						var check = confirm("사용가능한 닉네임 입니다. 사용하시겠습니까?");
						if(check){
							// 사용하겠다고 누른 경우;
							$("#nickname").prop('readonly', true);
							$("#nCheck").hide();
							result_nicknameOk.innerHTML='중복확인이 완료되었습니다.';
							nCheck = true;
						}else{
							// 사용안하겠다고 누른경우;
							alert("사용하실 닉네임을 기입 후 중복체크를 눌러주세요.");
							$("#nickname").val(oNickname);
						}
					}
				} // function 끝;
				) // 기존 닉네임이랑 다른데 중복체크를 누른 경우 끝;
			} // 기존 닉네임 일치 여부 확인 끝;
		})// 닉네임 중복확인 끝;
		/////////////////////////////// 전화번호 변경;
		// 기존 전화번호 보관;
		var oPhone = $("#phone").val();
		// 전화번호 확인 여부;
		var pCheck = false;
		$("#pCheck").on("click", function () {
			var phone = $("#phone").val();
			if(phone == oPhone){
				var check = confirm("기존 전화번호를 그대로 사용하시겠습니까?");
				if(check){
					// 기존 전화번호를 그대로 사용하겠다는 코드;
					result_phoneOk.innerHTML = '기존 전화번호를 사용합니다.';
					$("#phone").prop('readonly', true);
					$("#pCheck").hide();
					pCheck = true;
				}else{
					// 기존 전화번호를 그대로 사용하지 않겠다는 코드;
					alert("사용하실 전화번호를 기입 후 중복체크를 눌러주세요.");
					event.preventDefault();
				}
			}else{
				//기존 전화번호와 일치하지 않을경우의 코드;
				$.post("./mPhoneCheck",{
					phone : phone
				}, function (data) {
					if(data == 1){
						// data = 1 즉, 이미 존재하는 번호일 경우 코드;
						alert("이미 존재하는 전화번호 입니다.");
						$("#phone").val(oPhone);
					}else{
						// data = 0 즉, 사용 가능한 번호인 경우 코드;
						var check = confirm("사용 가능한 전화번호 입니다. 사용하시겠습니까?");
						if(check){
							// 확인된 전화번호를 사용하겠다는 코드;
							$("#phone").prop('readonly', true);
							$("#pCheck").hide();
							result_phoneOk.innerHTML = '중복확인이 완료되었습니다.';
							pCheck = true;
						}else{
							// 확인된 전화번호를 사용하지 않겠다는 코드;
							alert("사용하실 전화번호를 기입 후 중복체크를 눌러주세요.");
							$("#phone").val(oPhone);
						}
					}
				} // 중복확인 function 끝; 
				) // 중복확인 post 끝;
			} // 기존 전화번호 일치 여부 확인 끝;
		}) // 전화번호 중복확인 끝;
		/////////////////////////////// 이메일 변경;
		// 이메일로 온 번호로 마지막 인증하는 버튼 숨겨놓기;
		$("#eCheck3").hide();
		// 이메일 인증버튼 숨겨놓기;
		$("#eCheck2").hide();
		// 인증번호 입력버튼 숨겨놓기;
		$("#emailCheckNumber").hide();
		// 기존 이메일;
		var oEmail = $("#oEmail").val();
		// 기존 이메일 총 길이;
		var oEmailLength = oEmail.length;
		// @ 위치;
		var oEmailPosition =oEmail.indexOf('@');
		// 기존 이메일 아이디;
		var oEmailId = oEmail.substr(0,oEmailPosition);
		// 기존 이메일 주소;
		var oEmailAddress = oEmail.substr(oEmailPosition+1, oEmailLength);
		// 기존 이메일 주소를 초기 창에 뿌림;
		$("#emailId").val(oEmailId);
		$("#emailAddress").val(oEmailAddress);
		// 골벵이;
		var add = $("#add").text();
		// 이메일 확인 여부;
		var eCheck = false;
		// 인증시 사용할 이메일;
		var email = "";
		// 이메일 select 이벤트시 설정;
		$("#emailSelect").on("change", function(){
			// select에서 선택한 값을 이메일 주소로 사용하기 위해 eAddressChange에 넣는다;
			var eAddressChange = $("#emailSelect option:selected").val();
			// ""인지 주소를 선택했는지 확인하기 위한 if를 돌린다;
			if (eAddressChange == 'etc'){
				// etc 즉 이메일을 직접 입력하겠다는 의도 고로 입력창의 readOnly를 푼다;
				$("#emailAddress").prop('readonly', false);
				// 주소창을 초기화 시킨다;
				$("#emailAddress").val('');
			}else if(eAddressChange == ""){
				// 그냥 기존의 이메일을 쓰겠다는 의도 걍 아무것도 하지 말고 냅두자!;
			}else{
				// 새로 입력한 주소가 들어왔음, 고로 emailAddress에 넣어주는 코드를 쓴다;
				var a = $("#emailAddress").val(eAddressChange);
			}
		});
		$("#eCheck").on("click", function () {
			// 중복체크 클릭시 이메일 완성;
			// 입력한 ID를 받아온다;
			var emailId = $("#emailId").val();
			// 입력한 Address를 받아온다;
			var emailAddress = $("#emailAddress").val();
			// 주소를 완성시킨다;
			email = emailId+add+emailAddress;
			// 중복체크 클릭시 기존 이메일인지 확인 후 사용여부;
			if(email == oEmail){
				var check = confirm("기존 이메일을 그대로 사용하시겠습니까?");
				if(check){
					// 기존 메일을 그대로 사용하겠다는 코드;
					result_emailOk.innerHTML = '기존 이메일을 사용합니다.';
					// 이메일 아이디 입력버튼 잠금;
					$("#emailId").prop('readonly', true);
					// 이메일 주소 입력버튼 잠금;
					$("#emailAddress").prop('readonly', true);
					// 중복체크 숨기기;
					$("#eCheck").hide();
					// 주소선택 태그 숨기기;
					$("#emailSelect").hide();
					eCheck = true;
				}else{
					// 기존 메일을 그대로 사용안하겠다는 코드;
					alert("사용하실 이메일을 기입 후 중복체크를 눌러주세요.");
					event.preventDefault();
				}
			}else{
				//기존 이메일과 일치하지 않을경우의 코드;
				$.post("./mEmailCheck",{
					email : email
				}, function(data){
					if(data == 1){
						// data == 1 즉, 이미 존재하는 이메일일 경우 코드;
						alert("이미 존재하는 이메일 입니다.");
						$("#email").val(oEmail);
					}else{
						// data == 0 즉, 사용 가능한 이메일일 경우 코드;
						var check = confirm("사용 가능한 이메일입니다. 사용하시겠습니까?");
						if(check){
							// 중복체크한 이메일을 쓰겠다는 코드;
							alert("이메일 인증버튼을 눌러 이메일을 인증해 주세요.");
							// 중복확인 버튼 숨기기;
							$("#eCheck").hide();
							// 이메일 인증 버튼 생성;
							$("#eCheck2").show();
							// 이메일 아이디 입력버튼 잠금;
							$("#emailId").prop('readonly', true);
							// 주소 선택 태그 잠금;
							$("#emailAddress").prop('readonly', true);
							// 주소선택 태그 숨기기;
							$("#emailSelect").hide();
						}else{
							// 새로운 이메일을 쓰겠다는 코드;
							alert("사용하실 이메일을 기입 후 중복체크를 눌러주세요.");
							$("#email").val(oEmail);
						}// 중복체크한 이메일 사용 여부 끝;
					} // 중복확인용 function 끝;
				} // email 값을 보내서 중복여부 확인 끝;
				)
			} // 기존 이메일 일치 여부 확인 끝;
		}); // eBtn 끝;
		// 이메일 인증;
		$("#eCheck2").on("click", function(){
			$.post("../mail/mailSending",{
				email : email
			},function(data){
				if(data == 1){
					// data가 1이다. 즉, 인증메일이 보내졌다.
					alert("인증번호가 발송되었습니다.\n확인후 번호를 입력해주세요.");
					$("#eCheck2").hide();
					$("#eCheck3").show();
					$("#emailCheckNumber").show();
				}else{
					// data가 1이 아니다. 즉, 인증메일이 안보내졌다.
					alert("인증번호 발송에 실파하였습니다.\n다시 시도해주세요.");
				}
			} // function 끝;
			) // $.post 끝;
		});// eCheck2 끝;
		// 인증번호로 최종 마무리 짓기;
		$("#eCheck3").on("click", function () {
			var Code = $("#emailCheckNumber").val();
			$.post("../mail/mailCheck",{
				Code : Code
			}, function(data){
					if(data == 1){
					// 인증번호가 맞았을때 코드;
					alert("이메일 인증이 완료되었습니다.");
					$("#eCheck3").hide();
					$("#emailCheckNumber").hide();
					result_emailOk.innerHTML = '이메일 인증이 완료되었습니다.';
					result_emailOk.innerHTML = '중복확인이 완료되었습니다.';
					eCheck = true;
						}else{
					// 인증번호가 틀렸을때 코드;
					alert("인증번호가 잘못되었습니다.\n다시 진행해주세요.");
					email = oEmail;
					}
				} // function 끝;
			) // post 끝;
		}); // eCheck3 끝;
		///////////////////////////// 수정 폼 보내기;
		$("#uBtn").on("click", function () {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pw").val();
			var phone = $("#phone").val();
			var nickname = $("#nickname").val();
			var reg_date = $("#reg_date").val();
			var grade = $("#grade").val();
			// 닉네임, 전화번호, 이메일을 모두 확인했는지 확인하는 코드;
			if (nCheck == !true){
				alert("닉네임 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation();
			}else if(pCheck == !true){
				alert("전화번호 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation();
			}else if(eCheck == !true){
				alert("이메일 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation();
			}
			var check = confirm("수정을 마치시겠습니까?");
			if(check){
				$.post("../myPage/mInfoList",{
					id : id,
					pw : pw,
					nickname : nickname,
					email : email,
					phone : phone,
					reg_date : reg_date,
					grade : grade
					}, function(data){
						if(data == 1){
							alert("수정이 완료되었습니다.");
							location.href = "./mInfoList";
						}else{
							alert("수정에 실패하였습니다. \n비밀번호를 다시 확인해 주세요");
							location.href = "./mInfoList";
						}
					}// post 보낸뒤 function 끝;
				)//$.post 끝;
			}// if(check) 끝;
		})//#pBtn 끝;
		// 모두 취소하고 되돌아가기;
		$("#gBtn").on("click",function(){
			var check = confirm("변경사항을 모두 취소하고 돌아가시겠습니까?")
			if(check){
				location.href = "./myMain";
			}else{
				alert("정보 수정을 계속 진행합니다.");
			}
		})// #Btn 끝;
	});// 가장 밖 function 끝;
</script>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<!-- body 전부를 감쌈  -->
		<div id="container">
			<div class="conta">
				<div class="call_quick mypage_quick">
					<form>
		    			<div class="form-group">
		      				<label>아이디:</label>
		      				<input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${member.id}">
		    			</div>
						<div class="form-group">
		      				<label>비밀번호:</label>
		      				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		    			</div>
		    			<div class="form-group">
		      				<label>닉네임:</label>
		      				<input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}" >
		      				<button type="button" class="btn btn-default" id="nCheck">중복확인</button>
		      				<div id="result_nicknameOk" class="result_font" style="color: green"></div>
		    			</div>
		    			<div class="form-group">
		      				<label>나의 등급:</label>
		      				<input type="text" class="form-control" readonly="readonly" id="grade" name="grade" value="${member.grade}">
		    			</div>
						<div class="form-group">
		      				<label>전화번호:</label>
		      				<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" >
		      				<button type="button" class="btn btn-default" id="pCheck">중복확인</button>
		      				<div id="result_phoneOk" class="result_font" style="color: green"></div>
		    			</div>
		    			<div class="form-group">
		    				<label>이메일:</label>
		    					<!-- 이거슨 어따 쓰는 것인가... -->
		    					<input type="hidden" name="myemail">
		    					<!-- 여기엔 내가 쓴 이메일 아이디가 온다. -->
		    					<input type="text" class="form-control" title="이메일 아이디" id="emailId" name="emailId" maxlength="50">
		    						<span class="from-control" id = "add">@</span>
		    					<!-- 여기로 선택한 이메일 주소가 와야됨. -->
		    					<input type="text" class="form-control" title="이메일 주소" readonly="readonly" id="emailAddress" name="emailAddress">
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
		    					<button type="button" class="btn btn-default" id="eCheck">중복확인</button>
		    					<button type="button" class="btn btn-default" id="eCheck2">인증코드 보내기</button>
		    					<input type="text" class="form-control" title="인증번호 입력" placeholder="번호를 입력해 주세요." id="emailCheckNumber">
		      					<button type="button" class="btn btn-default" id="eCheck3">확인</button>
		      					<div id="result_emailOk" class="result_font" style="color: green"></div>
		    				</div>
		    				<div class="form-group">
			      				<label>가입날짜:</label>
			      				<input type="text" class="form-control" readonly="readonly" id="reg_date" name="reg_date" value="${member.reg_date}" >
			    			</div>
			    			<input type="hidden" id ="oEmail" name="oEmail" value="${member.email}">
		    				<input type="hidden" id ="grade" name="grade" value="${member.grade}">
		  					<button type="button" class="btn btn-default" id ="uBtn">수정 완료</button>
		  					<button type="button" class="btn btn-default" id ="gBtn">되돌아 가기</button>
		 				</form>
					</div>
				</div>
			</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.png"></a>
</body>
</html>
