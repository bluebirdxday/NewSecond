<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="GoodsBoardList" value="${GoodsBoardList}"/>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_board</title>
   <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_board.css">
</head>
<body>

    <ul class="admin_ul">
        <a href="/">
            <img src="../src/img/LOGO.png" alt="로고" id="homeLogo">
        </a>
    
        <li class="admin_list"><a class="admid_notice" href="\admin\admin_notice">공지사항 관리</a></li>
        <li class="admin_list"><a class="admid_user" href="\admin\admin_user">회원 관리</a></li>
        <li class="admin_list"><a class="admid_board" href="\admin\admin_board">게시글 관리</a></li>
         <li class="admin_list"><a class="admid_qna" href="\admin\admin_qna">문의 관리</a></li>
    </ul>

    <!-- ----------상단 제목---------- -->
    <span class="amdmin_board_logout">로그아웃</span>

    <div class="admin_board_wrap">
        <span class="admin_board_bar">게시글 관리</span>
     <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
        <hr>

        <!-- 선택 숨김,삭제 버튼 -->
        
        <div class="admin_board_Btn">
            <button class="admin_board_HiddenBtn" id="hiddenBtn">블라인드</button>
            <button class="admin_board_DelBtn" id="delBtn">선택 삭제</button>
        </div>


        
        <!-- ----테이블------ -->
        <div class="admin_board_tableWrap">
        <table class="admin_board_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" class="admin_board_checkboxAll" name="" id="" value='selectall'
                    onclick='boardSelectAll(this)'></th>
                <th>번호</th>
                <th>회원번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>관리</th>
            </thead>
            </tr>
            <tbody>

             <c:choose>
                <c:when test="${empty GoodsBoardList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${GoodsBoardList}" var="GoodsBoard">
                        <tr>
                            <td><input type="checkbox" class="admin_board_checkbox" name="" id=""></td>
                            <td class="admin_board_checkbox_no">${GoodsBoard["GOODS_NO"]}</td>
                            <td>${GoodsBoard["USER_NO"]}</td>
                            <td><a href="/goods/${GoodsBoard['GOODS_NO']}">${GoodsBoard["GOODS_TITLE"]}</a></td>
                            <td>${GoodsBoard["SELL_ENROLL_DT"]}</td>
                            <td>${GoodsBoard["VIEW_COUNT"]}</td>
                            <td><button class="admin_board_tableBtn">${GoodsBoard["GOODS_STATUS"]}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
        </table>
    </div>

    </div>

<script src="\resources\js\admin\admin_board.js"></script>
</body>
</html>