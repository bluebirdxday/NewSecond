<!--[서지영] 물품 상세 페이지 - 물품 상세 설명, 사진 여러장, 찜, 조회수, 상점정보(상점 바로가기, 채팅 모달) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<c:if test="${not empty uploadComplete}">
    <c:set var="uploadComplete" value="${uploadComplete}"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${goodsBoard.goodsTitle}</title>
    
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
                        <c:choose>
                            <c:when test="${fn:length(goodsBoard.filesList)gt 0}">
                                <%-- 이미지_캐러셀 --%>
                                <div class="carousel-wrapper">
                                    <div class="carousel" id="imageList">
                                        <c:forEach items="${goodsBoard.filesList}" var="file" begin="0" end="${fn:length(goodsBoard.filesList)-1}">
                                            <img src="${file.filePath}${goodsBoard.userNo}/${file.fileName}">
                                        </c:forEach>
                                    </div>
                                </div>
                                <button class="prev" type="button" onclick="moveSmooth">&lt</button>
                                <button class="next" type="button" onclick="moveSmooth">&gt</button>
                            </c:when>
                            <c:otherwise>
                                <img src="/resources/src/img/no_image.jpeg">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="container--inner__top__right">
                        <div class="container--inner__top__right__title">${goodsBoard.goodsTitle}</div>
                        <div class="container--inner__top__right__price"><fmt:formatNumber value="${goodsBoard.goodsPrice}" pattern="##,###,###"/></div>
                        <div class="container--inner__top__right__viewAndLike">
                            <div class="container--inner__top__right__view">조회</div>
                            <div class="container--inner__top__right__viewCount">${goodsBoard.viewCount}&nbsp;&nbsp;&nbsp;</div>
                            <%-- 좋아요 구역 --%>
                            <div class="container--inner__top__right__likeHeart">
                            
                                <%-- 좋아요 누른 적 없거나ㅡ 로그인 x --%>
                                <c:if test="${empty likeChecked}" >
                                    <img src="/resources/src/img/heartBefore.png" id="goodsLike" class="beforeLike like">
                                </c:if>
                                <%-- 좋아요 눌렀을 때 --%>
                                <c:if test="${not empty likeChecked}" >
                                <img src="/resources/src/img/heartAfter.png" id="goodsLike" class="afterLike like">
                                </c:if>
                            </div>
                            <div class="container--inner__top__right__like">찜</div>
                            <div class="container--inner__top__right__likeCount" id="wishCount">${goodsBoard.wishCount}</div>
                        </div>
                        <div class="container--inner__top__right__describe">
                        <c:choose>
                            <c:when test="${loginUser.userNo==shop.userNo}">
                                <div class="container--inner__top__right__describeTitleAndNav">
                                    <div class="container--inner__top__right__ifDescribeTitle">&nbsp;상세 설명</div>
                                    <div class="container--inner__top__right__nav"><a href="#"><img src="/resources/src/img/menu.png"></a></div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="container--inner__top__right__describeTitle">&nbsp;상세 설명</div>
                            </c:otherwise>
                        </c:choose>
                            <div class="container--inner__top__right__describeContent">${goodsBoard.goodsDescr}</div>
                        </div>
                    </div>
                </div>
                <div class="container--inner__bottom">
                    <div class="container--inner__bottom__shopInfo__folder__outer">
                        <div class="container--inner__bottom__shopInfo__folder">상점 정보</div>
                    </div>
                    <div class="container--inner__bottom__shopInfo">
                        <div class="container--inner__bottom__shopInfo__profile">
                            <c:choose>
                                <c:when test="${not empty shop.shopProfile}">
                                    <img src="${shop.shopProfile}">
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/src/img/basic_profile.png">
                                </c:otherwise>
                            </c:choose>
                            <input type="hidden" value="${goodsBoard.goodsTitle}" id="goodsTitle">
                        </div>
                        <div class="container--inner__bottom__shopInfo__others">
                            <div class="container--inner__bottom__shopInfo__buttons">
                                <a href="/shop/${shop.userNo}"><div data-bs-toggle="tooltip" 
									data-bs-placement="top" 
									data-bs-title='"${shop.shopTitle} 상점 바로가기"' class="container--inner__bottom__shopInfo_shopTitleButton">${shop.shopTitle}</div></a>
                                <!-- 채팅 팝업/사이트 이동 -->
                                <div class="container--inner__bottom__shopInfo__chattingButton"><a href="#">채팅하기</a></div>
                            </div>
                            <div class="container--inner__bottom__shopInfo__shopDescibe">${shop.shopInfo}</div>
                            
                            <input type="hidden" id="uploadComplete" value="${uploadComplete}">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <script>
        const loginUserNo = "${loginUser.userNo}";
        const goodsNo = ${goodsBoard.goodsNo};
        const goodsUserNo = ${shop.userNo};
    </script>

        <!-- footer -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <script src="/resources/js/goods/goodsDetail.js"></script>

    </div>

    
</body>
</html>