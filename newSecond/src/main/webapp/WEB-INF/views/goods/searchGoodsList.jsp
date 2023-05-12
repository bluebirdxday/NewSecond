<!--[서지영] 검색 목록 페이지 - 검색 기능, 검색 목록 기능별 조회, 더보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 목록 페이지</title>
    
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
                    <!-- 목록건수 jsp구현 -->
                    <div class="searchNameCount">프라이탁 (152건)</div>
                    <!-- 판매완료상품제외 -->
                    <!-- js: 체크박스 누르면 판매 완료 상품은 제외하고 보이게. -->
                    <div><input type="checkbox" class="soldoutExcept" id="check1">
                        <label for="check1"> 판매 완료 상품 제외</label>
                    </div>
                    <!-- 기능별 조회 js-->
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
                <div class="container--inner__middle">
                    <div class="goods1">
                        <!-- 3개 다 DB호출 -->
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods2">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods3">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods4">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods5">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods6">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods7">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods8">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods9">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods10">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods11">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods12">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods13">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods14">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                    <div class="goods15">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">248,000원</div>
                        <div class="goods_title">프라이탁 라씨(거의 새것)</div></a>
                    </div>
                    <div class="goods16">
                        <a href="#"><img src="/resources/scr/img/cat2.png">
                        <div class="goods_price">180,000원</div>
                        <div class="goods_title">프라이탁 하와이파이브오 판매합니다!</div></a>
                    </div>
                </div>
                <div class="container--inner__bottom">
                    <!-- 일정 상품 갯수만큼 뜨고 밑에 버튼 누르면 상품 더 보이도록. 
                    비동기식 사용 ajax로 구현..?-->
                    <button class="more">MORE</button>
                </div>
            </div>


        </div>


        <!-- footer -->
        <%-- <script src="/resources/js/검색목록페이지.js"></script> --%>
    </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>