<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Second</title>
    <link rel="stylesheet" href="/resources/css/user/mypage/myPageCommon.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div style="margin-top:180px"><%-- spacing to header --%></div>

    <div class="myPage--wholeWrapper ">

        <%-- .myPage--side --%>
        <jsp:include page="/WEB-INF/views/user/mypage/sideMenu.jsp"/>
        
        <section class="myPage--main shadow p-3 mb-5 bg-body rounded ms-4">

            <div class="myPage--main__contents ps-5 pt-4">

                <h1 class="myPage-title">비밀번호 변경</h1>
                <div class="myPage-subject mb-5">현재 비밀번호가 일치하는 경우 새 비밀번호로 변경할 수 있습니다.</div>

                <form action="changePassword" class="myPage--main__form d-flex flex-column mt-5" method="POST" name="myPageFrm" id="changePwFrm">

                    <div class="input-group">
                        <input type="password" id="userPassword" name="userPassword" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>현재 비밀번호</label>
                    </div>

                    
                    <div class="input-group mt-5">
                        <input type="password" id="newUserPassword" name="newUserPassword" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>새 비밀번호</label>
                    </div>
                    
                    <div class="input-group mt-5 mb-5">
                        <input type="password" id="newUserPasswordConfirm" name="newUserPasswordConfirm" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>새 비밀번호 확인</label>
                    </div>

                    <button class="btn btn-primary w-50 m-auto mt-4">변경하기</button>

                </form>
            </div>
        </section>
    
    </div>  



    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        document.querySelectorAll(".list-group-item")[1].classList.add("active")
    </script>
    <script src="/resources/js/user/myPage.js"></script>
</body>
</html>