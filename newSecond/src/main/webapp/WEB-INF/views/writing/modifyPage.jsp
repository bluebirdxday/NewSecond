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
<%-- form 태그 시작 --%>
    <form action="/myGoods/modifySubmit" method="POST" enctype="multipart/form-data">
    <section class="content--post__background">
        <section class="content--post__topFix">게시글 수정
            <div class="requiredMark">*: 필수 항목</div>
        </section>

        <aside class="content--post__leftSide"></aside>
        <!-- main content -->
        <section class="content--post__main">
            
            <div class="post--main__inputTitle">
                <div>
                    <label for="title" class="labelTitle">제목</label><span>*</span>
                    <span id="textLimit50Result">(0/50)</span>
                </div>
                <article>
<%-- 제목 name="title" --%>                
                    <input class="textLimit50" id="title" name="title" type="text" placeholder="제목을 입력해주세요." maxlength="50" value="${goodsBoard.goodsTitle}" required>
                </article>
            </div>
            <div class="post--main__inputImage">
                <div>
                    <label for="fileInput" class="labelTitle">상품이미지</label><span></span>
                    <span id="imageCount">(0/5)</span>
                </div>
                <article>
                    <div class="post--main__ImageContainer">
                        <div>
                            <a href="#" id="imagePlus">+</a>
<%-- 이미지  name="image" --%>
                            <div id="fileInputContainer">
                                <%-- <input type="file" name="image" accept="image/*" data-id="NI" style="display: none;"> --%>
                            </div>
                        </div>
                        <div class="post--main__ImageScroller">
                            <%-- 이 안에 img 형식으로 파일이 담김(미리보기) --%>
                            <%-- <img src="325r4325r4" data-id="NI"> --%>
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
<%-- 상세 설명 name="detailText" --%>                
                    <textarea rows="4" cols="50"
                        class="textLimit500"
                        id="detailText"
                        name="detailText"
                        required
                        placeholder="구입 연도, 브랜드, 사용감, 하자 유무 등 판매하고자 하는 상품과 관련된 정보를 포함하여 게시글 내용을 작성해주세요.(500자 이내)"
                        maxlength="500">${goodsBoard.goodsDescr}</textarea>
                </article>
            </div>
            <div class="post--main__inputPrice">
                <div>
<%-- 가격 name="price" --%>                
                    <label for="priceInput" class="labelTitle">가격</label><span>*</span><input type="number" min="1" name="price" placeholder="10000" id="priceInput" value="${goodsBoard.goodsPrice}" required>원
                </div>
            </div>
            <div class="post--main__inputQuantity">
                <div>
<%-- 수량 name="quantity" --%>
                    <label for="quantityInput" class="labelTitle">수량</label><span></span><input type="number" min="1" name="quantity"  placeholder="1" id="quantityInput">개
                </div>
            </div>
            <div class="post--main__inputCondition">
                <div>
                    <label for="condition" class="labelTitle">상태</label><span></span>
                    <article class="post--main__inputConditionSelector">
<%-- 상태 name="condition" --%>                    
                        <label>
                            <input type="radio" name="condition" value="새상품">새상품
                        </label>
                        <label>
                            <input type="radio" name="condition" value="중고상품">중고상품
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
<%-- 카테고리 name="category2" --%>                        
                        <div id="category--2depth">
                            <div style="color: #E3E3E3;">2차 카테고리까지 선택해주세요.</div>
                            <%-- <label id="male2" class="category--2depth__item">남성의류<input type="radio" name="category2" value="남성의류"></label>
                                <label id="female2" class="category--2depth__item">여성의류<input type="radio" name="category2" value="여성의류"></label> --%>
                        </div>
                    </article>
                </div>
            </div>
        </section>
        <!-- main content -->

        <aside class="content--post__rightSide"></aside>

        <section class="content--post__bottomFix">
        <button type="submit" id="submitBtn">등록하기</button>
        </section>

    </section>
<%-- form 태그 끝 --%>
    </form> 
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/writing/writing.js"></script>

</body>
</html>