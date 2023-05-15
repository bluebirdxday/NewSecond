<!--[서지영] 물품 상세 페이지 - 물품 상세 설명, 사진 여러장, 찜, 조회수, 상점정보(상점 바로가기, 채팅 팝업) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>물품 상세 페이지</title>
    
    <link rel="stylesheet" href="/resources/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/src/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/goods/goodsDetail.css">
    
</head>
<body style="overflow: auto;">
    <div>
        <!-- header -->
        <div><jsp:include page="/WEB-INF/views/common/header.jsp"/></div>

        <!-- content 내용 부분 -->
        <div class="container--outer">
            <div class="container--inner">
                <div class="container--inner__top">
                    <div class="container--inner__top__left">
                    <%-- DB 불러오기 --%>
                        <img src="/resources/src/img/freitag1.jpeg">
                    </div>
                    <div class="container--inner__top__right">
                        <div class="container--inner__top__right__title">프라이탁 하와이파이브오 판매합니다!</div>
                        <div class="container--inner__top__right__price">180,000원</div>
                        <div class="container--inner__top__right__viewAndLike">
                            <div class="container--inner__top__right__view">조회</div>
                            <div class="container--inner__top__right__viewCount">107&nbsp;&nbsp;&nbsp;</div>
                            <%-- 좋아요 구역 --%>
                            <div class="container--inner__top__right__likeHeart">
                            <%-- js에서 기존 좋아요 여부 확인 시 class명 사용 --%>
                            <%-- 좋아요 누른 적 없거나ㅡ 로그인 x --%>
                                <img src="/resources/src/img/heartBefore.png" id="goodsLike" class="beforeLike">
                            <%-- 좋아요 눌렀을 때 --%>
                                <img src="/resources/src/img/heartAfter.png" id="goodsLike" class="afterLike">
                            </div>
                            <label for="goodsLike"><div class="container--inner__top__right__like">찜</div></label>
                            <div class="container--inner__top__right__likeCount">24</div>
                        </div>
                        <div class="container--inner__top__right__describe">
                            <div class="container--inner__top__right__describeTitle">상세 설명</div>
                            <div class="container--inner__top__right__describeContent">판매자가 작성한 상품 관련 상세 설명란</div>
                        </div>
                    </div>
                </div>
                <div class="container--inner__bottom">
                    <div class="container--inner__bottom__shopInfo__folder__outer">
                        <div class="container--inner__bottom__shopInfo__folder">상점 정보</div>
                    </div>
                    <div class="container--inner__bottom__shopInfo">
                        <div class="container--inner__bottom__shopInfo__profile"><img src="/resources/src/img/profile.png"></div>
                        <div class="container--inner__bottom__shopInfo__others">
                            <div class="container--inner__bottom__shopInfo__buttons">
                                <!-- 판매자 상점으로 이동, 상점 이름 db 불러오기 -->
                                <div class="container--inner__bottom__shopInfo_shopTitleButton"><a href="/goodsDetail/moveShop">빅웨이브</a></div>
                                <!-- 채팅 팝업/사이트 이동 -->
                                <div class="container--inner__bottom__shopInfo__chattingButton"><a href="#">채팅하기</a></div>
                            </div>
                            <div class="container--inner__bottom__shopInfo__shopDescibe">
                                <pre>안녕하세요~!<br>좋은 상품 좋은 가격 많이 구경와주세요!</pre></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="/resources/js/goods/goodsDetail.js"></script>

        <!-- footer -->
        <div><footer data-include="/web/include/footer.html"></footer></div>
    </div>
    
</body>
</html>