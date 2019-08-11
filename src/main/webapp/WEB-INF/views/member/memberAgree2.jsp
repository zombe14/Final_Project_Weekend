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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberJoin.css?ver=1">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
     <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" /> 
  <script type="text/javascript" src="../resources/js/member/memberAgree2.js"></script>
<title>Weekend - 본인인증</title>  

</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="../inc/header.jsp"></c:import>
	</div>
	<div id="container">
	<div class="conta">
	<form action="./memberAgree2"  id="frm" method="POST" enctype="multipart/form-data">
		<div class="joinWrap">
			<h2>본인인증</h2>
			<div class="essentiaDataWrap">
				<h3 class="conTitle">
					<i>필수</i> 정보입력</h3>
				
				<div class="tableBox">
					<table>
						<caption>필수 정보입력</caption>
						<colgroup>
							<col style="width: 240px">
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
							<tr>
								<th scope="row">
									<span class="essential">*</span>E-mail </th>
								<td>
									<div class="mailArea">
										<input type="hidden" name="memEmail" value="" id="email_store">	
										<input type="text" class="iText" title="이메일아이디" id="emailFirst" name="memEmail1" maxlength="50">
										<span class="addr">@</span>
										<input type="text" class="iText" title="이메일주소" name="memEmail2" disabled="" id="email_adress">
										<div class="customSelect mailSelect">
											<select name="memEmail3"  id="memEmail_select">
												<option value="">선택해주세요</option>
												
													<option value="naver.com">naver.com</option>
												
													<option value="hanmail.net">hanmail.net</option>
												
													<option value="gmail.com">gmail.com</option>
												
													<option value="nate.com">nate.com</option>
												
													<option value="hotmail.com">hotmail.com</option>
												
													<option value="dreamwiz.com">dreamwiz.com</option>
												
													<option value="freechal.com">freechal.com</option>
												
													<option value="hanmir.com">hanmir.com</option>
												
													<option value="korea.com">korea.com</option>
												
													<option value="paran.com">paran.com</option>
												
													<option value="etc"> 직접입력</option>
												
											</select>
										</div>
										<input type="hidden" id="email" name="email" title="email">
										<div id="result_mememail">
										
									</div>
									<button type="button" id="emailCheck">
										메일인증하기
									</button>
									</div>
									<div class="mailAreaMessage">
										<span class="alertMessage" style="display:none; margin-bottom:6px;"></span>
									</div>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="certifyButtonWrap">
					<button type="button" class="certifyButtonWrapButton">
						본인확인
					</button>
				</div>
			</div>
			</div>
		</form>
		</div>
	</div>
	<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.JPG"></a>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>