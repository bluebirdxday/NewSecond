<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/header.css">

<header class="header--container__containerbox">
    <section class="header--container__top">
        <div></div>
        <div>
            <c:choose>
                <c:when test="${empty loginUser}">
                    <jsp:include page="/WEB-INF/views/user/login.jsp"/>
                    <span> | </span>
                    <span><a href="/user/signUp">회원가입</a></span>
                </c:when>
            
                <c:otherwise>
                    <span class="logout"><a href="/user/logout">로그아웃</a></span>
                    <span> | </span>
                    <span class="myPage"><a href="">마이페이지</a></span>
                    <span> | </span>
                    <span class="wishList"><a href="">관심상품</a></span>
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
        
        <div class="header--mid__serach"><!-- 검색창 -->
                <input type="text" placeholder="상품명, @상점명을 입력해주세요." class="search">
                <a href="#">
                <img class="searchGlass" src="/resources/src/img/glass.png"/>
        </div>
        
        <div class="header--right__icons">
                <span>
                    <a href="/shop/myShop" id="myShop">
                        <img class="myMarket" src="/resources/src/img/home.png"/>
                    </a>
                </span>
                <span>
                    <a href="#" id="chattings">
                        <img class="chattings" src="/resources/src/img/message.png"/>
                    </a>
                </span>
                <span>
                    <a href="/notification/notification" id="notification">
                        <img class="notifications" src="/resources/src/img/notifications.png"/>
                    </a>
                </span>
            </div>
        
    </section>

    <nav class="nav--container__menu">
        <div>홈</div>
        <div>카테고리</div>
        <div>시세조회</div>
    </nav>
    
</header>


<c:if test="${empty loginUser}" >
    <script>
    document.getElementById('myShop').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
    });

    document.getElementById('chattings').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
    });

    document.getElementById('notification').addEventListener('click', e => {
        e.preventDefault();
        document.getElementById('login').click();
    });
    </script>
</c:if>

