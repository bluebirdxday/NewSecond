<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${userMap.pagination}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_user</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_user.css">

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

    <!-- -------------------- -->
  

    <div class="admin_user_wrap">
        <div class="admin_user_bar">회원관리</div>
        <hr>
        <div >
            <span>
            <form action="/admin_user/search" method="get">
                <input class="admin_user_search" type="text" name="search" id="" >
            </span>
            <span>
                <button  class="admin_user_searchBtn">회원 정보 조회</button>
            </span>
           
        </div>

        <div class="admin_user_raidos">
            <span>
            <label ><input type="radio" name="admin_user_raidos" id="all">전체</label>
            <label ><input type="radio" name="admin_user_raidos" id="normal">정상</label>
            <label ><input type="radio" name="admin_user_raidos" id="block">블락</label>
            <label ><input type="radio" name="admin_user_raidos" id="signOut">탈퇴</label>
         
        </span>
        </div>
        <form action="/admin_user/signOut" method="POST"></form>
    <div class="admin_user_result">
        <span >검색결과 : </span> 
            <span id="checkboxCount">0</span>
            <span>/ 총</span>
            <span class="admin_user_countAll">3</span>
            <span>명</span>
        </div>
        
        <div class="admin_user_tableWrap">
        <table class="admin_user_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" class="admin_user_checkboxAll" name="" id="" value='selectall'
                    onclick='userSelectAll(this)'></th>
                <th >번호</th>
                <th>아이디</th>
                <th>상태</th>
                <th>가입일</th>
                <th colspan="2">관리</th>
            </thead>
            </tr>
            <tbody>
            <c:choose>
                <c:when test="${empty userMap.userList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>

           
                </c:when>
                <c:otherwise>
                    <c:forEach items="${userMap.userList}" var="user">
                        <tr>
                        <td><input type="checkbox" class="admin_user_checkbox" name="" id=""></td>
                            <td class="admin_user_checkbox_no">${user["USER_NO"]}</td>
                            <td>${user["USER_EMAIL"]}</td>
                            <td class="admin_user_states">${user["USER_STATUS"]}</td>
                            <td>${user["ENROLL_DT"]}</td>
                          <td>

                   
                          <input type="hidden" value="${user['USER_NO']}" class="signOutUserNo">
                            <button class="admin_user_tableBtn forcedsignOut show" id="forcedsignOut">강제탈퇴</button>
                            <button class="admin_user_tableBtn signOutH" id="signOutH">탈퇴해제</button>
                            </td>
                            <td>
                           
                   
                           
                            <button class="admin_user_tableBtn block show" id="block">회원블락</button>
                            <button class="admin_user_tableBtn blockH" id="blockH">블락해제</button>
               
                          
                            </td>
                            </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            
        </tbody>
        </table>
    </div>

    </div>
 </form>

 <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <%-- <li><a href="${boardCode}?cp=1">&lt;&lt;</a></li> --%>
                    <li><a href="/admin/admin_user?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/admin/admin_user?cp=${pagination.prevPage}${sp}">&lt;</a></li>

               
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
                                <li><a href="/admin/admin_user?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

             
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/admin/admin_user/?cp=${i}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/admin/admin_user?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                </ul>
            </div>
             <%-- <input type="text" name="cp" value="${param.cp}"> --%>
       </c:forEach>


<script src="\resources\js\admin\admin_user.js"></script>

</body>
</html>