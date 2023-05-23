<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/priceView/priceView.css">
    <title>New Second</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <form action="/priceView/priceSee/search" type="GET">
        <div class="content--priceView__background">
        <section class="content--priceView__top">
            <div class="content--priceView__title">시세조회</div>
        </section>

        <section class="content--priceView__main">
            <aside class="content--aside__left"></aside>

            <section class="priceView--background">
                <!-- mainFrame -->
                <div class="priceView--main__box">
                    <div class="priceView--main__leftBox">
                        <div class="priceView--main__searchBox">
                            <label for="search">
<!-- <%-- 검색어 name="keyword" id="search" --%>   -->                          
                                <input type="text" placeholder="검색어를 입력하세요" maxlength="30" id="search" name="keyword" id="search"><button type="submit">검색</button>
                            </label>
                        </div>

                        <!--  -->

                        <div class="priceView--main__recentSearch">
                            <div>
                                <div>최근 시세조회한 검색어</div><button type="button">모두 지우기</button>
                            </div>
                            <div>
                                <div class="recentSearch--1floor">
                                    <span onclick="addSearchKeyword(this)">프라이탁<button class="removeBtn">✖</button></span>
                                    <span onclick="addSearchKeyword(this)">아이패드<button class="removeBtn">✖</button></span>
                                    <span onclick="addSearchKeyword(this)">아이폰12<button class="removeBtn">✖</button></span>
                                    <span onclick="addSearchKeyword(this)">아이폰se2<button class="removeBtn">✖</button></span>
                                </div>
                                <div class="recentSearch--2floor">
                                    <span onclick="addSearchKeyword(this)">나이키가방<button class="removeBtn">✖</button></span>
                                    <span onclick="addSearchKeyword(this)">뉴발란스신발<button class="removeBtn">✖</button></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 좌우분할 -->

                    <div class="priceView--main__popularSearch">
                        <span>시세조회 인기검색어</span>
                        <ol>
                            <li>프라이탁</li>
                            <li>갤럭시S22</li>
                            <li>애플워치4</li>
                            <li>갤럭시버즈</li>
                            <li>에어팟</li>
                            <li>맥북에어</li>
                            <li>영화티켓</li>
                            <li>의자</li>
                            <li>커블체어</li>
                            <li>슬램덩크</li>
                        </ol>
                    </div>

                </div>
                <!-- mainFrame -->
            </section>

            <aside class="content--aside__right"></aside>
        </section>
    </div>
    </form>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <a href="/priceView/priceResultSee">
        <button>시세조회결과테스트버튼입니다</button>
    </a>
    <a href="/chatting/chat">
        <button>채팅테스트버튼입니다</button>
    </a>
    <a href="/writing/write">
        <button>글쓰기테스트버튼입니다</button>
    </a>

    <script src="/resources/js/priceView/priceView.js"></script>
</body>
</html>