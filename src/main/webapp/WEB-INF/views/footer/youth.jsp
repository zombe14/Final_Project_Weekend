<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../temp/boot.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청소년 보호 정책</title>
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
					<li><a href="${pageContext.request.contextPath}/footer/personalInformation" class="tab1">개인정보처리방침</a></li>
					<li><a href="${pageContext.request.contextPath}/footer/youth" class="tab2 on">청소년보호정책</a></li>
					<li><a href="${pageContext.request.contextPath}/footer/use" class="tab3">이용약관</a></li>
				</ul>
				<div class="tit">
					<h3 class="front_tit" style="width: 190px;">청소년 보호 정책</h3>
					<em class="front_sub_tit">청소년을 유해정보로부터 보호하기 위한 전반적인 사항을 규정합니다.</em>
				</div>
				<div class="front_area">
					<div>
                    <p>위켄드뭐해 주식회사는 청소년이 건전한 인격체로 성장할 수 있도록 하기 위하여 정보통신망이용촉진 및 정보보호등에관한법률 및 청소년보호법에 근거하여 청소년 보호정책을 수립, 시행하고 있습니다.</p>
                    <p>위켄드뭐해는 각종 청소년 유해정보로부터 청소년을 보호하고자 관련 법률에 따라 19세 미만의 청소년들이 유해정보에 접근할 수 없도록 청소년보호정책을 마련하여 시행하고 있습니다. 또한 뭐해는 청소년의 건전한 성장을 저해하는 음란,
                        불법 등의 유해정보와 비윤리적, 반사회적 행위에 대해서는 엄격하게 제재하기 위하여 다음과 같이 활동하고 있습니다.</p>
                    <h4>1. 청소년유해정보에 대한 청소년접근제한 및 관리조치</h4>
                    <p>위켄드뭐해는 청소년이 아무런 제한장치 없이 청소년 유해정보에 노출되지 않도록 청소년 유해 매체물에 대해서는 별도의 인증장치를 마련, 적용하며 청소년 유해정보가 노출되지 않기 위한 예방차원의 조치를 강구합니다.</p>
                    <h4>2. 정보통신업무 종사자에 대한 청소년유해정보로부터의 청소년보호를 위한 교육</h4>
                    <p>위켄드뭐해는 정보통신업무 종사자를 대상으로 청소년보호 관련 법령 및 제재기준, 유해정보 발견 시 대처방법, 위반사항 처리에 대한 보고절차 등을 교육하고 있습니다.</p>
                    <h4>3. 청소년유해정보로 인한 피해상담 및 고충처리</h4>
                    <p>위켄드뭐해는 청소년 유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 그 피해가 확산되지 않도록 하고 있습니다. 이용자 분들께서는 하단에 명시한 “4. 위켄드뭐해 청소년보호 책임자 및 담당자의 소속-성명 및 연락처"
                        항을 참고하여 전화나 메일을 통하여 피해상담 및 고충처리를 요청할 수 있습니다.</p>
                    <h4>4. 청소년보호 책임자 및 담당자의 소속-성명 및 연락처</h4>
                    <p>위켄드뭐해는 청소년들이 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다.</p>
                    <p>[청소년 보호 담당자]<br>
                        이 름 : 김원식<br>
                        소속 / 직위 : 서비스운영팀 / 부장<br>
                        E-MAIL : kws332@naver.co.kr<br>
                        전 화 번 호 : 1588-0000</p>
                	</div>
				</div>
			</div>
	</div>
	<a href="javascript:window.scrollTo(0,0);" id="back_to_top"><img src="${pageContext.request.contextPath}/resources/images/home/위로.JPG"></a>
	<div id="footer">
		<c:import url="../inc/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>
