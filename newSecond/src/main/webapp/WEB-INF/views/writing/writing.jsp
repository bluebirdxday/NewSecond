<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/writing/writing.css">

    <title>html문서 제목</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <main>
        <section class="content--post__background">
        <section class="content--post__topFix">기본정보
            <div class="requiredMark">*: 필수 항목</div>
        </section>

        <aside class="content--post__leftSide"></aside>

        <!-- main content -->
        <section class="content--post__main">
            
            <div class="post--main__inputTitle">
                <div>
                    <span>제목</span><span>*</span>
                    <span>(0/30)</span>
                </div>
                <article>
                    <input type="text" placeholder="제목을 입력해주세요." required>
                </article>
            </div>
            <div class="post--main__inputImage">
                <div>
                    <span>상품이미지</span><span>*</span>
                    <span>(0/10)</span>
                </div>
                <article>
                    <div class="post--main__ImageContainer">
                        <div>
                            <a href="#">+</a>
                        </div>
                        <div class="post--main__ImageScroller">
                            <img src="/web/src/img/글쓰기 페이지/test2.jpg">
                            <img src="/web/src/img/글쓰기 페이지/test3.jpg">
                            <img src="/web/src/img/글쓰기 페이지/test1.jpg">
                            <img src="/web/src/img/글쓰기 페이지/test1.jpg">
                            <img src="/web/src/img/글쓰기 페이지/test1.jpg">
                        </div>
                    </div>
                </article>
            </div>
            <div class="post--main__inputDetailText">
                <div>
                    <span>상세설명</span><span>*</span>
                    <span>(0/500)</span>
                </div>
                <article>
                    <textarea rows="4" cols="50"
                        placeholder="구입 연도, 브랜드, 사용감, 하자 유무 등 판매하고자 하는 상품과 관련된 정보를 포함하여 게시글 내용을 작성해주세요.(500자 이내)"
                        maxlength="500" required></textarea>
                </article>
            </div>
            <div class="post--main__inputPrice">
                <div>
                    <span>가격</span><span>*</span><input required>원
                </div>
            </div>
            <div class="post--main__inputQuantity">
                <div>
                    <span>수량</span><span>*</span><input type="number" min="1" placeholder="1" required>개
                </div>
            </div>
            <div class="post--main__inputCondition">
                <div>
                    <span>상태</span><span>*</span>
                    <article class="post--main__inputConditionSelector">
                        <input type="radio" name="inputCondition">새상품
                        <input type="radio" name="inputCondition">중고상품
                    </article>
                </div>
            </div>
            <div class="post--main__inputCategory">
                <div>
                    <span>카테고리</span><span>*</span>
                    <article class="inputCategorySelector">
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                    </articlec>
                </div>
            </div>
        </section>
        <!-- main content -->

        <aside class="content--post__rightSide"></aside>

        <section class="content--post__bottomFix"><button type="submit">등록하기</button></section>
    </section>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/writing/writing.js"></script>

</body>
</html>