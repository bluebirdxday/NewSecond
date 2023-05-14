<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/review/reviewList-style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>

        <form action="/review/reviewList/updateReview" method="POST">
            <section class="review--container">

                <div class="review--container__top">후기 작성 내역</div>

                <div class="review--container__content">

                <c:if test="${not empty reviewList}" >
                    <c:forEach items="${reviewList}" var="review">

                        <div class="reivew--item">
                            <!-- form 태그로 감싸기? 수정 버튼을 눌렀을 때 후기의 정보가 넘어가야 함 -->
                            <div class="reivew--item__top">
                                <div>
                                    <div id="reviewTitle">${review.goodsTitle}</div>
                                    <div id="reviewRating">
                                        <span class="myshop--stars_rating">
                                            ⭐⭐⭐⭐⭐
                                            <span style="width:${review.reviewStars * 10 + 1}%; display:inline-block; text-shadow: 0 0 0 gold;">⭐⭐⭐⭐⭐</span>
                                        </span>
                                    </div>
                                </div>

                                <input type="hidden" name="reviewNo" value="${review.reviewNo}">

                                <div>
                                    <button name="updateReview" id="modifyReviewBtn" >수정</button>
                                    <button type="button" id="deleteReviewBtn" onclick="deleteReview(${review.reviewNo})">삭제</button>
                                </div>
                            </div>

                            <div class="reivew--item__content">
                                ${review.reviewMessage}
                            </div>
                        </div>

                    </c:forEach>
                </c:if>


                <c:if test="${empty reviewList}" >
                    <div>후기 작성 내역이 존재하지 않습니다.</div>
                </c:if>


                </div>

                <c:if test="${not empty canWriteReviewList}" >
                    <a href="/review/addReview">
                        <div class="review--btn__fixed-addpost">
                            <img src="/resources/src/img/addPost.png">
                        </div>
                    </a>
                </c:if>
                <!-- 후기 작성 버튼 -->

            </section>
        </form>

    </main>
    

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/reviewList.js"></script>


</body>
</html>