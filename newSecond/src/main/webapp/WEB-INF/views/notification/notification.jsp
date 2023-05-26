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
                
                <c:if test="${not empty notificationList}" >
                    <c:forEach items="${notificationList}" var="notification">

                    <c:if test="${notification.notificationType!='K'}" >
                    
                        <a href="${notification.notificationURL}">
                            <c:if test="${notification.readOrNot=='N'}" >
                                <div class="notice--tab1__item notice--new">  <%-- 아직 회원이 알림을 읽지 않은 상태라면 notice--new 클래스 추가  --%>
                            </c:if>

                            <c:if test="${notification.readOrNot=='Y'}" >
                                    <div class="notice--tab1__item">
                            </c:if>

                                    <div class="notice--tab1__item-first">
                                        <img src="${notification.shopProfile}" class="notice--tab1__img">
                                    </div>

                                    <div class="notice--tab1__item-second" style="font-size:18px;">
                                        <%-- 팔로우/관심상품 등록 알림 --%>
                                        <c:if test="${notification.notificationType!='N' && notification.notificationType!='P' }">
                                                <strong>${notification.shopTitle}</strong>${notification.notificationMessage}
                                        </c:if>

                                        <%-- 팔로우한 상점 새글 알림 --%>
                                        <c:if test="${notification.notificationType=='N'}">

                                            <c:set var="keywordArr" value="${fn:split(notification.notificationMessage, '^^')}"/>
                                                [ ${keywordArr[0]} ]<br><br>
                                                <strong>${notification.shopTitle}</strong>${keywordArr[1]}
                                        </c:if>


                                        <%-- 후기 작성 알림 --%>
                                        <c:if test="${notification.notificationType=='P'}">
                                            <c:set var="keywordArr2" value="${fn:split(notification.notificationMessage, '^^')}"/>
                                                <strong>[ ${keywordArr2[0]} ]</strong><br>
                                                ${keywordArr2[1]}
                                        </c:if>
                                    </div>

                                    <div class="notice--tab1__item-third">${notification.sendDate}</div>
                                </div>
                        </a>
                    
                    </c:if>
                            

                    </c:forEach>

                    <input type="hidden" id="notiUserNo"  value="${notification.userNo}">
                </c:if>
                
                <c:if test="${empty notificationList}" >
                    <div class="emptyNotification">현재 활동 알림이 없습니다</div>
                </c:if>


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

                        <c:if test="${not empty notificationList}" >
                            <c:forEach items="${notificationList}" var="notification">

                                    <c:if test="${notification.notificationType=='K'}" >
                                        <a href="${notification.notificationURL}">

                                                <c:if test="${notification.readOrNot=='N'}" >
                                                    <div class="notice--tab2__item notice--new"> 
                                                </c:if>

                                                <c:if test="${notification.readOrNot=='Y'}" >
                                                    <div class="notice--tab2__item">
                                                </c:if>

                                                    <div class="notice--tab2__item-first">
                                                        <img src="${notification.thumbnail}">
                                                    </div>
                                                    <div class="notice--tab2__item-second">
                                                        <c:set var="keywordArr" value="${fn:split(notification.notificationMessage, '^^')}"/>
                                                        <div>${keywordArr[0]}</div>
                                                        <div>${keywordArr[1]}</div>
                                                    </div>
                                                    <div class="notice--tab2__item-third">${notification.sendDate}</div>
                                                </div>
                                            </a>
                                    </c:if>

                            </c:forEach>
                        </c:if>

                        <c:if test="${empty notificationList}" >
                            <div class="emptyNotification">현재 키워드 알림이 없습니다</div>
                        </c:if>
                        
                        <%-- <div class="notice--tab2__item">
                            <div class="notice--tab2__item-first">
                                <img src="/resources/src/img/blackimg.jpg">
                            </div>
                            <div class="notice--tab2__item-second">
                                <div>키워드명</div>
                                <div>게시글 제목</div>
                            </div>
                            <div class="notice--tab2__item-third">1시간 전</div>
                        </div> --%>


                                            <%-- <c:if test="${notification.notificationType=='K'}" >
                                                    <div>${notification.shopTitle}</div>
                                                </div>
                                                <div class="notice--tab1__item-second" style="font-size:18px;">
                                                    <c:set var="keywordArr" value="${fn:split(notification.notificationMessage, '^^')}"/>
                                                    <div>${keywordArr[0]} &nbsp; &nbsp; &nbsp; <span style="font-weight:400"> ${keywordArr[1]}</span></div>
                                                </div>
                                            </c:if>
                                                <div class="notice--tab1__item-third">${notification.sendDate}</div> --%>

                    </div>

        </div>

    </section>
    
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="/resources/js/notification.js"></script>
    
</body>
</html>