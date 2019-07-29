<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberAgree.css"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberAgree.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css"> 


<title>Insert title here</title>
</head>
<body>
<div>
	<div id="container">
	<div class="inner">
		<h1>약관동의</h1>
		<div class="essentialTermsWrap">
					<div>
						<div class="custom-control custom-checkbox mb-3" id="checkAll">
					      <input type="checkbox" class="custom-control-input" id="customCheck" name="example1">
					      <label class="custom-control-label" id="checkAllfont" for="customCheck"><p class="checkAllfont_sub">약관 전체동의</p>	</label>
					    </div>
					</div>
					<div>
					
						<div class="custom-control custom-checkbox mb-3">
						<div class="check_sub">
					      <input type="checkbox" class="custom-control-input check_sub_sub" id="customCheck1" name="example1">
					      <label class="custom-control-label" id="checkAllfont1" for="customCheck1"><p class="checkAllfont_sub">주말뭐해 이용약관 (
								<i>필수</i>)</p>	</label>
						</div>
								<div class="terms_box">
									본 약관 중요사항 고지는 주말뭐해 이용약관에 포함된 주말뭐해, 이용자, 제공서비스, 개인정보 보호정책, 회원탈퇴에 대한 정의를 요약한 것으로 이용약관에 따른 구체적인 권리관계 및 의무사항은 반드시 전문보기를 확인하고 동의를 진행 하여야 합니다.
									<br><br><br>[제공 서비스]<br>
									1. 쇼핑서비스(오픈마켓 서비스 포함)<br>
									2. 도서서비스(회사와 별도약정으로 한 공급자의 직접배송 서비스 포함)<br>
									3. 티켓예매서비스 또는 ENT서비스<br>
									4. 여행 서비스(개정 2009.09.01)<br>
									5. 기타 회사가 정하는 업무 등<br>
									[이용자]<br>
									"이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청하고, 회사는 회원으로 가입할 것을 신청한 이용자 중 약관에 따라 허용가능한 이용자를 회원으로 승낙합니다.
									<br>
									[개인정보 보호정책]<br>
									주말에 뭐해는 이용자의 정보수집 시 판·구매 계약 이행에 필요한 최소한의 정보를 수집하는 바 <br>
									다음 사항을 필수사항으로 하며 그 외 사항은 관련법령 및 개인정보처리방침을 따릅니다.<br>
								</div>
					    </div>
					</div>
					<div>
					
						<div class="custom-control custom-checkbox mb-3 check_sub">
						<div class="check_sub">
					      <input type="checkbox" class="custom-control-input check_sub_sub" id="customCheck2" name="example1">
					      <label class="custom-control-label" id="checkAllfont2" for="customCheck2"><p class="checkAllfont_sub">전자금융거래 이용약관 (
								<i>필수</i>)</p>	</label>
					 	</div>
								<div class="terms_box">
									본 약관 중요사항 고지는 전자금융거래 이용약관에 포함된 전자지급결제대행서비스, 
									결제대금예치서비스, 선불식전자지급수단 등의 정의를 요약한 것으로 이용약관에 따른
									 구체적인 권리관계 및 의무사항은 반드시 전문보기를 확인하고 동의를 진행 하여야 합니다
									본 약관은 주식회사 주말에뭐해 (이하 '회사'라 합니다)가 제공하는 전자금융거래 서비스를
									 ‘이용자’가 이용함에 있어, ‘회사’와 ‘이용자’ 간 권리, 의무 및 ‘이용자’의 서비스 이용절차 등에 관한 사항을 정함에 그 목적이 있습니다.
								</div>
					    </div>
					</div>
					<div>
					
						<div class="custom-control custom-checkbox mb-3 check_sub">
					      <input type="checkbox" class="custom-control-input check_sub_sub" id="customCheck3" name="example1">
					      <label class="custom-control-label" id="checkAllfont3" for="customCheck3"><p class="checkAllfont_sub">개인정보 수집 동의서 (
								<i>필수</i>)</p>	</label>
								<div class="terms_box">
									주말에 뭐해는 주말에뭐해회원에게 쇼핑, 도서, 티켓 예매, 투어/숙박/항공 예매 서비스와 회원관리서비스, 
									그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
									* 본 수집동의서 상의 용어의 정의는 "주말에뭐해 이용약관 및 개인정보처리방침"에 준용하며 주말에뭐해 
									서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.
								</div>
					    </div>
					</div>
					
					<div>
					
						<div class="custom-control custom-checkbox mb-3 check_sub">
						<div class="check_sub">
					      <input type="checkbox" class="custom-control-input check_sub_sub" id="customCheck4" name="example1">
					      <label class="custom-control-label" id="checkAllfont4" for="customCheck4"><p class="checkAllfont_sub">개인정보 수집 동의서 (선택)
								</label>
						</div>
								<div class="terms_box">
									주말에 뭐해는 주말에뭐해회원에게 쇼핑, 도서, 티켓 예매, 투어/숙박/항공 예매 서비스와 회원관리서비스, 
									그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
									* 본 수집동의서 상의 용어의 정의는 "주말에뭐해 이용약관 및 개인정보처리방침"에 준용하며 주말에뭐해 
									서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.
								</div>
					    </div>
					</div>
				</div>
            <button id="join" class="btn btn-danger" style="border-radius: 0px;	width: 20%; margin-left: 40%;" type="submit" form="new_normal_user">
            회원가입하기
        </button>

	</div>
	</div>
</div>

</body>
</html>