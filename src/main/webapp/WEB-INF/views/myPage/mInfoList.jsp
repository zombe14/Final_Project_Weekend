<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<html>
<head>
<title> Weekend - 마이페이지 </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPageMain.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
<script type="text/javascript">
	$(function () {
		$(".pBtn").on("click", function () {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pw").val();
			var phone = $("#phone").val();
			var email = $("email").val();
			var nickname = $("nickname").val();
			
			var check = confirm("수정을 마치시겠습니까?");
			if(check){
				$.post("../myPage/mInfoList",{
					id : id,
					pw : pw,
					nickname : nickname,
					email : email,
					phone : phone
					}, function(){
						alert("수정 끝!")
						}// post 보낸뒤 function 끝;
				)//$.post 끝;
			}// if(check) 끝;
		})//.pBtn 끝;
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
					<form action="./mInfoList" method="post" enctype="multipart/form-data">
		    			<input type="hidden" name="num" value="${member.id}">
		    				<div class="form-group">
		      					<label for="id">아이디:</label>
		      					<input type="text" class="form-control" readonly="readonly" id="id" value="${member.id}" name="id">
		    				</div>
							<div class="form-group">
		      					<label for="pw">비밀번호:</label>
		      					<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="pw" name="pw">
		    				</div>
		    				<div class="form-group">
		      					<label for="pwc">비밀번호 확인:</label>
		      					<input type="password" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요." id="pwc" name="pwc">
		    				</div>
		    				<div class="form-group">
		      					<label for="nickname">닉네임:</label>
		      					<input type="text" class="form-control" id="nickname" value="${member.nickname}" name="nickname">
		      					<button type="submit" class="btn btn-default" id="nCheck">중복확인</button>
		    				</div>
						     <div class="form-group">
		      					<label for="phone">전화번호:</label>
		      					<input type="text" class="form-control" id="phone" value="${member.phone}" name="phone">
		      					<button type="submit" class="btn btn-default" id="pCheck">중복확인</button>
		    				</div>
		    				<div class="form-group">
		      					<label for="phone">이메일:</label>
		      					<input type="text" class="form-control" id="email" value="${member.email}" name="phone">
		    				</div>
		    				<div class="form-group">
		      					<label for="grade">회원등급:</label>
		      					<input type="text" class="form-control" readonly="readonly" id="grade" value="${member.grade}" name="grade">
		    				</div>
		  				<button type="submit" class="btn btn-default">수정 완료</button>
		  				<button type="button" class="pBtn">임시</button>
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
