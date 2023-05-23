<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>

    <link rel="stylesheet" href="/resources/css/notification/notification-style.css">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>

    <section class="notice--container">

        <div class="notice--container__activity">

            <div class="notice--tabs">
                <ul>
                    <li class="notice--tabs__active"><a href="javascript:void(0);" rel="tab1">활동 알림</a></li>
                    <li><a href="javascript:void(0);" rel="tab2">키워드 알림</a></li>
                </ul>
            </div>

            <!-- 활동 알림 탭 -->
            <div id="tab1" class="notice--tab__content notice--tabs__active">
                
                    <c:forEach items="${notificationList}" var="notification">
                        
                        <c:if test="${notification.readOrNot=='N'}" >
                            <a href="${notification.notificationURL}">
                                <div class="notice--tab1__item notice--new">  <%-- 아직 회원이 알림을 읽지 않은 상태라면 notice--new 클래스 추가  --%>
                        </c:if>

                        <c:if test="${notification.readOrNot=='Y'}" >
                            <a href="${notification.notificationURL}">
                                <div class="notice--tab1__item">
                        </c:if>

                                <div class="notice--tab1__item-first">
                                    <img src="${notification.shopProfile}" class="notice--tab1__img">
                                    <%-- <div>${notification.shopTitle}</div> --%>
                                </div>
                                <%-- 여기까진 어떤 알림이든 똑같은 형식 --%>

                                <%-- 여기서부터 알림 타입마다 양식이 다름 --%>
                                <div class="notice--tab1__item-second" style="font-size:18px;">
                                    <%-- <div>관심상품으로 등록한 게시물명</div>
                                    <div>의 가격을 <span>103,000</span>원에서 <span>93,000</span>원으로 내렸습니다.</div>
                                    <div><span>가격 하락</span> <span>10,000</span>원 <span id="upDownArrow">↓</span></div> --%>
                                    <strong>${notification.shopTitle}</strong>${notification.notificationMessage}
                                </div>

                                <div class="notice--tab1__item-third">${notification.sendDate}</div>

                                <script>
                                    (function() {

                                            var date = new Date(document.querySelector(".notice--tab1__item-third").innerText);

                                            // 초 (밀리초)
                                            const seconds = 1;
                                            // 분
                                            const minute = seconds * 60;
                                            // 시
                                            const hour = minute * 60;
                                            // 일
                                            const day = hour * 24;

                                            var today = new Date();
                                            var elapsedTime = Math.trunc((today.getTime() - date.getTime()) / 1000);

                                            var elapsedText = "";
                                            if (elapsedTime < seconds) {
                                                elapsedText = "방금 전";
                                            } else if (elapsedTime < minute) {
                                                elapsedText = elapsedTime + "초 전";
                                            } else if (elapsedTime < hour) {
                                                elapsedText = Math.trunc(elapsedTime / minute) + "분 전";
                                            } else if (elapsedTime < day) {
                                                elapsedText = Math.trunc(elapsedTime / hour) + "시간 전";
                                            } else if (elapsedTime < (day * 15)) {
                                                elapsedText = Math.trunc(elapsedTime / day) + "일 전";
                                            } else {
                                                elapsedText = SimpleDateTimeFormat(date, "yyyy.M.d");
                                            }

                                            document.querySelector(".notice--tab1__item-third").innerText = elapsedText;
                                    })();
                                </script>
                            </div>
                        </a>

                    </c:forEach>
                


                <%-- 아직 회원이 알림을 읽지 않은 상태라면 notice--new 클래스 추가  --%>
<%--                 <div class="notice--tab1__item notice--new"> 

                    <div class="notice--tab1__item-first">
                        <img src="/resources/src/img/cat2.jpg" class="notice--tab1__img">
                        <div>닉네임</div>
                    </div>

                    <div class="notice--tab1__item-second">
                        <div>관심상품으로 등록한 게시물명</div>
                        <div>의 가격을 <span>103,000</span>원에서 <span>93,000</span>원으로 내렸습니다.</div>
                        <div><span>가격 하락</span> <span>10,000</span>원 <span id="upDownArrow">↓</span></div>
                    </div>

                    <div class="notice--tab1__item-third">1시간 전</div>
                </div>
                
                
                <div class="notice--tab1__item">
                    
                    <div class="notice--tab1__item-first">
                        <img src="/resources/src/img/cat2.jpg" class="notice--tab1__img">
                        <div class="notice--tab1__username">닉네임</div>
                    </div>

                    <div class="notice--tab1__item-second">
                        <div>관심상품으로 등록한 게시물명</div>
                        <div>의 가격을 <span>103,000</span>원에서 <span>93,000</span>원으로 내렸습니다.</div>
                        <div><span>가격 하락</span> <span>10,000</span>원 <span id="upDownArrow">↓</span></div>
                    </div>

                    <div class="notice--tab1__item-third">1시간 전</div>
                </div> --%>

            </div>

            
                    <!-- 키워드 알림 탭 -->
                    <div id="tab2" class="notice--tab__content">
                        
                        <div class="notice--tab2__banner">
                            <div><img src="/resources/src/img/loudSpeaker.png"> &nbsp;알림 받고 있는 키워드 <span>${keywordCount}</span>개</div>
                            <a href="/notification/editKeyword">편집</a>
                        </div>

                        <div class="notice--tab2__item notice--new">
                            <div class="notice--tab2__item-first">
                                <img src="/resources/src/img/blackimg.jpg">
                            </div>
                            <div class="notice--tab2__item-second">
                                <div>아디다스 삼바</div>
                                <div>아디다스 삼바 250 새상품 판매합니다</div>
                            </div>
                            <div class="notice--tab2__item-third">1시간 전</div>
                        </div>

                        
                        <div class="notice--tab2__item">
                            <div class="notice--tab2__item-first">
                                <img src="/resources/src/img/blackimg.jpg">
                            </div>
                            <div class="notice--tab2__item-second">
                                <div>키워드명</div>
                                <div>게시글 제목</div>
                            </div>
                            <div class="notice--tab2__item-third">1시간 전</div>
                        </div>


                    </div>

        </div>

    </section>
    
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="/resources/js/notification.js"></script>
    
</body>
</html>