<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/fontawesome/css/all.min.css">

<aside class="myPage--side shadow p-3 mb-5 bg-body rounded" >

    <div class="menu--userInfo mt-5 d-flex flex-column justify-content-center align-items-center">
        <a class="position-relative" href="/myPage/info/img-edit?edit='y'">
            <img src="/resources/src/img/basic_profile.png">
            <div class="menu--userInfo__editIconWrap">
                <i class="fa-solid fa-pen fa-1.5x menu--userInfo__editIcon"></i>
            </div>
        </a>
        <h2 class="mt-2">${loginUser.userNickname}</h2>
        <h3 class="mt-2">${loginUser.userEmail}</h3>
    </div>


    <ul class="list-group list-group-flush mt-5">
        <a href="/myPage/info" class="list-group-item list-group-item-action text-center p-2">내 정보</a>
        <a href="/myPage/changePw" class="list-group-item list-group-item-action text-center p-2">비밀번호 변경</a>
        <a href="/myPage/secession" class="list-group-item list-group-item-action text-center p-2">회원 탈퇴</a>
    </ul>
    
    
</aside>

