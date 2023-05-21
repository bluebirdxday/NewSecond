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

                <h1 class="myPage-title">내 정보</h1>
                <div class="myPage-subject">원하는 회원 정보를 수정할 수 있습니다.</div>

                <form action="secession" class="myPage--main__form d-flex flex-column" method="POST" name="myPageFrm" id="secessionFrm">

                    <div class="input-group">
                        <input type="text" id="userNickname" name="userNickname" autocomplete="off" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>닉네임</label>
                    </div>

                    
                    <div class="input-group mt-5">
                        <input type="password" id="userTel" name="userTel" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>전화번호</label>
                    </div>
                    
                    <div class="input-group mt-5">
                        <input class="w-25" type="text" name="userAddress" id="userAddress_postcode" placeholder="우편번호"  readonly onfocus="this.blur();">
                        <button class="w-25 btn btn-secondary ms-3 rounded-5" type="button" id="addressSearch">검색</button>
                        <button type="button" class="d-none" id="valueRecognizer"></button>
                    </div>
                    
                    <div class="input-group mt-5">
                        <input type="text" name="userAddress" placeholder="도로명/지번 주소" id="userAddress_address" readonly onfocus="this.blur();">
                    </div>
                    
                    <div class="input-group mt-5">
                        <input type="text" id="userAddress_detailAddress" name="userAddress" autocomplete="off" required>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>상세 주소</label>
                    </div>

                    <button class="btn btn-primary w-50 m-auto mt-4">수정하기</button>

                </form>
            </div>
        </section>
    
    </div>  

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        document.querySelectorAll(".list-group-item")[0].classList.add("active")
    </script>
    <script src="/resources/js/user/myPage.js"></script>
</body>
</html>