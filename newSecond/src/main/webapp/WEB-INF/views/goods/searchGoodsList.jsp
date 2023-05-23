<!--[서지영] 검색 목록 페이지 - 검색 기능, 검색 목록 기능별 조회, 더보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="searchGoodsList" value="${map.searchGoodsList}"/>
<c:set var="searchGoodsCount" value="${map.searchGoodsCount}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.query} 검색 결과</title>
    
    <link rel="stylesheet" href="/resources/css/goods/searchGoodsList.css">

</head>
<body style="overflow: auto;">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div>
        <!-- header -->
        <!-- content 내용 부분 -->
        <div class="container--outer">
            <!--  -->
            <div class="container--inner">
                <!-- 목록건수, 판매완료상품제외, 기능별조회 -->
                <div class="container--inner__top">
                    <c:if test="${not empty param.query}" >
                        <div class="searchNameCount">${param.query} (${searchGoodsCount}건)</div>
                        <%-- <c:set var="query" scope="application" value="${param.query}"/> --%>
                    </c:if>
                    <!-- 판매완료상품제외 -->
                    <div><input type="checkbox" class="soldoutExcept" id="check1">
                        <label for="check1"> 판매 완료 상품 제외</label>
                    </div>
                    <!-- 기능별 조회 -->
                    <div class="selectSort">
                        <span id="selecSortRecent">최신순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortRowPrice">낮은가격순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortHighPrice">높은가격순</span>
                        <span class="container--inner__top_sort_split"> | </span>
                        <span id="selectSortFamous">인기순</span>
                    </div>
                </div>
                <c:choose>
                    <%-- 해당 검색 결과 없다면 --%>
                    <c:when test="${empty searchGoodsList}">
                        <div class="container--inner__middle_noList">
                            <div class="noGoodsList">"${param.query}"에 해당하는 상품/상점이 없습니다.</div>
                        </div>
                    </c:when>
                        
                    <%-- 해당 검색 결과 있다면 --%>
                    <c:otherwise>
                        <div class="container--inner__middle" id="goodsListTable">
                            <c:forEach items="${searchGoodsList}" var="searchGoods" begin="0" end="11">
                            <div class="goods">
                                <a href="/goods/${searchGoods.goodsNo}">
                                <%-- 썸네일 --%>
                                <c:choose>
                                    <c:when test="${not empty searchGoods.thumbnail}">
                                        <img src="${searchGoods.thumbnail}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/src/img/no_image.jpeg">
                                    </c:otherwise>
                                </c:choose>
                                <div class="goods_price"><fmt:formatNumber value="${searchGoods.goodsPrice}" pattern="##,###,###"/></div>
                                <div class="goods_title">${searchGoods.goodsTitle}</div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!-- 더보기 버튼-->
                <c:choose>
                    <c:when test="${fn:length(searchGoodsList) gt 12}">
                        <div class="container--inner__bottom">
                            <button class="more" id="viewMoreGoods">MORE</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="container--inner__bottom" style="display:none">
                            <button class="more" id="viewMoreGoods">MORE</button>
                        </div>
                    </c:otherwise>
                </c:choose> 
            </div>


        </div>

        <script src="/resources/js/goods/searchGoodsList.js"></script>
        <script src="/resources/js/goods/moreGoods.js"></script>

        <!-- footer -->
    </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>