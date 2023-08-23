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
                <img src="${shop.shopProfile}" class="myshop--profileImage__img">
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


                <div class = "myshop--info__btn-container">
                    <c:if test="${loginUserNo!=0}" >
                        <c:if test="${loginUserNo==shop.userNo}" >
                            <div class="myshop--info__btn-edit" id="img-edit">편집</div>
                        </c:if>

                        <c:if test="${loginUserNo!=shop.userNo}" >
                            <c:if test="${checkFollow==0}">
                                <button type="button" class="myshop--info__btn-follow" onclick="shopOwnerFollow(${shop.userNo}, ${loginUserNo})">팔로우</button>
                            </c:if>
                            <c:if test="${checkFollow==1}">
                                <button type="button" class="myshop--info__btn-unfollow" onclick="shopOwnerUnfollow(${shop.userNo}, ${loginUserNo})">언팔로우</button>
                            </c:if>
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
            <c:if test="${loginUserNo!=0 && loginUserNo!=shop.userNo}" >
                <div class="myshop--info__btn-report">
                    <a href="/qna/qna">
                        <img src="/resources/src/img/siren.png">
                        <div>신고하기</div>
                    </a>
                    <p class="arrow_box">무분별한 신고는 제재 대상이 될 수 있습니다</p>
                </div>
            </c:if>
            </div>

        </div>

    </section>

    <form action="/shop/updateShopInfo" method="POST" id="updateShopInfoFrm" enctype="multipart/form-data">
        <!-- 편집 팝업 -->
        <section class="myshop--popup__edit">
            <div class="myshop--popup__background">
                <div class="myshop--window">
                    <div class="myshop--popup">
                        <div class="myshop--popup__top">
                            <div>내 상점 편집</div>
                            <img src="/resources/src/img/closePopup.png" class="myshop--popup__btn-close"/>
                        </div>

                        <div class="myshop--popup__content">
                            <div>
                                <img src="${shop.shopProfile}" class="upload">  <%-- 선택한 이미지 --%>
                                <input type="file" name="shopNewProfile" class="myshop--popup__profile-edit real-upload" 
                                    accept="image/*" style="display: none;">
                            </div>
                            <div>
                                <input type="text" class="myshop--popup__input-edit" name="shopTitle" value="${shop.shopTitle}" autocomplete="off"> 
                                <span>(<span id="myshopEditInput">0</span>/20)</span>
                            </div>
                            <div>
                                <textarea name="shopInfo" class="myshop--popup__textarea-edit" cols="35" rows="5" maxlength="50">${shop.shopInfo}</textarea>
                                <span>(<span id="myshopEditTextArea">0</span>/50)</span>
                            </div>
                            <input type="hidden" name="userNo" value="${shop.userNo}">
                            <div>
                                <button class="myshop--popup__btn-save">저장</button>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </section>
    </form>

    
    <section class="myshop--tab">

        <div class="myshop--tab__container">
            
            <div class="tabs">
                <ul>
                    <li class="tabs--active"><a href="javascript:void(0);" rel="tab1">상품 <div>${fn:length(goodsBoardList)}</div></a></li>
                    <li><a href="javascript:void(0);" rel="tab2">후기 <div>${fn:length(shop.reviewList)}</div></a></li>
                    <li><a href="javascript:void(0);" rel="tab3">팔로잉 <div id="followingCount">${fn:length(followList)}</div></a></li>
                    <li><a href="javascript:void(0);" rel="tab4">팔로워 <div id="followerCount">${fn:length(followerList)}</div></a></li>
                </ul>
            </div>
            
            <!-- 상품 탭 -->
            <div id="tab1" class="myshop--tab__content tabs--active">
                <div class="myshop--tab1__content-top">
                        <ul>
                            <li class="sort--active"><a href="/shop/${shop.userNo}">최신순</a></li>
                            <li class="by-popularity"><a href='javascript:void(0);'>인기순</a></li>
                            <li class="by-lowprice"><a href='javascript:void(0);'>저가순</a></li>
                            <li class="by-highprice"><a href='javascript:void(0);'>고가순</a></li>
                        </ul>
                </div> 


                <div class="myshop--tab1__gridcontainer">
                    <c:if test="${not empty goodsBoardList}" >
                        <c:forEach items="${goodsBoardList}" var="goods">
                                
                                <a href="/goods/${goods.goodsNo}">
                                
                                    <div class="tab1--gridcontainer__item">
                                        <div class="tab1--item__img">
                                            <img src="${goods.thumbnail}" 
                                                    <c:if test="${goods.goodsStatus=='E' || goods.goodsStatus=='C'}"> 
                                                            style="filter : brightness(40%);"</c:if>
                                            >

                                            <c:if test="${goods.goodsStatus=='E'}" >
                                                <div class="overlay-text soldout">
                                                    Sold Out
                                                </div>
                                            </c:if>
                                            

                                            <c:if test="${goods.goodsStatus=='C'}" >
                                                <div class="overlay-text reserved">
                                                    Reserved
                                                </div>
                                            </c:if>
                                            

                                        </div>
                                        <div class="tab1--item__description">
                                            <div> 
                                            <c:choose>
                                                <c:when test="${fn:length(goods.goodsTitle) > 9}">
                                                    ${fn:substring(goods.goodsTitle, 0, 9)}...
                                                </c:when>
                                                
                                                <c:otherwise>
                                                    ${goods.goodsTitle} 
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div>
                                                <div><fmt:formatNumber value="${goods.goodsPrice}" type="number"/></div>
                                                <div>${goods.sellEnrollDate}</div>
                                            </div>
                                        </div>
                                    </div>
                                
                                </a>

                        </c:forEach>
                    </c:if>
                </div>

                <c:if test="${empty goodsBoardList}" >
                    <div class="tab--content__empty">현재 판매하고 있는 상품이 없습니다</div>
                </c:if>

            </div>
        
            <!-- 후기 탭 -->
            <div id="tab2" class="myshop--tab__content">

                <div class="tab2--container">

                    <c:if test="${not empty shop.reviewList}" >
                        <c:forEach items="${shop.reviewList}" var="review">
                                <div class="tab2--container__item">
                                    <div class="tab2--item__detail">
                                        <div class="tab2--item__img"><img src="${review.shopProfile}"></div>
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
                        <div class="tab--content__empty">현재 후기가 존재하지 않습니다</div>
                    </c:if>

                </div>
            </div>


            <!-- 팔로잉 탭 -->
            <div id="tab3" class="myshop--tab__content">
                <div class="following_tab myshop--tab3__gridcontainer">
            
                    <c:if test="${not empty followList}" >
                        <c:forEach items="${followList}" var="follow">
                            <div class="tab3--container__item">
                                <div><img src="${follow.shopProfile}"> </div>
                                <div>${follow.shopTitle}</div>
                                <div>
                                    <div>${follow.shopInfo}</div>
                                </div>
                                <div>

                                    <a href="/shop/${follow.passiveUserNo}">
                                        <div class="tab3--item__btn-gotoshop tab3--item__btn"
                                            style="<c:if test='${loginUserNo==0 || follow.passiveUserNo==loginUserNo}'>width: 160px;</c:if>">
                                            상점가기
                                        </div>
                                    </a>

                                    
                                    <%-- 로그인 상태 --%>
                                    <c:if test="${loginUserNo!=0}" >
                                        <c:if test="${follow.passiveUserNo != loginUserNo}" >
                                            
                                            <c:if test="${follow.followYou==0}">
                                                <button class="tab3--item__btn-follow tab3--item__btn" onclick="follow(${follow.passiveUserNo}, ${loginUserNo}, 'following')">팔로우</button>
                                            </c:if>

                                            <c:if test="${follow.followYou==1}" >
                                                <button class="tab3--item__btn-unfollow tab3--item__btn" onclick="unFollow(${follow.passiveUserNo}, ${loginUserNo}, 'following')">언팔로우</button>
                                            </c:if>
                                        </c:if>
                                    </c:if>


                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>

                <c:if test="${empty followList}">
                    <div class="tab--content__empty" id="followingEmpty">현재 팔로잉하고 있는 상점이 없습니다</div>
                </c:if>
                
            </div>

            <!-- 팔로워 탭 -->
            <div id="tab4" class="myshop--tab__content">
                <div class="follower_tab myshop--tab3__gridcontainer">
                    
                    <c:if test="${not empty followerList}" >
                        <c:forEach items="${followerList}" var="follower">
                            <div class="tab3--container__item">
                                <div><img src="${follower.shopProfile}"></div>
                                <div>${follower.shopTitle}</div>
                                <div>
                                        <div>${follower.shopInfo}</div>
                                </div>
                                <div>



                                    <a href="/shop/${follower.activeUserNo}">
                                        <div class="tab3--item__btn-gotoshop tab3--item__btn"
                                            style="<c:if test='${loginUserNo==0 || follower.activeUserNo==loginUserNo}'>width: 160px;</c:if>">
                                            상점가기
                                        </div>
                                    </a>


                                    <c:if test="${loginUserNo!=0}"> 
                                        <%-- 팔로워 탭에서 팔로워!=로그인회원인 경우 팔로우/언팔로우 버튼 보이도록 --%>
                                        <c:if test="${follower.activeUserNo != loginUserNo}">

                                            <c:if test="${follower.followYou==0}">
                                                <button class="tab3--item__btn-follow tab3--item__btn" onclick="follow(${follower.activeUserNo}, ${loginUserNo}, 'follower')">팔로우</button>
                                            </c:if>

                                            <c:if test="${follower.followYou==1}">
                                                <button class="tab3--item__btn-unfollow tab3--item__btn" onclick="unFollow(${follower.activeUserNo}, ${loginUserNo}, 'follower')">언팔로우</button>
                                            </c:if>

                                        </c:if>
                                    </c:if>

                                </div>
                            </div>
                        </c:forEach>
                    </c:if>


                </div>

                <c:if test="${empty followerList}" >
                    <div class="tab--content__empty" id="followerEmpty">현재 팔로워가 존재하지 않습니다</div>
                </c:if>
            </div>

        </div>

    </section>

   <c:if test="${loginUserNo==shop.userNo}" >
        <a href="/writing/write">
            <div class="myshop--btn__fixed-addpost">
                <img src="/resources/src/img/addPost.png">
            </div>
        </a>
    </c:if>


    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <script>
        const userNo = ${shop.userNo}
    </script>

    <script src="/resources/js/shop.js"></script>


    <c:if test="${not empty edit}">
        <script>
            document.querySelector(".myshop--popup__background").classList.add("myshop--popup__show");
        </script>
    </c:if>
    
</body>
</html>