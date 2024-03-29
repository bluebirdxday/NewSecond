<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/header.css">

<header class="header--container__containerbox">
    <section class="header--container__top">

        
        <div>
            <c:choose>
                <c:when test="${empty loginUser}">
                    <span class="m-1"><jsp:include page="/WEB-INF/views/user/login.jsp"/></span>

                    <div class="vr m-1"></div>

                    <span class="m-1"><a href="/user/signUp">회원가입</a></span>
                    
                    <div class="vr m-1"></div>
                </c:when>
            
                <c:otherwise>

                    <span class="logout m-1"><a href="/user/logout">로그아웃</a></span>

                    <div class="vr m-1"></div>

                    <span class="m-1"><jsp:include page="/WEB-INF/views/user/myPageDropdown.jsp"/></span>
                
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <section class="header--container__middle">
        
        <div class="header--left__img">
            <a href="/">
                <img class="homeLogo" src="/resources/src/img/LOGO.png">
            </a>
        </div>
    
        <form action="/goods/search/goodsList" method="GET" id="searchForm">
            <div class="header--mid__serach"><!-- 검색창 -->
                <input type="text" placeholder="어떤 상품을 찾으시나요?" class="search" name="query" id="searchQuery" autocomplete="off">
                <button class="searchBtn"></button>
            </div>
        </form>

        <div class="header--right__icons">
                <span>
                    <c:if test="${empty loginUser}">
                        <a href="/" id="myMarket">
                            <img class="myMarket" src="/resources/src/img/home.png"/>
                        </a>
                    </c:if>

                    <c:if test="${not empty loginUser}" >
                        <a href="/shop/${loginUser.userNo}" id="myMarket">
                            <img class="myMarket" src="/resources/src/img/home.png"/>
                        </a>
                    </c:if>
                    
                </span>
                <span>
                    <a href="#" id="chattings">
                        <img class="chattings" src="/resources/src/img/message.png"/>
                    </a>
                </span>


                <span class="notification-wrapper">
                    <c:if test="${empty loginUser}">
                        <a href="/" id="notification">
                            <img class="notifications" src="/resources/src/img/notifications.png"/>
                        </a>
                    </c:if>

                    <c:if test="${not empty loginUser}" >
                        <a href="/notification/notification" id="notification">
                            <img class="notifications" src="/resources/src/img/notifications.png"/>
                        </a>
                        <div class="notification-dot"></div>
                    </c:if>
                </span>
            </div>
        
    </section>

    <nav class="nav--container__menu">
        <jsp:include page="/WEB-INF/views/goods/goodsCategoryDropdown.jsp"/>
        <div><a href="/">홈</a></div>
        <div><a href="/priceView/priceSee">시세조회</a></div>
    </nav>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/resources/js/goods/searchGoodsList.js"></script>

<script>
    const notificationCount = ${hasUnreadNotifications};
</script>

<script src="/resources/js/header.js"></script>


</header>


<%-- 지금 url 경로가 /가 아닐때(메인페이지가 아닐때) --%>
<c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/'}" >
    <%-- 카테고리 리스트가 세션정보에 없으면 --%>
    <c:if test="${empty categoryList}" >
        <script>
            location.href='/' /* js로 메인페이지에 이동시키게 함 */
        </script>
    </c:if>

</c:if>
