<!--[서지영] 검색 목록 페이지 - 검색 기능, 검색 목록 기능별 조회, 더보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <div class="container--inner__middle" id="goodsListTable">
                    <c:choose>
                        <%-- 해당 검색 결과 없다면 --%>
                        <c:when test="${empty searchGoodsList}">
                            <div class="noGoodsList">"${param.query}"에 해당하는 상품/상점이 없습니다.</div>
                        </c:when>
                        
                        <%-- 해당 검색 결과 있다면 --%>
                        <c:otherwise>
                            <c:forEach items="${searchGoodsList}" var="searchGoods">
                            <div class="goods">
                                <a href="/goods/${searchGoods.goodsTitle}">
                                <%-- 썸네일 --%>
                                <c:if test="${not empty searchGoods.thumbnail}" >
                                    <img src="/resources/src/user/3/000001.jpeg">
                                </c:if>
                                <div class="goods_price">${searchGoods.goodsPrice}</div>
                                <div class="goods_title">${searchGoods.goodsTitle}</div>
                                </a>
                            
                            </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div class="container--inner__bottom">
                    <!-- 일정 상품 갯수만큼 뜨고 밑에 버튼 누르면 상품 더 보이도록. 
                    비동기식 사용 ajax로 구현..?-->
                    <button class="more" id="viewMoreGoods">MORE</button>
                </div>
            </div>


        </div>

        <script src="/resources/js/goods/searchGoodsList.js"></script>

        <%-- <!-- footer --> --%>
    </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>