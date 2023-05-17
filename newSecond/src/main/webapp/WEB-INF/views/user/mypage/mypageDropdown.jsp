<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/user/mypage/mypageDropdown.css">

<div class="dropdown">

    <button class="mypage--dropdown__intro" type="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="-100,0">
        <span><img src=""></span>${loginUser.userNickname}
    </button>

    <ul class="dropdown-menu dropdown--menu__custom">

        <li><a class="dropdown-item" href="#">마이 페이지</a></li>

        <li><a class="dropdown-item" href="#">관심상품</a></li>

        <c:if test="${loginUser.userRole == 2}">
            <li><a class="dropdown-item" href="/admin/admin_notice">관리자 페이지</a></li>
        </c:if>

</div>
