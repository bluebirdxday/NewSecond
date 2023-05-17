<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/user/mypage/mypageDropdown.css">
<div class="dropdown">

    <button class="mypage--dropdown__intro" type="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="-90,0">
        마이 페이지
    </button>

    <ul class="dropdown-menu dropdown--menu__custom">
        <li><a class="dropdown-item" href="#">Another action</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <c:if test="${loginUser.userRole == 2}">
            <li><a class="dropdown-item" href="/admin/admin_notice">관리자 페이지</a></li>
        </c:if>
</div>