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
  <script type="text/javascript" src="../resources/js/memberJoin.js?ver=2"></script>
<title>Insert title here</title>  
</head>
<body>
	<div class="container">
	<form action="./memberJoin"  id="frm" method="POST">
		<div class="joinWrap">
			<h2>회원가입</h2>
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
								<div id="phone" title="phone">
									
								</div>
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
										<div id="email">
											
										</div>
									</div>
									<div class="mailAreaMessage">
										<span class="alertMessage" style="display:none; margin-bottom:6px;"></span>
									</div>
									<div class="iCheckbox">
										<input id="check" name="" value="N" type="checkbox">
										<label for="check">SMS, 이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다. (선택)</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="certifyButtonWrap">
					<button>
						본인확인
					</button>
				</div>
			</div>
			
			<div class="tableBox">
					<table>
						<caption>필수 정보입력2</caption>
						<colgroup>
							<col style="width: 240px">
							<col style="width: *"> </colgroup>
							<tbody>
							<tr>
								<th scope="row">
									<span class="essential">*</span>아이디 </th>
								<td>
									<input type="text" name="id" maxlength="20" class="iText" title="id" id="id" placeholder="띄어쓰기 없는영문, 숫자로만 6~20자">
									<input type="hidden" name="chkMemId" value="" id="memidCheck">
									<div class="infoLayerBox" style="display:none;top:46px;">
										<div class="infoContent">아이디를 정확히 입력하여 주십시오.
											<br>띄어쓰기 없는 영문, 숫자로만 6~20자.</div>
									</div>
									<a href="javascript:searchMemId();" class="btnblackCheck layerOpenButton">중복확인</a>
									<div id="result_memid">
										
									</div>
									<div id="memid">
										
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>비밀번호
									
								</th>
								<td>
									<div class="passwordWrap">
										<input type="password" name="pw" value="" class="iText" title="pw" id="pw" >
										<div id="pww">
											
										</div>
										<div class="infoLayerBox" style="display:none;top:46px;">
											<div class="infoContent">영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</div>
										</div>
										<div id="result_pw" class="result_font">
										
										</div>
	
										<!-- // 안내문구 레이어팝업 -->
										<span class="alertMessage">영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>비밀번호 확인 </th>
								<td>
									<div class="passwordWrap">
										<input type="password" name="pwCheck" class="iText" title="pwCheck" id="pwCheck">
										<div id="pwwcheck">
											
										</div>
										<div id="result_pwpw" class="result_font">
										
										</div>
										<!-- // 안내문구 레이어팝업 -->
										<span class="alertMessage">비밀번호 재입력</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>이름 </th>
								<td>
									<input type="text" name="name" class="iText" title="name" id="name" minlength="4" maxlength="20"> 
									<div id="memNamecheck">
										
									</div>
									<div id="result_memNamecheck">
											
									</div>
									</td>
									
									
							</tr>
							<tr>
								<th scope="row">
									<span class="essential">*</span>어린이회원 </th>
								<td>
									<div class="iCheckbox minorChkWrap">
										<input id="minorChk" name="minorChk" type="checkbox" onclick="javascript:fncOpenCertifyPopup('PAR_EMAIL_CERTIFY');" value="N">
										<label for="minorChk">14세 미만
											<i>14세 미만 가입 시 보호자 동의 후 가입 가능합니다. 14세 미만 가입시 꼭 체크해주세요.</i>
										</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="certifyButtonWrap_final certifyButtonWrap">
					<button type="submit">
						회원가입
					</button>
				</div>
		</div>
		</form>
	</div>

</body>
</html>