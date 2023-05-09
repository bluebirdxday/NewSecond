<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>NewSecond</title>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main data-include="/web/include/content.html" style="margin-top: 160px;"></main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="resources\bootstrap\js\bootstrap.bundle.min.js"></script>
</body>
</html>