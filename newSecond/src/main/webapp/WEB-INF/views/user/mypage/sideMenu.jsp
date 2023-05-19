<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<aside class="myPage--side">

    <div class="menu--userInfo mt-5 d-flex flex-column justify-content-center align-items-center">
        <a href="/myPage/profile"><img src="/resources/src/img/basic_profile.png"></a>
        <h2 class="mt-2">${loginUser.userNickname}</h2>
        <h3 class="mt-2">${loginUser.userEmail}</h3>
    </div>


    <ul class="list-group list-group-flush mt-5">
        <a href="/myPage/profile" class="list-group-item list-group-item-action text-center p-2">프로필</a>
        <a href="/myPage/info" class="list-group-item list-group-item-action text-center p-2">내 정보</a>
        <a href="/myPage/changePw" class="list-group-item list-group-item-action text-center p-2">비밀번호 변경</a>
        <a href="/myPage/secession" class="list-group-item list-group-item-action text-center p-2">회원 탈퇴</a>
    </ul>
    
    
</aside>