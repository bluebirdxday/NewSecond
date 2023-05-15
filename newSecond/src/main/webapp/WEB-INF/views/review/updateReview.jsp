<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/review/updateReview-style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>

        <form action="/review/updateReview" id="updateReviewForm" method="POST">

            <section class="writereview--container">
        
                <div class="writereview--container__top">기본 정보</div>
        
                <div class="writereview--container__content">
        
                    <div class="writereview--content__rating">
                        <span>별점</span>
                        
                        <span class="rating--star">
                            ⭐⭐⭐⭐⭐
                            <span  style="width:${review.reviewStars * 10}%;">⭐⭐⭐⭐⭐</span>
                            <input type="range" name="reviewStars" oninput="drawStar(this)"
                                value="${review.reviewStars}" step="1" min="0" max="10">
                        </span>
                        
                    </div>
        
                    <div class="writereview--content__input">
                        <span>구매내역</span>
                        <div class="writereview--text__title">${review.goodsTitle}</div>
                
                        <input type="hidden" name="goodsNo" value="${review.goodsNo}">
        
                        <div class="writereview--textarea">
                            <textarea name="reviewMessage" cols="103" rows="20" placeholder="자세한 거래 후기를 작성해주세요. 무분별한 비난 및 욕설은 제재를 받으실 수 있습니다." 
                            maxlength="200">${review.reviewMessage}</textarea>
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