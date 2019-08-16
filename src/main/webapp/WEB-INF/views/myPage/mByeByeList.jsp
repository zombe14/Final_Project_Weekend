<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 회원탈퇴 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		// 회원 탈퇴 버튼;
		$("#uBtn").on("click", function () {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var check = confirm("탈퇴하시겠습니까?");
			if(check){
				alert("탈퇴를 진행합니다.");
				$.post("./mCheck",{
					id : id,
					pw : pw
				}, function (data) {
					if(data == 1){
						$.post("mByeBye",{
							id : id,
							pw : pw
						}, function (data) {
							if(data == 1){
								alert("탈퇴되었습니다. 그동안 감사했습니다.");
								location.href = "../";
							}else{
								alert("실패하였습니다.");
							}// 회원탈퇴 if 끝;
						}// 회원탈퇴 function 끝;
						)// 회원탈퇴 post 끝;
					}else{
						alert("아이디와 비밀번호를 다시 확인해 주세요.");
					}// data if 끝;
				}// data 받는 function 끝;
				)// 본인확인 post 끝;
			}else{
				alert("탈퇴를 취소합니다.");
				location.href = "./myMain";
			}// 탈퇴 확인 if 끝;
		})// uBtn 끝;
		// 되돌아가기 버튼;
		$("#gBtn").on("click", function(){
			// 탈퇴 취소 여부 확인;
			var check = confirm("탈퇴를 취소하고 돌아가시겠습니까?");
			if (check){
				location.href = "./myMain";
			}else{
				alert("회원 탈퇴 페이지를 계속 진행합니다.");
			}// 탈퇴 여부 확인 끝;
		})// gBtn 끝;
	})//기본 function 끝;
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
		      				<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요.">
		    			</div>
						<div class="form-group">
		      				<label>비밀번호:</label>
		      				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		    			</div>
		  				<button type="button" class="btn btn-default" id ="uBtn">탈퇴 완료</button>
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
