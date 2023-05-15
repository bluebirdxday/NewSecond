<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/review/addReview-style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>

        <form action="/review/addReview/insert" id="reviewForm" method="POST">

            <section class="writereview--container">
        
                <div class="writereview--container__top">기본 정보</div>
        
                <div class="writereview--container__content">
        
                    <div class="writereview--content__rating">
                        <span>별점</span>
                        
                        <span class="rating--star">
                            ⭐⭐⭐⭐⭐
                            <span>⭐⭐⭐⭐⭐</span>
                            <input type="range" name="reviewStars" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                        </span>
                        
                    </div>
        
                    <div class="writereview--content__input">
                        <span>구매내역</span>
                        <div class="writereview--dropdown">
                            <button class="writereview--dropdown__btn" type="button">
                                <span class="writereview--dropdown__btn-content">후기를 작성하고자 하는 거래 내역을 선택해주세요.</span>
                                <span class="writereview--dropdown__btn-click" style="float:right;">▼</span>
                            </button>
                            <div class="writereview--dropdown__content">
                                <c:if test="${not empty reviewList}" >
                                    <c:forEach items="${reviewList}" var="review">
                                        <div class="writereview--dropdown__item">${review.GOODS_TITLE}</div>
                                        <span style="display:none;">${review.GOODS_NO}</span>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        
                        <input type="hidden" name="goodsTitle" value="">
                        <input type="hidden" name="goodsNo" value="">
        
                        <div class="writereview--textarea">
                            <textarea name="reviewMessage" cols="103" rows="20" placeholder="자세한 거래 후기를 작성해주세요. 무분별한 비난 및 욕설은 제재를 받으실 수 있습니다." 
                            maxlength="200"></textarea>
                        </div>
                    </div>
        
                </div>
        
            </section>
        
            <section class="writereview--bottom">
                <button id="registerReviewBtn">등록하기</button>
            </section>
            
        </form>

    
    </main>
    

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/addReview.js"></script>

</body>
</html>