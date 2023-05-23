<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>회원가입 페이지</title>

    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="/resources/css/user/signUp.css">
</head>
<body>
    <div class="signUp-container">
        
        <div class="d-flex justify-content-end mb-3">
            <a href="/">
                <button type="button" class="btn-close" aria-label="Close"></button>
            </a>
        </div>

        <div class="mb-3">
            <h2>회원 정보를 입력해주세요</h2>
        </div>

        <form action="/user/signUp" method="post" id="signUpFrm">
            

            <%-- 이메일 --%>
            <div class="input-container mb-5">

                <label for="userEmail">아이디(이메일)</label>
                
                <input type="text" id="userEmail" name="userEmail" placeholder="email@example.com" maxlength="30" autocomplete="off"
                <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                data-bs-html="true"
                data-bs-title="로그인 및 메일 수신에 사용될 이메일을 입력해주세요"
                data-bs-animation="false" --%>
                >
                

                <span class="signUp-message" id="emailMessage">로그인 및 메일 수신에 사용될 이메일을 입력해주세요</span>

            </div>

            <%-- 패스워드 --%>
            <div class="input--password__container mb-5">

                <label for="userPassword">비밀번호</label>

                <div class="input-container mb-4">
                    
                    <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20"
                    <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-html="true"
                    data-bs-title="영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요."
                    data-bs-animation="false" --%>
                    >
                    
                </div>

                <div class="input-container">
                    
                    <input type="password" id="userPasswordConfirm" name="userPasswordConfirm" placeholder="비밀번호 확인" maxlength="20"
                    <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-html="true"
                    data-bs-title="비밀번호를 다시 입력해주세요"
                    data-bs-animation="false" --%>
                    >

                </div>

                <span class="signUp-message mb-5" id="passwordMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>

            </div>


            <%-- 닉네임 --%>
            <div class="input-container mb-5">

                <label for="userNickname">닉네임</label>

                <input type="text" id="userNickname" name="userNickname" placeholder="닉네임" maxlength="10" autocomplete="off"
                <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                data-bs-html="true"
                data-bs-title="한글,영어,숫자로만 2~10글자"
                data-bs-animation="false" --%>
                >

                <span class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자</span>

            </div>


            <%-- 전화번호 --%>
            <div class="input-container mb-5">

                <label for="userTel">전화번호</label>
                
                <input type="text" id="userTel" name="userTel" placeholder="(- 없이 숫자만 입력)" maxlength="11" autocomplete="off"
                <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                data-bs-html="true"
                data-bs-title="전화번호를 입력해주세요.(- 제외)"
                data-bs-animation="false" --%>
                >
                
                <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>

            </div>



            <%-- 주소 --%>
            <div class="input-container mb-5">

                <label for="userAddress">주소</label> 

                <span class="fst-italic" style="font-size: 0.7rem;"> * 검색을 통해 주소를 입력해주세요</span>

                <div class="input-container mb-4 w-75">
                    <input class="w-50" type="text" name="userAddress" id="userAddress_postcode" placeholder="우편번호"  readonly onfocus="this.blur();""
                    <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-title="검색버튼을 통해 주소를 입력해주세요"
                    data-bs-animation="false" --%>
                    >
                    
                    <button class="w-25 btn btn-primary" type="button" id="addressSearch"readonly >검색</button>

                    <button type="button" class="d-none" id="valueRecognizer"></button>

                </div>

                <div class="input-container mb-4">
                    <input type="text" name="userAddress" placeholder="도로명/지번 주소" id="userAddress_address" readonly onfocus="this.blur();"
                    <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-title="검색버튼을 통해 주소를 입력해주세요"
                    data-bs-animation="false" --%>
                    >
                </div>

                <div class="input-container">
                    <input type="text" name="userAddress" placeholder="상세 주소" id="userAddress_detailAddress" autocomplete="off"
                    <%-- data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-title="상세주소를 입력해주세요."
                    data-bs-animation="false" --%>
                    >
                </div>

                <span class="signUp-message" id="addressMessasge">주소를 입력해주세요</span>

            </div>
            


            <div class="d-flex justify-content-center">

                <button type="submit" class="submit-button">가입하기</button>

            </div>

        </form>





    <jsp:include page="/WEB-INF/views/util/toastMessage.jsp"/>

    </div>
    <script src="/resources/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/user/signUp.js"></script>

    <c:if test="${not empty message}" >
        <script>
            toastTrigger.click();
        </script>
    </c:if>

    <script>
        
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    </script>

</body>
</html>

