<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty shop.reviewList}" >
    <c:set var="shopStarAvg" value="0"/>
    <c:forEach items="${shop.reviewList}" var="review">
        <c:set var="shopStarAvg"  value="${shopStarAvg + review.reviewStars}"/>
    </c:forEach>
    <c:set var="shopStarAvg" value="${shopStarAvg/fn:length(shop.reviewList)}"/>
</c:if>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/shop/shop-style.css">
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
    
    <section class="myshop--profile">

        <div class="myshop--profileImage__container">
            <div class="myshop--profileImage__crop">
                <img src="${shop.userImage}" class="myshop--profileImage__img">
            </div>
        </div>

        <div class="myshop--info__container">
            <div class="myshop--info__top">
                <div>
                    <div class="myshop--info__title">${shop.shopTitle}</div>
                    <span class="myshop--stars_rating">
                        ⭐⭐⭐⭐⭐
                        <span style="width:${shopStarAvg * 10 +1}%; display:inline-block; text-shadow: 0 0 0 gold;">⭐⭐⭐⭐⭐</span>
                    </span>
                </div>

                <div>
                    <c:if test="${loginUserNo==shop.userNo}" >
                        <div class="myshop--info__btn-edit">편집</div>
                    </c:if>

                    <c:if test="${loginUserNo!=shop.userNo}" >
                        <c:if test="${checkFollow==0}">
                            <button type="button" class="myshop--info__btn-follow" onclick="follow(${shop.userNo}, ${loginUserNo})">팔로우</button>
                        </c:if>
                        <c:if test="${checkFollow==1}">
                            <button type="button" class="myshop--info__btn-unfollow" onclick="unFollow(${shop.userNo}, ${loginUserNo})">언팔로우</button>
                        </c:if>
                    </c:if>
                </div>
            </div>

            <div class="myshop--info__middle1">
                <div class="myshop--info__content">
                    ${shop.shopInfo}
                </div>
            </div>

            <div class="myshop--info__middle2">
                <div>
                    <div class="myshop--info__follower">팔로워</div>
                    <div class="myshop--info__follower-txt">${fn:length(followerList)}명</div>
                </div>

                <div>
                    <div class="myshop--info__openday">오픈일</div>
                    <div class="myshop--info__openday-txt">${openDays}일 전</div>
                </div>

                <div>
                    <div class="myshop--info__sellcount">판매건수</div>
                    <div class="myshop--info__sellcount-txt">${shop.sellCount}회</div>
                </div>

            </div>

            <div class="myshop--info__bottom">
                <div class="myshop--info__btn-report">
                    <a href="#">
                        <img src="/resources/src/img/siren.png">
                        <div>신고하기</div>
                    </a>
                    <p class="arrow_box">무분별한 신고는 제재 대상이 될 수 있습니다</p>
                </div>
            </div>

        </div>

    </section>

    <!-- 편집 팝업 -->
    <section class="myshop--popup__edit">
        <div class="myshop--popup__background">
            <div class="myshop--window">
                <div class="myshop--popup">
                    <div class="myshop--popup__top">
                        <div>내 상점 편집</div>
                        <img src="/resources/src/img/closePopup.png" class="myshop--popup__btn-close"/>
                    </div>

                    <!-- form 태그 추가 + 저장버튼 클릭 시 제출 필요 -->
                    <!-- myPage.js, myPage-info.jsp 파일 참고 -->
                    <div class="myshop--popup__content">
                        <div>
                            <img src="${shop.userImage}" class="upload">
                            <img src="/resources/src/img/notifications.png" class="changeProfileImg" style="display: none;">
                            <input type="file" class="myshop--popup__profile-edit real-upload" accept="image/*" style="display: none;"> <!-- 내상점 이미지 -->
                        </div>
                        <div>
                            <input type="text" class="myshop--popup__input-edit" minlength="3" maxlength="20" value="${shop.shopTitle}"> 
                            <span>(<span id="myshopEditInput">0</span>/20)</span>
                        </div>
                        <div>
                            <textarea name="" id="" class="myshop--popup__textarea-edit" cols="35" rows="5" maxlength="50">${shop.shopInfo}</textarea>
                            <span>(<span id="myshopEditTextArea">0</span>/50)</span>
                        </div>
                        <div>
                            <button class="myshop--popup__btn-save">저장</button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>

    
    <section class="myshop--tab">

        <div class="myshop--tab__container">
            
            <div class="tabs">
                <ul>
                    <li class="tabs--active"><a href="#" rel="tab1">상품 <div>${fn:length(goodsBoardList)}</div></a></li>
                    <li><a href="#" rel="tab2">후기 <div>${fn:length(shop.reviewList)}</div></a></li>
                    <li><a href="#" rel="tab3">팔로잉 <div>${fn:length(followList)}</div></a></li>
                    <li><a href="#" rel="tab4">팔로워 <div>${fn:length(followerList)}</div></a></li>
                </ul>
            </div>
            
            <!-- 상품 탭 -->
            <div id="tab1" class="myshop--tab__content tabs--active">
                <div class="myshop--tab1__content-top">
                        <ul>
                            <li class="sort--active"><a href="#" rel="">최신순</a></li>
                            <li><a href="#" rel="">인기순</a></li>
                            <li><a href="#" rel="">저가순</a></li>
                            <li><a href="#" rel="">고가순</a></li>
                        </ul>
                </div> 


                <div class="myshop--tab1__gridcontainer">
                    <c:if test="${not empty goodsBoardList}" >
                        <c:forEach items="${goodsBoardList}" var="goods">
                                    <!-- 상품 탭 리스트 아이템(게시글) : 추후에 DB에서 자동으로 로드할 수 있게 기능 구현-->
                                    <div class="tab1--gridcontainer__item">
                                        <div class="tab1--item__img">
                                            <img src="/resources/src/img/cat.jpg">
                                        </div>
                                        <div class="tab1--item__description">
                                            <div> 
                                            <c:choose>
                                                <c:when test="${fn:length(goods.goodsTitle) > 10}">
                                                    ${fn:substring(goods.goodsTitle, 0, 10)}...
                                                </c:when>
                                                
                                                <c:otherwise>
                                                    ${goods.goodsTitle} 
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div>
                                                <div><fmt:formatNumber value="${goods.goodsPrice}" type="number"/></div>
                                                <div>3시간 전</div>
                                            </div>
                                        </div>
                                    </div>
                        </c:forEach>
                    </c:if>

                </div>
                <c:if test="${empty goodsBoardList}" >
                    <div class="tab--content__empty">현재 판매하고 있는 상품이 없습니다.</div>
                </c:if>

            </div>
        
            <!-- 후기 탭 -->
            <div id="tab2" class="myshop--tab__content">

                <div class="tab2--container">

                    <c:if test="${not empty shop.reviewList}" >
                        <c:forEach items="${shop.reviewList}" var="review">
                                <div class="tab2--container__item">
                                    <div class="tab2--item__detail">
                                        <div class="tab2--item__img"><img src="/resources/src/img/basic_profile.png"></div>
                                        <div>
                                            <div>
                                                <div class="tab2--item__username">${review.shopTitle}</div>
                                                    <span class="myshop--stars_rating">
                                                        ⭐⭐⭐⭐⭐
                                                        <span style="width:${review.reviewStars * 10 + 1}%; display:inline-block; text-shadow: 0 0 0 gold;">⭐⭐⭐⭐⭐</span>
                                                    </span>
                                                </div>
                                            <div class="tab2--item__message">${review.reviewMessage}</div>
                                        </div>
                                    </div>

                                    <div>${review.goodsTitle}</div>
                                </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${empty shop.reviewList}" >
                        <div class="tab--content__empty">현재 후기가 존재하지 않습니다.</div>
                    </c:if>

                </div>
            </div>


            <!-- 팔로잉 탭 -->
            <div id="tab3" class="myshop--tab__content">
                <div class="myshop--tab3__gridcontainer">
            
                    <c:if test="${not empty followList}" >
                        <c:forEach items="${followList}" var="follow">
                            <div class="tab3--container__item">
                                <div><img src="${follow.userImage}"> </div>
                                <div>${follow.shopTitle}</div>
                                <div>
                                    <div>${follow.shopInfo}</div>
                                </div>
                                <div>
                                    <a href="/shop/${follow.passiveUserNo}"> <div class="tab3--item__btn-gotoshop tab3--item__btn">상점가기</div></a>
                                        <c:if test="${follow.followYou==0}">
                                            <button class="tab3--item__btn-follow tab3--item__btn" onclick="follow(${follow.passiveUserNo}, ${loginUserNo})">팔로우</button>
                                        </c:if>

                                        <c:if test="${follow.followYou==1}" >
                                            <button class="tab3--item__btn-unfollow tab3--item__btn" onclick="unFollow(${follow.passiveUserNo}, ${loginUserNo})">언팔로우</button>
                                        </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>

                <c:if test="${empty followList}" >
                    <div class="tab--content__empty">현재 팔로잉하고 있는 상점이 없습니다.</div>
                </c:if>
                
            </div>

            <!-- 팔로워 탭 -->
            <div id="tab4" class="myshop--tab__content">
                <div class="myshop--tab3__gridcontainer">
                    
                    <c:if test="${not empty followerList}" >
                        <c:forEach items="${followerList}" var="follower">
                            <div class="tab3--container__item">
                                <div><img src="${follower.userImage}"></div>
                                <div>${follower.shopTitle}</div>
                                <div>
                                        <div>${follower.shopInfo}</div>
                                </div>
                                <div>
                                    <a href="/shop/${follower.activeUserNo}"> <div class="tab3--item__btn-gotoshop tab3--item__btn">상점가기</div></a>
                                        <c:if test="${follower.followYou==0}">
                                            <button class="tab3--item__btn-follow tab3--item__btn" onclick="follow(${follower.activeUserNo}, ${loginUserNo})">팔로우</button>
                                        </c:if>

                                        <c:if test="${follower.followYou==1}" >
                                            <button class="tab3--item__btn-unfollow tab3--item__btn" onclick="unFollow(${follower.activeUserNo}, ${loginUserNo})">언팔로우</button>
                                        </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>


                </div>

                <c:if test="${empty followerList}" >
                    <div class="tab--content__empty">현재 팔로워가 존재하지 않습니다.</div>
                </c:if>
            </div>
        </div>

    </section>

    <a href="/review/reviewList">
        <div class="myshop--btn__fixed-addpost">
            <img src="/resources/src/img/addPost.png">
        </div>
    </a>


    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <a href="/writing/writing">
        <button>글쓰기테스트버튼입니다</button>
    </a>

    <script src="/resources/js/shop.js"></script>
    
</body>
</html>