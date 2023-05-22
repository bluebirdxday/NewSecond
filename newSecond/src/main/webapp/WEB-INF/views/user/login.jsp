<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="/resources/css/user/login.css">

    <div class="dropdown">

        <button type="button" class="dropdown-text" id="login" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="false" data-bs-offset="-100,10" >
            로그인
        </button>

        <form class="dropdown-menu p-4 speech-bubble loginPage--WrapForm" action="/user/login" method="post">
                
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn-close" aria-label="Close" id="loginClose"></button>
                </div>

                <div class="mb-2">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="email@example.com" required autofocus autocomplete="off" value="${cookie.saveId.value}"  />
                </div>

                <div class="mb-2">
                    <label for="userPassword" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="Password" required>
                </div>

                <div class="mb-2">
                    <div class="form-check">
                        <input type="checkbox" name="saveId" class="form-check-input" id="saveId" 
                        <c:if test="${not empty cookie.saveId.value}"> checked   </c:if>
                        >
                        
                        <label class="form-check-label" for="saveId">                        
                        아이디 기억하기
                        </label>
                    </div>
                </div>
            
            <div class="login--submit d-flex justify-content-center">
                <button type="submit" class="btn btn-primary ">로그인</button>
            </div>

        </form>

    </div>


<script>
    document.getElementById('loginClose').addEventListener('click', e => {
        document.getElementById('login').click();
    });
</script>