<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="/resources/css/footer.css">



<footer class="realFooter border-top mt-5">
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

    <jsp:include page="/WEB-INF/views/util/alarmMessage.jsp"/>
    <jsp:include page="/WEB-INF/views/util/toastMessage.jsp"/>

</footer>

<script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>

<c:if test="${not empty message}" >
    <script>
        toastTrigger.click();
    </script>
</c:if>



<%-- 로그인 하지 않았을 경우 회원 기능을 누르면 기능이 작동하지 않게하고 로그인창이 뜨게함 
    추가로 로그인해야 된다고 사용자에게 알려주는 메세지를 띄움  --%>
<c:if test="${empty loginUser}" >
    <script>
    document.querySelector('.myMarket').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
        document.getElementById('liveToast').classList.remove('text-bg-primary');
        document.getElementById('liveToast').classList.add('text-bg-danger');
        document.getElementById('toastBody').innerText = "로그인 후 이용가능합니다";
        toastTrigger.click();
    });

    document.getElementById('chattings').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
        document.getElementById('liveToast').classList.remove('text-bg-primary');
        document.getElementById('liveToast').classList.add('text-bg-danger');
        document.getElementById('toastBody').innerText = "로그인 후 이용가능합니다";
        toastTrigger.click();
    });

    document.getElementById('notification').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
        document.getElementById('liveToast').classList.remove('text-bg-primary');
        document.getElementById('liveToast').classList.add('text-bg-danger');
        document.getElementById('toastBody').innerText = "로그인 후 이용가능합니다";
        toastTrigger.click();
    });
    </script>
</c:if>



    <%-- bootstrap 툴팁을 이용하려면 먼저 비동기로 모든 tooltip들의 인스턴스를 불러와야한다. --%>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>

<c:if test="${not empty alarm}" >
    <script>
        alarmTrigger.click();
    </script>
</c:if>
