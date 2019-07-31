<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보처리방침</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/personalInformation.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/logo.png" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../inc/header.jsp"></c:import>
		</div>
		<div id="container">
			<div class="conta">
				<ul class="front_tab">
					<li class="on"><a href="${pageContext.request.contextPath}/footer/personalInformation" class="tab1">개인정보처리방침</a></li>
					<li><a href="${pageContext.request.contextPath}/footer/youth" class="tab2">청소년보호정책</a></li>
					<li><a href="${pageContext.request.contextPath}/footer/use" class="tab3">이용약관</a></li>
				</ul>
				<div class="tit">
					<h3 class="front_tit">개인정보 처리방침</h3>
					<em class="front_sub_tit">Weekend 뭐해는 사이트 이용자들의 개인정보를 소중히 다루고
						있습니다.</em>
				</div>
				<div class="front_area">
					<div>
						<h4 id="num1">1. 수집하는 개인정보 항목</h4>
						<p>위켄드 뭐해는 이용자에게 다양한 서비스를 제공하기 위해 다음과 같은 개인정보를 수집하고 있습니다.</p>
						<p>PAYCO 인증을 통한 서비스 이용 시 아래와 같은 개인정보를 제공 받아 이용합니다. 
						<br>
						- PAYCO ID(이메일), 이름, 성별, 생년월일, 암호화된 동일인 식별정보(CI), 휴대폰번호 / (선택) 주소</p>
						<p>회사는 서비스 이용 중 다음과 같은 개인정보를 추가 수집할 수 있습니다.<br>
							- 티켓예매 : (입력필요시)이름, (입력필요 시)생년월일, (입력필요 시)휴대폰번호, (선택)이메일, (배송수령 시)주소 <br>
							- 전화예매 : 이름, 생년월일, 휴대폰번호, (선택) 이메일,(배송 수령 시) 주소, 단체예매인 경우 사업자등록증 또는 고유번호증<br>
							- 시설을 통한 예매: 위탁받아 처리하는 정보로서 이름, 생년월일, 휴대폰번호, (선택)이메일, (배송수령 시)주소<br>
							- 환불계좌등록 : 은행, 계좌번호, 예금주 - 1:1 문의 : 이메일, 휴대폰번호 - 이벤트 : (이벤트 당첨 제세공과금 처리 동의 시)주민등록번호</p>
						<p>또한, 서비스 이용과정에서 아래와 같은 정보가 생성되어 수집될 수 있습니다. <br>
							- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 모바일 서비스 이용시 단말기 정보(단말기 모델, OS 유형, 이동통신사 정보, 하드웨어 ID, 광고 ID, 서비스 이용에 대한 기본 통계), 이용자 단말기 내 설치된 어플리케이션
							정보(앱 설치/실행시각 포함), 결제·구매기록</p>
						<p>. 개인정보 수집방법 - 홈페이지, 모바일기기, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트
							응모, 배송요청 - 협력회사로부터의 제공 - 생성정보 수집 툴을 통한 수집</p>
						<h4 id="num2">2. 개인정보의 수집 및 이용목적</h4>
						<p>위켄드뭐해는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
						<p>- 서비스 이행 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 콘텐츠 제공, 구매 및
							요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스</p>
						<p>- 이용자 관리 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지,
							이용의사 확인, 이용횟수 제한, 연령확인, 불만처리 등 민원처리, 고지사항 전달, 탈퇴의사 확인</p>
						<p>- 마케팅 및 광고에 활용 신규 서비스(제품) 개발 및 특화, 금융상품 및 생활편의서비스의 안내 및 권유,
							이벤트 등 영리목적의 광고성 정보전송(전화, 우편, 이메일, 문자 등), 인구통계학적 특성에 따른 서비스 제공 및
							광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p>

						<h4 id="num3">3. 개인정보의 보유 및 이용기간</h4>
						<p>원칙적으로, 이용자의 개인정보를 회원탈퇴 시까지 보관합니다. 단, 개인정보 도용 등으로 인한 원치 않는
							회원탈퇴, 부정 이용 방지 등에 대비하기 위하여 회원탈퇴 요청 후 3일 간 개인정보를 보유합니다. 그 외에도 다음의
							정보에 대해서는 회원탈퇴 후에도 아래의 이유로 명시한 기간 동안 보관합니다.</p>
						<p>부정이용 기록 보존사유 : 부정 이용 방지 보존기간 : 1년</p>
						<p>그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 위켄드뭐해는 아래와 같이 관계법령에서 정한
							일정한 기간 동안 회원정보를 보관합니다.</p>
						<p>보존 항목 : 계약 또는 청약철회 등에 관한 기록<br> 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
							보존 기간 : 5년</p>
						<p>보존 항목 : 대금결제 및 재화 등의 공급에 관한 기록<br> 보존 근거 : 전자상거래등에서의 소비자보호에 관한
							법률<br> 보존 기간 : 5년</p>
						<p>보존 항목 : 소비자의 불만 또는 분쟁처리에 관한 기록<br> 보존 근거 : 전자상거래등에서의 소비자보호에 관한
							법률<br> 보존 기간 : 3년</p>
						<p>보존 항목 : 웹사이트 방문기록<br> 보존 근거 : 통신비밀보호법<br> 보존 기간 : 3개월</p>

						<h4 id="num4">4. 개인정보의 파기절차 및 방법</h4>
						<p>. 파기절차<br> 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의
							경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간
							저장된 후 파기됩니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로
							이용되지 않습니다.</p>
						<p>. 파기방법<br> - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여
							삭제합니다.<br> - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</p>

						<h4 id="num5">5. 개인정보 수집•이용•제공에 대한 동의철회(서비스탈퇴)</h4>
						<p>회원은 개인정보 수집,이용 및 제공에 대해 가입 시 동의하신 내용을 언제든지 철회하실 수 있습니다.
							동의철회(회원탈퇴)는 서비스의 회원탈퇴 메뉴를 통하여 직접 탈퇴신청을 하시거나,개인정보보호책임자에게 서면, 전화 또는
							E-mail로 연락하시면 개인정보를 파기하는 등 필요한 조치를 하겠습니다.<br> 단, PAYCO 회원 탈퇴를 원하시는
							경우에는 PAYCO 홈페이지에서 탈퇴를 요청하셔야 합니다.</p>

						<h4 id="num6">6. 수집한 개인정보의 위탁</h4>
						<p>위켄드뭐해는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다</p>
						<p>회사는 위탁계약 체결 시 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한,
							수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게
							처리하는지를 감독하고 있습니다.</p>
						<table>
							<caption>위탁업무 내용</caption>
							<thead>
								<tr>
									<th>위탁업무 내용</th>
									<th>수탁자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tc">서비스 및 시스템의 개발, 운영, 고객상담 및 지원, 이벤트 경품 배송,
										카카오 알림톡 발송대행</td>
									<td class="tc">위켄드㈜</td>
								</tr>
								<tr>
									<td class="tc">고객상담</td>
									<td class="tc">Weekend SERVICE (위켄드㈜의 재위탁 업체)</td>
								</tr>
								<tr>
									<td class="tc">휴대폰 본인인증</td>
									<td class="tc">㈜드림시큐리티</td>
								</tr>
								<tr>
									<td class="tc">티켓 구매에 필요한 신용카드, 현금결제, 소액결제 등 결제서비스</td>
									<td class="tc">네이버㈜</td>
								</tr>

							</tbody>

						</table>


					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="../inc/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
