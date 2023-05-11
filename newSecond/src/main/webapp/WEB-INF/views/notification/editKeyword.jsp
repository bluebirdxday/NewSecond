<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/notification/editKeyword-style.css">

</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>

    <section class="keywordedit--container">

        <div class="keywordedit--container__banner">
            <div>
                <div class="keywordedit--banner__title"><img src="/resources/src/img/loudSpeaker.png"> 등록한 키워드</div>
                <div class="keywordedit--banner__count"><span id="keywordCount">0</span> / 20</div>
            </div>
            <div class="keywordedit--banner__close">
                <img src="/resources/src/img/closeBtn.png"> <!-- 누르면 이전 페이지로 돌아가게 만들기 -->
            </div>
        </div>

        <div class="keywordedit--container__content">
            
            <div class="keywordedit--content__add">
            
                <form action="">

                    <div class="keywordedit--input">
                        <input type="text" placeholder="키워드를 입력해주세요" size="45" minlength="2" maxlength="20" autofocus>
                    </div>

                    <button type="button" id="addKeyword">추가</button> <!-- 누르면 DB에 키워드 추가 -->
                </form>
            </div>

            <!-- 그리드 -->
            <div class="keywordedit--content__list">

                <div class="keywordedit--item">
                    <div>아디다스 삼바</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>젤리키링</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>길다길다길다길다</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>에메모가든 백팩</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>자바의 정석</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>정보처리기사 필기</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

                <div class="keywordedit--item">
                    <div>수제비</div>
                    <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"></div> 
                    <!-- 누르면 DB에서 키워드 삭제 -->
                </div>

            </div>

        </div>

        <div></div>
    </section>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/editKeyword.js"></script>
</body>
</html>