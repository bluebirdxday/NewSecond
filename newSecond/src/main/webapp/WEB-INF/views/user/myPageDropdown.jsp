<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/user/mypage/mypageDropdown.css">

<div class="dropdown">

    <button class="mypage--dropdown__intro d-flex justify-content-center align-items-center" type="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="-90,0">

        <span class="m-0">
            ${loginUser.userNickname} 님
        </span>

        <div class="downarror"><%-- 아래 삼각형 --%></div>
    </button>

    <ul class="dropdown-menu dropdown--menu__custom text-center">

        <li><a class="dropdown-item" href="/myPage/info">마이 페이지</a></li>

        <li><a class="dropdown-item" href="/shop/${loginUser.userNo}">내 상점</a></li>

        <li><a class="dropdown-item" href="/wish/wish">관심상품</a></li>

        <li><a class="dropdown-item" href="/review/reviewList">후기 작성 내역</a></li>

        <c:if test="${loginUser.userRole == 2}">
            <li><a class="dropdown-item" href="/admin/admin_notice">관리자 페이지</a></li>
        </c:if>

</div>
