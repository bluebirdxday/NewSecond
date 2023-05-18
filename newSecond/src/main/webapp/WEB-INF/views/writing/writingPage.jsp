<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/writing/writing.css">
    <title>New Second</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <main class="content--post__topMargin">
        <section class="content--post__background">
        <section class="content--post__topFix">글쓰기
            <div class="requiredMark">*: 필수 항목</div>
        </section>

        <aside class="content--post__leftSide"></aside>

        <!-- main content -->
        <section class="content--post__main">

        <form action="/submit" method="POST" enctype="multipart/form-data"> <%-- form 태그 시작 --%>
            
            <div class="post--main__inputTitle">
                <div>
                    <label for="title" class="labelTitle">제목</label><span>*</span>
                    <span id="textLimit20Result">(0/20)</span>
                </div>
                <article>
                    <input class="textLimit20" id="title" type="text" placeholder="제목을 입력해주세요." maxlength="20" required>
                </article>
            </div>
            <div class="post--main__inputImage">
                <div>
                    <label for="fileInput" class="labelTitle">상품이미지</label><span>*</span>
                    <span>(0/5)</span>
                </div>
                <article>
                    <div class="post--main__ImageContainer">
                        <div>
                            <a href="#" id="imagePlus">+</a>
                            <input type="file" id="fileInput" style="display: none;" accept="image/*">
                        </div>
                        <div class="post--main__ImageScroller">
                            <%-- 이 안에 img 형식으로 파일이 담김 --%>
                        </div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="post--main__inputDetailText">
                <div>
                    <label for="detailText" class="labelTitle">상세설명</label><span>*</span>
                    <span id="textLimit500Result">(0/500)</span>
                </div>
                <article>
                    <textarea rows="4" cols="50"
                        class="textLimit500"
                        id="detailText"
                        placeholder="구입 연도, 브랜드, 사용감, 하자 유무 등 판매하고자 하는 상품과 관련된 정보를 포함하여 게시글 내용을 작성해주세요.(500자 이내)"
                        maxlength="500" required></textarea>
                </article>
            </div>
            <div class="post--main__inputPrice">
                <div>
                    <label for="priceInput" class="labelTitle">가격</label><span>*</span><input type="number" min="1" placeholder="10000" id="priceInput" required>원
                </div>
            </div>
            <div class="post--main__inputQuantity">
                <div>
                    <label for="quantityInput" class="labelTitle">수량</label><span>*</span><input type="number" min="1" placeholder="1" id="quantityInput" required>개
                </div>
            </div>
            <div class="post--main__inputCondition">
                <div>
                    <label for="inputCondition" class="labelTitle">상태</label><span>*</span>
                    <article class="post--main__inputConditionSelector">
                        <label>
                            <input type="radio" name="inputCondition" required>새상품
                        </label>
                        <label>
                            <input type="radio" name="inputCondition" required>중고상품
                        </label>
                    </article>
                </div>
            </div>
            <div class="post--main__inputCategory">
                <div>
                    <label for="category" class="labelTitle">카테고리</label><span>*</span>
                    <article class="inputCategorySelector">
                        <div id="category--1depth">
                            <div class="category--1depth__clothing">의류</div>
                            <div class="category--1depth__fashion">패션잡화</div>
                            <div class="category--1depth__digital">디지털/가전</div>
                            <div class="category--1depth__life">생활</div>
                            <div class="category--1depth__hobby">취미</div>
                            <div class="category--1depth__other">기타</div>
                        </div>
                        <div id="category--2depth">
                            <div style="color: #E3E3E3;">2차 카테고리까지 선택해주세요.</div> 
                        </div>
                    </article>
                </div>
            </div>
        </section>
        <!-- main content -->

        <aside class="content--post__rightSide"></aside>

        <section class="content--post__bottomFix">
        <button type="submit">등록하기</button>
        </section>

    </form>  <%-- form 태그 끝 --%>
    </section>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/writing/writing.js"></script>

</body>
</html>