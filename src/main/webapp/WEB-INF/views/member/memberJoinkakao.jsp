<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <c:import url="../temp/boot.jsp"></c:import>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberJoin.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
     <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
  <script type="text/javascript" src="../resources/js/member/memberJoinkakao.js?ver=1"></script>
<title>Weekend - 회원가입</title>

</head>
<body>
<div id="wrap">
	<div id="container">
	<div class="conta">
		<div class="join_wrap">
			<div class="join_logo">
				<a href="${pageContext.request.contextPath}/."><img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo111.png"></a>
			</div>
	<form action="./memberJoinkakao"  id="frm" method="POST" enctype="multipart/form-data">
		<div class="joinWrap">
			<div class="essentiaDataWrap">
				<h3 class="conTitle">
					<i>필수</i> 정보입력</h3>
				
				<div class="tableBox">
					<table>
						<caption>필수 정보입력</caption>
						<colgroup>
							<col style="width: 133px">
							<col style="width: *"> </colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<span class="essential">*</span>휴대폰번호 </th>
								<td>
									<div class="phoneNumber">
										<div class="customSelect">
											<select name="hp1" id="num_select">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</div>
										<span class="hypen" id="hypen_first">-</span>
										<input type="text" class="iText" id="hp2" name="hp2" title="앞번호4자리" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"  style="IME-MODE:disabled;">
										<span class="hypen">-</span>
										<input type="text" class="iText" id="hp3" name="hp3" title="뒷번호4자리" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="IME-MODE:disabled;"> </div>
								 		<input type="hidden" name="hp" value="">
								<input type="hidden" id="phone" name="phone" title="phone"> 
								</td>
								
							</tr>
						</tbody>
					</table>
				</div>


			<div class="essentiaDataWrap">
			</div>
			<div class="tableBox">
					<table>
						<caption>필수 정보입력2</caption>
						<colgroup>
							<col style="width: 133px">
							<col style="width: *"> </colgroup>
							<tbody>
							<tr>
								<th scope="row">
									<span class="essential">*</span>아이디 </th>
								<td>
									<input type="text" name="id" maxlength="20" class="iText" title="id" id="id" value="${memberkakao.id}">
									<input type="hidden" name="chkMemId" value="" id="memidCheck">
									<div class="infoLayerBox" style="display:none;top:46px;">
										<div class="infoContent">아이디를 정확히 입력하여 주십시오.
											<br>띄어쓰기 없는 영문, 숫자로만 6~20자.</div>
									</div>
									<div id="result_memid">
										
									</div>
									<div id="memid">
										
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>이름 </th>
								<td>
									<input type="text" name="name" class="iText" title="name" id="name" minlength="4" maxlength="20" value="${memberkakao.name}"> 
									<div id="memNamecheck">
										
									</div>
									<div id="result_memNamecheck">
											
									</div>
									</td>
									
									
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>주민번호 </th>
								<td>
									<input type="hidden" id="jumin" name="jumin" title="jumin">
						             <input type="text" name="unum1" id="unum1" size="12" maxlength="6" class="iTextnum">-
						             <input type="password" name="unum2" id="unum2"size="12" maxlength="7" class="iTextnum"></input>
									<input type="button" id="juminnum" value="중복확인">
									<div id="juminnumCheck">
										
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>활동명 </th>
								<td>
								<input type="text" name="nickname" class="iText" title="nickname" id="nickname" minlength="4" maxlength="20">

								<input type="button" id="nicknameCheckbt" value="중복확인">
								<div id="nicknameCheck"></div>
								<input type="hidden" id="age" name="age" title="age">
								<input type="hidden" id="email" name="email" title="email" value="${memberkakao.email}">
								</td>
								
							</tr>
							
							<tr>
								<th scope="row">
								<span class="essential">*</span>
									프로필사진
								</th>
								<td>
									<input type="file" name="photo">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="final_button">
					<button type="button" class="certifyButtonWrap_final certifyButtonWrap jnbtn">
							회원가입
					</button>
				</div>
		</div>
		</div>
		</form>
		<div class="join_footer">
						<div class="join_menu">
							<a href="${pageContext.request.contextPath}/footer/personalInformation">개인정보처리방침</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/footer/youth">청소년보호정책</a>
							<span>|</span> 
							<a href="${pageContext.request.contextPath}/footer/use">이용약관</a>
							<span>|</span>
							<a href="${pageContext.request.contextPath}/callcenter/main">고객센터</a>
						</div>
					</div>
		</div>
	</div>
	<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.JPG"></a>
</div>
</div>
</body>
</html>