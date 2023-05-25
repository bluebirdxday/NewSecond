<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="notice" value="${noticeList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice</title>
    <link rel="stylesheet" href="\resources\css\notice\notice.css">


     
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <main>
        <div class="notice_wrap">
            <span class="notice_bar">공지사항</span>
        <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
            <hr>

            <!-- ----테이블------ -->
            <div class="notice_tableWrap">
            <table class="notice_table" style="border-collapse: collapse;">
                <thead>
                <tr>
                

                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </thead>
                </tr>
                <tbody>
                <c:choose>
                    <c:when test="${empty noticeList}">
                    <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                    <tr>
                        <th colspan="6">목록이 존재하지 않습니다.</th>
                    </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach items="${noticeList}" var="notice">
                            <tr>
                            
                            
                                <td><a href='/notice/notice_read/${notice.noticeNo}'>${notice.noticeTitle}</a></td>
                                <td>${notice.noticeEnrollDate}</td>
                                <td>${notice.noticeViewCount}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
            </table>
        </div>

        </div>
    
    </main>

      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>