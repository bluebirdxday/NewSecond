<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/priceView/priceViewResult.css">
<%-- chart.js --%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
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
                <form action="/priceView/priceSee/search" type="GET">
                    <div class="priceViewResult--main__SearchBox">
<!-- <%-- URL의 keyword=iphone의 keyword가 value 값으로 기본 입력되어 있음 --%> -->
                        <input type="text" placeholder="시세를 조회할 상품을 입력하세요." maxlength="30" value="<%= keyword %>" style="font-weight: bold;" name="keyword"><button type="submit">검색</button>
                    </div>
                </form>

                    <!-- 상하분할 -->

                    <div class="priceViewResult--main__bottomBox">
                        <div class="priceViewResult--main__LeftBox">
                            <div>최근 시세금액</div>
                            <div class="chart">
                                <div id="month1" style="display: none">${result}</div>
                                <div id="month2" style="display: none">${result2}</div>
                                <div id="month3" style="display: none">${result3}</div>
                                <div class="myChartBox">
                                    <canvas class="myChart" id="myChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <!--  좌우분할 -->

                        <div class="priceViewResult--main__RightBox">
<!-- <%-- URL의 keyword=iphone의 keyword를 넣음 --%> -->
                            <div>한달 내 ${param.keyword} 시세금액</div>
                            <div>
<!-- <%-- iphone의 1달 내 평균 시세를 조회해서 스크립틀릿 안에 넣음 --%>   -->                          
                                <div style="font-style: italic;"> 약 <fmt:formatNumber value="${result}" pattern="##,###,###"/> 원</div>
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

<!-- form 태그 시작 -->
            <%--  --%>
            <form>
            <section class="content--priceViewResult__bottomMain">
                <aside class="content--aside__bLeft"></aside>

                <section class="priceViewResult--bBackground">

                    <%-- 검색 결과 없을 시 --%>
                    <c:choose>
                        <c:when test="${empty searchList}" >
                            <div class="priceViewResult--main__bBox">
                                <div class="emptyList">${keyword}에 해당하는 상품/상점이 없습니다.</div>
                            </div>
                        </c:when>
                        <%-- 검색 결과 있을 시 --%>
                        <c:otherwise>
                            <div class="priceViewResult--main__bBox">
                                <c:forEach items="${searchList}" var="item" begin="0" end="14">
                                    <div class="item">
                                        <c:choose>
                                            <c:when test="${not empty item.thumbnail}">
                                            <img src="${item.thumbnail}" alt="상품 사진">
                                            </c:when>
                                            <c:otherwise>
                                            <img src="/resources/src/img/no_image.jpeg">
                                            </c:otherwise>
                                        </c:choose>
                                        <div><fmt:formatNumber value="${item.goodsPrice}" pattern="##,###,###"/>원</div>
                                        <div>${item.goodsTitle}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </section>

                <aside class="content--aside__bRight"></aside>
            </section>
            </form>
            <!--  -->

            <section class="content--priceViewResult__bottomPlus">
<!-- <%-- 더보기를 눌렀을 때는 <%= keyword %>으로 검색한 페이지로 이동되도록 form 작성 --%> -->
            <form action="/goods/search/goodsList" method="GET">
                <input type="hidden" name="query" value="${param.keyword}" />
                <button>더보기</button>
            </form>
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