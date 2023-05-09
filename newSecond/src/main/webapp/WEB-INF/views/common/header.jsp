<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="resources\fontawesome\css\all.min.css">
    <link rel="stylesheet" href="resources\bootstrap\css\bootstrap.min.css">

    <link rel="stylesheet" href="resources\css\header.css">
    
</head>
<body>

    <header class="header--container__containerbox">
        <section class="header--container__top">
            <div></div>
            <div>
                <span class="login" id="loginBtn" onclick="openModal()">로그인/회원가입</span>
                <span> | </span>
                <span class="myPage"><a href="/web/html/mypage.html">마이페이지</a></span>
                <span> | </span>
                <span class="wishList"><a href="">관심상품</a></span>
            </div>
        </section>

        <section class="header--container__middle">
            
            <div class="header--left__img">
                <a href="/web/index.html">
                    <img class="homeLogo" src="/web/src/img/LOGO.png">
                </a>
            </div>
            
            <div class="header--mid__serach"><!-- 검색창 -->
                    <input type="text" placeholder="상품명, @상점명을 입력해주세요." class="search">
                    <a href="#">
                    <img class="searchGlass" src="/web/src/img/glass.png"></img>
            </div>
            
            <div class="header--right__icons">
                    <span>
                        <a href="/web/html/내상점.html">
                            <img class="myMarket" src="/web/src/img/home.png"/>
                        </a>
                    </span>
                    <span>
                        <a href="#">
                            <img class="chattings" src="/web/src/img/message.png"/>
                        </a>
                    </span>
                    <span>
                        <a href="/web/html/알림페이지.html">
                            <img class="notifications" src="/web/src/img/notifications.png"/>
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
    

    <script src="/web/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/web/js/login.js"></script>
    
</body>
</html>