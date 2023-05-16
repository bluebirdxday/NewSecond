<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/footer.css">

<footer class="realFooter">
    <section class="footer--logo">
        <img src="/resources/src/img/LOGO.png" class="footerHomeLogo">
    </section>

    <section class="footer--left">
        <pre>
<strong>(주)뉴세컨즈</strong>
사업자 등록번호: 120-88-2334433-123
대표: 전희진
이사: 김유민, 김지환, 이상준, 서지영
주소: 서울특별시 중구 남대문로 120. 2층
        </pre>
    </section>

    <section class="footer--right" id="footer--right">
        <a href="/qna/qna"><strong>1:1 문의사항</strong></a>
        <a href="#"><strong>FAQ</strong></a>
        <a href="/notice/notice"><strong>공지사항</strong></a>
    </section>

    <jsp:include page="/WEB-INF/views/util/toastMessage.jsp"/>
    <c:if test="${not empty loginUser}" >
		<script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	</c:if>

</footer>


<c:if test="${not empty message}" >
    <script>
        toastTrigger.click();
    </script>
</c:if>