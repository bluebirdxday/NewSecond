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

                <h1 class="myPage-title">회원 탈퇴</h1>
                <div class="myPage-subject">현재 비밀번호가 일치하는 경우 탈퇴할 수 있습니다.</div>

                <form action="secession" class="myPage--main__form d-flex flex-column" method="POST" name="myPageFrm" id="secessionFrm">

                    <div class="input-group">
                        <input type="password" id="userPassword" name="userPassword" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>비밀번호</label>
                    </div>

                    
                    <div class="fs-5 mt-3">
                        <label>회원 탈퇴 약관</label>
                    </div>

                    <pre class="secession-terms mt-1">
제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4
                    </pre>

                    <div class="form-check mt-1">
                        <input class="form-check-input" type="checkbox" id="agree">
                        <label class="form-check-label" for="agree">
                            위 약관에 동의합니다
                        </label>
                    </div>

                    <button class="btn btn-danger w-50 m-auto mt-2">탈퇴</button>

                </form>
            </div>
        </section>
    
    </div>  


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        document.querySelectorAll(".list-group-item")[2].classList.add("active")
    </script>
    <script src="/resources/js/user/myPage.js"></script>
</body>
</html>