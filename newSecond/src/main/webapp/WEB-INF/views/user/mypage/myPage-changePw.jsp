<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>
    <link rel="stylesheet" href="/resources/css/user/myPage/myPageCommon.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div style="margin-top:180px"><%-- spacing to header --%></div>

    <div class="myPage--wholeWrapper">

        <%-- .myPage--side --%>
        <jsp:include page="/WEB-INF/views/user/myPage/sideMenu.jsp"/>

        <section class="myPage--main">

            <article >
            
            </article>

        </section>
    
    </div>





    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        document.querySelectorAll(".list-group-item")[2].classList.add("active")
    </script>
</body>
</html>