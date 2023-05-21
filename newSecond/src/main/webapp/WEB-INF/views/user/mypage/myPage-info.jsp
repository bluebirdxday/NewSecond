<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

                <form action="secession" class="myPage--main__form d-flex flex-column" method="POST" name="myPageFrm" id="updateInfo">

                    
                    <div class="input-group ">
                        <div class="input-title">닉네임</div>
                        </button>
                        <input type="text" id="userNickname" name="userNickname" value="${loginUser.userNickname}" autocomplete="off" required
                        data-bs-toggle="tooltip" data-bs-placement="top"
                                data-bs-custom-class="custom-tooltip"
                                data-bs-html="true"
                                data-bs-title="한글,영어,숫자로만 2~10글자
                                <div>야호<div>
                                "
                                >
                        <span class="highlight"></span>
                        <span class="bar"></span>
                    </div>

                    
                    <div class="input-group mt-5">
                        <div class="input-title">전화번호</div>
                        <input type="text" id="userTel" name="userTel" value="${loginUser.userTel}" maxlength="11" required
                        data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-custom-class="custom-tooltip"
                        data-bs-html="true"
                        data-bs-title="전화번호(- 제외)
                        "
                        >
                        <span class="highlight"></span>
                        <span class="bar"></span>
                    </div>
                    


                    <div class="input-title mt-5">주소</div>

                    <c:set var="addr" value="${fn:split(loginUser.userAddress,'^^^')}"/>



                    <div class="input-group mt-2">
                        <input class="w-25" type="text" name="userAddress" id="userAddress_postcode" placeholder="우편번호" value="${addr[0]}"  onfocus="this.blur();">
                        <button class="w-25 btn btn-secondary ms-3 rounded-5" type="button" id="addressSearch">검색</button>
                        <button type="button" class="d-none" id="valueRecognizer"></button>
                    </div>
                    
                    <div class="input-group mt-3">
                        <input type="text" name="userAddress" placeholder="도로명/지번 주소" id="userAddress_address" value="${addr[1]}"  onfocus="this.blur();">
                    </div>
                    
                    <div class="input-group mt-4">
                        <input type="text" id="userAddress_detailAddress" placeholder="상세주소" name="userAddress" autocomplete="off" value="${addr[2]}" required >
                        <span class="highlight"></span>
                        <span class="bar"></span>
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