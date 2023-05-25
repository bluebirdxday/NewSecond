<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심상품페이지</title>
    
    <link rel="stylesheet" href="/resources/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/web/src/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/wish.css">

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="wish_bar">
        <div class="wish_bar--title">관심 상품</div>
    </div>

    <div class="wishPage--wholeContainer">

            <div class="wish_bar_container" >
                <div class="wish_sortContainer">
                    <div class="wish_ck_deleteWrap">
                        <%-- <span class="wish_ck_delete"> 
                            <label class="wish_ck_dtLabel" for="wish_ck_dtLabel">
                            <input type="checkbox" class="wish_checkboxOne" id="wish_ck_dtLabel" value='selectall'
                            onclick='wishSelectAll(this)'>
                            선택 <button class="wish_checkboxDelete">삭제</button> </label>
                        </span>   --%>
                    
                        <span class="wish_sorting lately">최근 조회순</span>
                        <span class="wish_sorting hprice">높은 가격순</span>
                        <span class="wish_sorting lprice">낮은 가격순</span>
                    </div>
                </div>
            </div>


            <div style="text-align:center">
                <div class="wish_imgContatiner">

                <c:forEach items="${wishList}" var="wishlist">
                    <div class="wish_imgDiv">
                        <label class="wish_ck_label">
                            <a href="/goods/${wishlist.goodsNo}">
                        <img class="wish_img" src="${wishlist.thumbnail}" 
                        onerror="this.src='/resources/src/img/no_image.jpeg'">
                            <input type="checkbox" class="wish_checkbox"> </a>
                        </label>
                    
                        <div class="wish_info">${wishlist.goodsTitle}</div>
                    </div>
                </c:forEach>
                
                </div>
            </div>

        </div>

    </div>
    <script src="/resources/js/wish.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>