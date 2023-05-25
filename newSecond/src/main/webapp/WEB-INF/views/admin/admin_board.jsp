<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="pagination" value="${boardMap.pagination}"/>

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
             <img class="homeLogo" src="/resources/src/img/LOGO.png">
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
                <c:when test="${empty boardMap.boardList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${boardMap.boardList}" var="goodsBoard">
                        <tr>
                            <td><input type="checkbox" class="admin_board_checkbox" name="" id=""></td>
                            <td class="admin_board_checkbox_no">${goodsBoard["GOODS_NO"]}</td>
                            <td>${goodsBoard["USER_NO"]}</td>
                            <td><a href="/goods/${goodsBoard['GOODS_NO']}">${goodsBoard["GOODS_TITLE"]}</a></td>
                            <td>${goodsBoard["SELL_ENROLL_DT"]}</td>
                            <td>${goodsBoard["VIEW_COUNT"]}</td>
                            <td><button class="admin_board_tableBtn">${goodsBoard["GOODS_STATUS"]}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
        </table>
    </div>

    </div>

    <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <%-- <li><a href="${boardCode}?cp=1">&lt;&lt;</a></li> --%>
                    <li><a href="/admin/admin_board?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/admin/admin_board?cp=${pagination.prevPage}${sp}">&lt;</a></li>

               
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}"
                            end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>

                            </c:when>
                        
                            <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/admin/admin_board?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>


                    
                   <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/admin/admin_board?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/admin/admin_board?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                  
            </div>



<script src="\resources\js\admin\admin_board.js"></script>
</body>
</html>