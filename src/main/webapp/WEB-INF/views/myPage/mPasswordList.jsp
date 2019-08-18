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
		
		// 기존 비밀번호를 뒤에쳐서 새 비밀번호와 똑같이 쓰는것 방지용;
		$("#pw").blur(function(){
			var pw = $("#pw").val();
			var npw = $("#npw").val();
			if(pw == npw && pw == !null){
				result_pw.innerHTML = "새 비밀번호와 같은 비밀번호입니다. 다시 입력해 주세요.";
				pw = $("#pw").val('');
				npw = $("#npw").val('');
			}
		});
		$("#pw").focus(function () {
			result_pw.innerHTML = "";
		})
		
		// 새 비밀번호 조건 충족 확인;
		$("#npw").blur(function (){
			var pw = $("#pw").val();
			var npw = $("#npw").val();
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@\#$%<>^&*()_+-]/;
			// 비밀번호 길이 확인;
			if(npw.length < 8 || npw.length > 12){
				result_npw.innerHTML = "비밀번호는 8~12자로 설정해야 합니다.";
				npw = $("#npw").val('');
			// 특수문자 조건 확인;
			}else if(!pattern1.test(npw) || !pattern2.test(npw)	|| !pattern3.test(npw)){
				result_npw.innerHTML = "비밀번호는 대문자, 소문자, 숫자, 특수문자 3가지가 포함되야 합니다";
				npw = $("#npw").val('');
			}else if(pw == npw){
				result_npw.innerHTML = "기존에 사용하던 비밀번호 입니다. 새로운 비밀번호로 입력해 주세요.";
				npw = $("#npw").val('');
			};
		});// npw focus 끝;
		
		$("#npw").focus(function () {
			result_npw.innerHTML = "";
		})
		
		$("#pBtn").on("click",function(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			var npw = $("#npw").val();
			var cnpw = $("#cnpw").val();
			if(npw == pw){
				alert("기존에 사용하는 비밀번호와 같은 비밀번호를 \n입력하셨습니다. 다시 입력해주세요.");
				npw = $("#npw").val('');
				cnpw = $("#cnpw").val('');
			}else{
				// 새 비밀번호 일치 and null값인지 확인;
				if(npw == cnpw){
					var check = confirm("비밀번호를 변경하시겠습니까?");
					if(check){
						$.post("./mCheck",{id : id,	pw : pw}, function (data) {
							if(data == 1){
								pw = npw;
								$.post("./mPasswordList",{id : id, pw : pw}, function (data){
										if(data == 1){
											alert("비밀번호 변경에 성공하였습니다.\다시 로그인해 주세요.");
											location.href = "../member/memberLogin";
										}else{
											alert("비밀번호 변경에 실패하였습니다.\n다시 시도해 주세요.");
											location.href = "./mPasswordList";
										}// 마지막 if 끝;
								}// 마지막 function 끝;
								)// 마지막 $.post 끝;
								}else{
									alert("현재 비밀번호가 잘못 입력되었습니다.\n다시 확인해 주세요.");
									pw = $("#pw").val('');
								}// 마지막 if 끝;
						}// 두번째 function 끝;
						)// 두번째 $.post 끝;
							}else{
								alert("비밀번호 변경이 취소되었습니다.");
								location.href="./myMain";
						}// 비밀번호 변경 확인 끝;
				}else{
					alert("새 비밀번호가 비어 있거나, 서로 다르게 입력되었습니다.\n확인 후 다시 시도해 주세요.");
					npw = $("#npw").val('');
					npw = $("#cnpw").val('');
				}// 새 비밀번호 일치확인 끝;
			}// 기존 비밀번호와 일치 확인 끝;
			})// pBtn 끝;
		
		/* 취소하고 돌아가기 */
		$("#gBtn").on("click",function(){
			var check = confirm("변경사항을 모두 취소하고 돌아가시겠습니까?")
			if(check){
				location.href = "./myMain";
			}else{
				alert("정보 수정을 계속 진행합니다.");
			}
		})// #Btn 끝;
	})// 기본 function 끝;
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
			      			<label>현재 비밀번호:</label>
			      			<input type="password" class="form-control" placeholder="현재 비밀번호를 입력해 주세요." id="pw" name="pw">
			      			<div id="result_pw" class="result_font" style="color: red"></div>
		    			</div>
			    		<div class="form-group">
			      			<label>변경할 비밀번호:</label>
			    	  		<input type="password" class="form-control" id="npw" name="npw">
			    			<span class="alertMessage">영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</span>
		    				<div id="result_npw" class="result_font" style="color: red"></div>
		    			</div>
			    		<div class="form-group">
			      			<label>변경할 비밀번호 재입력:</label>
			      			<input type="password" class="form-control" placeholder="변경할 비밀번호를 다시 입력해 주세요." id="cnpw" name="cnpw">
		    			</div>
		    			<button type="button" class="btn btn-default" id ="pBtn">수정 완료</button>
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
