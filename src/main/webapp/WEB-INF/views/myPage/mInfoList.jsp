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
/* 
		// 닉네임 중복확인
		$("#nCheck").on("click", function(){
			var nickname = $("#nickname").val();
			$.ajax({
				data:{
					nickname : nickname
				},
				type : "POST",
				url : "../member/getNickname",
				success : function(data){
					if(data == 1){
						alert("이미 존재하는 활동명 입니다.")
						$("#nCheck").val('');
					}else{
						alert("사용 가능한 활동명 입니다.")
						$('#nickname').attr('readonly', true);
						$("#nCheck").attr('type', 'hidden');
					}
				}//success 끝;
				})// ajax 끝;
			})// nCheck 끝;
*/
		 
/* 		 
		 //////////////////////////////////수정폼 보내기 개정판;
		 $("#uBtn").on("click", function(){
			// 각 객체에 해당 value 입력;
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pw").val();
			var phone = $("#phone").val();
			var email = $("email").val();
			var nickname = $("nickname").val();

			var email = $("#email").val();
			var nickname = $("#nickname").val();
			var reg_date = $("#reg_date").val();
			var grade = $("#grade").val();
			// 닉네임 중복검사 시행여부;
			var nCheck = false;
			// 전화번호 중복검사 시행여부;
			var pCheck = false;
			// 이메일 중복검사 시행여부;
			var eCheck = false;
		 })//#uBtn 끝;
*/	 
		///////////////////////////////////수정폼 보내기
		$("#uBtn").on("click", function () {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pwc = $("#pw").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var nickname = $("#nickname").val();
			var reg_date = $("#reg_date").val();
			var grade = $("#grade").val();

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
		})//.pBtn 끝;
		
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
					<!-- <form action="./mInfoList" method="post" enctype="multipart/form-data">
					</form> -->
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
		      				<button type="submit" class="btn btn-default" id="nCheck">중복확인</button>
		    			</div>
		    			<div class="form-group">
		      				<label>나의 등급:</label>
		      				<input type="text" class="form-control" readonly="readonly" id="grade" name="grade" value="${member.grade}">
		    			</div>
						    <div class="form-group">
		      				<label>전화번호:</label>
		      				<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" >
		      				<button type="submit" class="btn btn-default" id="pCheck">중복확인</button>
		    			</div>
		    			<div class="form-group">
		      				<label>이메일:</label>
		      				<input type="text" class="form-control" id="email" name="email" value="${member.email}" >
		      				<button type="submit" class="btn btn-default" id="eCheck">중복확인</button>
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
