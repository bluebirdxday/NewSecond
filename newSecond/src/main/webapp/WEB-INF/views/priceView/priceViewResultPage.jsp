<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/priceView/priceViewResult.css">
    <title>New Second</title>
</head>
<body>

<!-- <%-- iphone을 검색하였을 때(GET방식) 이 페이지의 주소는 http://localhost/priceView/priceSee/search?keyword=iphone --%>

<%-- URL 속 iphone이라는 keyword를 <%= keyword %>로 사용하기 위한 태그 --%>
<% String keyword = request.getParameter("keyword"); %> -->

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <div class="content--priceViewResult__background">
        <section class="content--priceViewResult__top">
            <div class="content--priceViewResult__title">시세조회</div>
        </section>

        <section class="content--priceViewResult__main">
            <aside class="content--aside__left"></aside>

            <section class="priceViewResult--background">
                <!-- mainFrame -->
                <div class="priceViewResult--main__box">
                    <div class="priceViewResult--main__SearchBox">
<!-- <%-- URL의 keyword=iphone의 keyword가 value 값으로 기본 입력되어 있음 --%> -->
                        <input type="text" placeholder="시세를 조회할 상품을 입력하세요." maxlength="30" value="<%= keyword %>" style="font-weight: bold;"><button type="submit">검색</button>
                    </div>

                    <!-- 상하분할 -->

                    <div class="priceViewResult--main__bottomBox">
                        <div class="priceViewResult--main__LeftBox">
                            <div>시세금액</div>
                            <div class="chart">


                            </div>
                        </div>

                        <!--  좌우분할 -->

                        <div class="priceViewResult--main__RightBox">
<!-- <%-- URL의 keyword=iphone의 keyword를 넣음 --%> -->
                            <div>오늘의 <%= keyword %> 시세금액</div>
                            <div>
<!-- <%-- iphone의 1달 내 평균 시세를 조회해서 스크립틀릿 안에 넣음 --%>   -->                          
                                <div> <%= request.getAttribute("result") %> </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- mainFrame -->
            </section>

            <aside class="content--aside__right"></aside>
        </section>
        <!-- bottomFrame -->
        <section class="content--priceViewResult__bottomBackground">
            <section class="content--priceViewResult__bottomTitle">
                <div>최근 등록된 상품</div>
            </section>

            <!--  -->

            <section class="content--priceViewResult__bottomMain">
                <aside class="content--aside__bLeft"></aside>

                <section class="priceViewResult--bBackground">
                    <div class="priceViewResult--main__bBox">

                        <a href="#">
                            <img src="">
                            <div>120,000원</div>
                            <div>아이폰12 부품용 싸게 팝니다!</div>
                        </a>
                        <a href="#">
                            <img src="/">
                            <div>500,000원</div>
                            <div>아이폰12 싸게 팝니다</div>
                        </a>
                        <a href="#">
                            <img src="">
                            <div>450,000원</div>
                            <div>[iPhone12] 아이폰12 128GB 화이트 공기계</div>
                        </a>
                        <a href="#">
                            <img src="">
                            <div>780,000원</div>
                            <div>아이폰12 프로 256기가 퍼시픽블루 S급</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>480,000원</div>
                            <div>아이폰 12 64기가 Iphone 12</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>700,000원</div>
                            <div>아이폰12 프로 맥스 128g 최상급</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>470,000원</div>
                            <div>아이폰12 스페이스그레이</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>650,000원</div>
                            <div>아이폰 12프로 512기가 퍼시픽 블루 iphone 12 pro</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>700,000원</div>
                            <div>아이폰12프로 128g iPhone 12 pro 퍼시픽블루 s급</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>650,000원</div>
                            <div>아이폰 12프로 맥스 256GB (iphone 12pro max) 자급제 A급</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>500,000원</div>
                            <div>아이폰12프로(12pro) 실버 128기가 판매합니다</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>600,000원</div>
                            <div>아이폰12 프로맥스 골드 (iPhone 12 pro max gold) 256기가</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>580,000원</div>
                            <div>아이폰 12 풀구성 X,Xs,12프로,13,13프로</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>500,000원</div>
                            <div>아이폰12 싸게 팝니다</div>
                        </a>
                        <a href="#">
                            <img src="#">
                            <div>620,000원</div>
                            <div>[리퍼/미사용]아이폰12pro, 아이폰12프로 256GB 그라파이트</div>
                        </a>
                    </div>
                </section>

                <aside class="content--aside__bRight"></aside>
            </section>

            <!--  -->

            <section class="content--priceViewResult__bottomPlus">
<!-- <%-- 더보기를 눌렀을 때는 <%= keyword %>으로 검색한 페이지로 이동되도록 href 작성 --%> -->
                <a href="#"><button>더보기</button></a>
            </section>
        </section>
        <!-- bottomFrame -->
    </div>
    </main>

    <div class="bottomEmpty"></div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/priceView/priceViewResult.js"></script>
    
</body>
</html>