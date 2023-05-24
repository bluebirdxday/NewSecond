<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="btn-group rounded-0">
    <button type="button" class="" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>

    <ul class="dropdown-menu mainpage--category__menu">

        <c:forEach items="${categoryList}" var="category">
            <li><a class="dropdown-item" href="/goods/category/${category.categoryNo}">${category.categoryName}</a></li>
        </c:forEach>
    
    </ul>
    
</div>