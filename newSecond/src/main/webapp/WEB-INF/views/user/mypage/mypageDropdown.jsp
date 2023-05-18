<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/user/mypage/mypageDropdown.css">

<div class="dropdown">

    <button class="mypage--dropdown__intro d-flex justify-content-center align-items-center" type="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="-90,0">
        <span class="me-1">

        <c:if test="${empty loginUser.userImage}">
                <img class="mypageDrop--userImage__image" src="/resources/src/img/basic_profile.png">
        </c:if>

        <c:if test="${not empty loginUser.userImage}" > 
                <%-- 추가 예정 --%>
        </c:if>

        </span>
        
        <span class="m-0">
            ${loginUser.userNickname}
        </span>
    </button>

    <ul class="dropdown-menu dropdown--menu__custom">

        <li><a class="dropdown-item" href="/">마이 페이지</a></li>

        <li><a class="dropdown-item" href="/shop/${loginUser.userNo}">내 상점</a></li>

        <li><a class="dropdown-item" href="#">관심상품</a></li>

        <c:if test="${loginUser.userRole == 2}">
            <li><a class="dropdown-item" href="/admin/admin_notice">관리자 페이지</a></li>
        </c:if>

</div>
