<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="btn-group rounded-0">
    <button type="button" class="" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>

    <%-- https://getbootstrap.kr/docs/5.2/components/dropdowns/#content --%>

    <ul class="dropdown-menu mainpage--category__menu">

        <%-- 카테고리 테이블에서 가져온 정보를 드롭다운메뉴로 나열시킴 --%>
        <c:forEach items="${categoryList}" var="category">
            <li><a class="dropdown-item" href="/goods/category/${category.categoryNo}">${category.categoryName}</a></li>
        </c:forEach>
    
    </ul>
    
</div>