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
		var Onickname = $("#nickname").val();
		// 닉네임 확인 여부;
		var nCheck = false;
		// 닉네임 중복 확인;
		$("#nCheck").on("click", function () {
			var nickname = $("#nickname").val();
			if(nickname == Onickname){
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
						$("#nickname").val(Onickname);
					}else{
						//여기는  data == 0 일때, 즉 사용가능한 닉네임일때
						var check = confirm("사용가능한 닉네임 입니다. 사용하시겠습니까?");
						if(check){
							// 사용하겠다고 누른 경우;
							$("#nickname").prop('readonly', true);
							$("#nCheck").hide();
							nCheck = true;
						}else{
							// 사용안하겠다고 누른경우;
							alert("사용하실 닉네임을 기입 후 중복체크를 눌러주세요.");
							$("#nickname").val(Onickname);
						}
					}
				} // function 끝;
				) // 기존 닉네임이랑 다른데 중복체크를 누른 경우 끝;
			} // 기존 닉네임 일치 여부 확인 끝;
		})// 닉네임 중복확인 끝;

		/////////////////////////////// 전화번호 변경;
		// 기존 전화번호 보관;
		var Ophone = $("#phone").val();
		// 전화번호 확인 여부;
		var pCheck = false;
		$("#pCheck").on("click", function () {
			var phone = $("#phone").val();
			if(phone == Ophone){
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
						$("#phone").val(Ophone);
					}else{
						// data = 0 즉, 사용 가능한 번호인 경우 코드;
						var check = confirm("사용 가능한 전화번호 입니다. 사용하시겠습니까?");
						if(check){
							// 확인된 전화번호를 사용하겠다는 코드;
							$("#phone").prop('readonly', true);
							$("#pCheck").hide();
							pCheck = true;
						}else{
							// 확인된 전화번호를 사용하지 않겠따는 코드;
							alert("사용하실 전화번호를 기입 후 중복체크를 눌러주세요.");
							$("#phone").val(Ophone);
						}
					}
				} // 중복확인 function 끝; 
				) // 중복확인 post 끝;
			} // 기존 전화번호 일치 여부 확인 끝;
		}) // 전화번호 중복확인 끝;
		
		
		
		
		
		/////////////////////////////// 이메일 변경;
		// 기존 이메일 보관;
		var Oemail = $("#email").val();
		// 이메일 확인 여부;
		var eCheck = true;
		
		
		
		/////////////////////////////// 수정 폼 보내기;
		$("#uBtn").on("click", function () {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pw").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var nickname = $("#nickname").val();
			var reg_date = $("#reg_date").val();
			var grade = $("#grade").val();
			// 닉네임, 전화번호, 이메일을 모두 확인했는지 확인하는 코드;
			if (nCheck == !true){
				alert("닉네임 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation()
			}else if(pCheck == !true){
				alert("전화번호 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation()
			}else if(eCheck == !true){
				alert("이메일 중복확인이 필요합니다.");
				// 이후 이벤트를 모두 중지시키는 코드;
				event.stiplmmediatePropagation()
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
							alert("수정에 실패하였습니다. \n 비밀번호를 다시 확인해 주세요");
							location.href = "./mInfoList";
						}
					}// post 보낸뒤 function 끝;
				)//$.post 끝;
			}// if(check) 끝;
		})//#pBtn 끝;
		
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
		      				<input type="text" class="form-control" id="email" name="email" value="${member.email}" >
		      				<button type="submit" class="btn btn-default" id="eCheck">중복확인</button>
		      				<div id="result_phoneOk" class="result_font" style="color: green"></div>
		    			</div>
		    			<div class="form-group">
		      				<label>가입날짜:</label>
		      				<input type="text" class="form-control" readonly="readonly" id="reg_date" name="reg_date" value="${member.reg_date}" >
		    			</div>
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
</body>
</html>
