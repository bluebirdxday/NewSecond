<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_notice</title>
   <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_notice.css">
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
    <span class="amdmin_notice_logout">로그아웃</span>

    <div class="admin_notice_wrap">
        <span class="admin_notice_bar">공지사항 관리</span>
     <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
        <hr>

        <!-- 선택 숨김,삭제 버튼 -->
        
        <div class="admin_notice_Btn">
        
            <button class="admin_notice_write"><a href="\admin\admin_notice_write">글쓰기</a></button>
            <button class="admin_notice_HiddenBtn">선택 숨김</button>
            <button class="admin_notice_DelBtn" id="deleteBtn">선택 삭제</button>
        </div>


        
        <!-- ----테이블------ -->
     <form action="/admin/admin_notice_write/update" method="POST" 
        class="notice-update" id="noticeUpdateFrm" >

        <div class="admin_notice_tableWrap">
        <table class="admin_notice_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" class="admin_notice_checkbox_all" value='selectall
                'onclick='boardSelectAll(this)'></th>
                <th >번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th colspan="2">수정</th>
            </thead>
            </tr>
            <c:choose>
                <c:when test="${empty map.noticeList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${map.noticeList}" var="notice">
                        <tr>
                            <td><input type="checkbox" class="admin_notice_checkbox" value="${notice.noticeNo}"></td>
                            <td class="admin_notice_checkbox_no">${notice.noticeNo}</td>
                            <td><a href='/admin/admin_notice_read/${notice.noticeNo}'>${notice.noticeTitle}</a></td>
                            <td>${notice.noticeEnrollDate}</td>
                            <td>${notice.noticeViewCount}</td>
                            <td>
                            <button type="submit" class="admin_notice_tableBtn" id="updateBtn">내용 수정</button>
                            </td>
                            <td>
                            <button type="button" class="admin_notice_tableBtn">필독 등록</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            </form>
            
        </tbody>
        </table>
    </div>

    </div>


      <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <%-- <li><a href="${boardCode}?cp=1">&lt;&lt;</a></li> --%>
                    <li><a href="/admin_notice/${noticeNo}?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/admin_notice/${noticeNo}?cp=${pagination.prevPage}${sp}">&lt;</a></li>

               
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
                                <li><a href="/admin_notice/${noticeNo}?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>


                    
                    <%-- <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li> --%>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/admin_notice/${noticeNo}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/admin_notice/${noticeNo}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                </ul>
            </div>


<script src="\resources\js\admin\admin_notice.js"></script>
</body>
</html>