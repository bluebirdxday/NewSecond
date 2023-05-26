<!--[서지영] 검색 목록 페이지 - 검색 기능, 검색 목록 기능별 조회, 더보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="searchGoodsList" value="${map.searchGoodsList}"/>
<c:set var="searchGoodsCount" value="${map.searchGoodsCount}"/>
<c:set var="paramQuery" value="${param.query}"/>
<c:set var="query" value="${fn:replace(paramQuery, '/(<([^>]+)>)/ig', '')}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${query} 검색 결과</title>
    <%-- ${fn:replace(paramQuery, '/(<([^>]+)>)/ig', '')} --%>
    
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
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
                        <div class="searchNameCount">${query} (${searchGoodsCount}건)</div>
                    </c:if>
                    <!-- 판매완료상품제외 -->
                    <%-- <div><input type="checkbox" class="soldoutExcept" id="check1" onclick="soldOutCheck()">
                        <label for="check1"> 판매 완료 상품 제외</label>
                    </div> --%>
                    
                    <!-- 기능별 조회 -->
                    
                    <c:choose>
                        <c:when test="${not empty searchGoodsList}">
                            <div class="selectSort" id="selectSort">
                                <input type="radio" name="listSort" id="recent" value="recent" style="display:none" onclick="callSortedGoods(this)"><label for="recent" class="listSort">최신순&nbsp;</label>
                                <input type="radio" name="listSort" id="rowPrice" value="rowPrice" style="display:none" onclick="callSortedGoods(this)"><label for="rowPrice"  class="listSort">낮은가격순&nbsp;</label>
                                <input type="radio" name="listSort" id="highPrice" value="highPrice" style="display:none" onclick="callSortedGoods(this)"><label for="highPrice"  class="listSort">높은가격순&nbsp;</label>
                                <input type="radio" name="listSort" id="famous" value="famous" style="display:none" onclick="callSortedGoods(this)"><label for="famous" class="listSort">인기순</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="selectSort" id="selectSort" style="display:none">
                                <input type="radio" name="listSort" id="recent" value="recent" style="display:none" onclick="callSortedGoods(this)"><label for="recent" class="listSort">최신순&nbsp;</label>
                                <input type="radio" name="listSort" id="rowPrice" value="rowPrice" style="display:none" onclick="callSortedGoods(this)"><label for="rowPrice"  class="listSort">낮은가격순&nbsp;</label>
                                <input type="radio" name="listSort" id="highPrice" value="highPrice" style="display:none" onclick="callSortedGoods(this)"><label for="highPrice"  class="listSort">높은가격순&nbsp;</label>
                                <input type="radio" name="listSort" id="famous" value="famous" style="display:none" onclick="callSortedGoods(this)"><label for="famous" class="listSort">인기순</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:choose>
                    <%-- 해당 검색 결과 없다면 --%>
                    <c:when test="${empty searchGoodsList}">
                        <div class="container--inner__middle_noList">
                            <div class="noGoodsList">"${query}"에 해당하는 상품이 없습니다.</div>
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
                                        <img src="${searchGoods.thumbnail}" 
                                        >
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/src/img/no_image.jpeg">
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${searchGoods.goodsStatus=='E'}" >
                                    <div class="status soldout">
                                        Sold Out
                                    </div>
                                </c:if>
                                <c:if test="${searchGoods.goodsStatus=='C'}" >
                                    <div class="status reserved">
                                        Reserved
                                    </div>
                                </c:if>
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

        <script>
            const searchGoodsList = ${searchGoodsList}
            const cleanQuery = ${query}
        </script>
        <script src="/resources/js/goods/searchGoodsList.js"></script>
        <script src="/resources/js/goods/moreGoods.js"></script>

        <!-- footer -->
    </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>