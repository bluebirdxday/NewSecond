<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <div class="keywordedit--banner__count"><span>${fn:length(keywordList)}</span> / 20</div>
            </div>
            <div class="keywordedit--banner__close">
                <a href="/notification/notification"><img src="/resources/src/img/closeBtn.png"></a>
            </div>
        </div>


        <div class="keywordedit--container__content">
            
            <div class="keywordedit--content__add">
            
                <form action="/notification/editKeyword/insert" method="post" id="insertKeywordFrm">
                <%-- <form action="#"> --%>
                    <div class="keywordedit--input">
                            <input type="text" placeholder="키워드를 입력해주세요" value=""  name="keyword" size="45" autofocus autocomplete="off">
                    </div>
                    
                        <c:if test="${fn:length(keywordList) == 20}">
                            <button type="button" id="maxKeyword">추가</button> <!-- 누르면 DB에 키워드 추가 -->
                        </c:if>
                        <c:if test="${fn:length(keywordList) < 20}">
                            <button type="submit" id="addKeyword">추가</button> <!-- 누르면 DB에 키워드 추가 -->
                        </c:if>
                </form>
            </div>

            <!-- 그리드 -->
            <div class="keywordedit--content__list">

            <c:if test="${not empty keywordList}" >
                <c:forEach items="${keywordList}" var="keyword">
                    <div class="keywordedit--item">
                        <div>${keyword.keywordTitle}</div>
                        <div><img src="/resources/src/img/minus-button.png" class="keyword--btn__delete"
                                        onclick="deleteKeyword(${keyword.keywordNo})"></div> 
                        <!-- 누르면 DB에서 키워드 삭제 -->
                    </div>
                </c:forEach>
            </c:if>

            </div>

        </div>

        <div></div>
    </section>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        const userNo = ${loginUser.userNo};
    </script>   
    <script src="/resources/js/editKeyword.js"></script>
</body>
</html>