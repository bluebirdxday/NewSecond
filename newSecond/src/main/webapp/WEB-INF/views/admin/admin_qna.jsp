            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="QnaList" value="${QnaList}"/>




<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_user</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_qna.css">
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

    <!-- -------------------- -->

    <span class="amdmin_qna_logout">로그아웃</span>

    <div class="admin_qna_wrap">
        <div class="admin_qna_bar">문의관리</div>
        <hr>
        <div >
            <span>
                <input class="admin_qna_search" type="text" name="" id="" placeholder="문의 제목 / 회원번호를 입력해주세요.">
            </span>
            <span>
                <button  class="admin_qna_searchBtn">문의조회</button>
            </span>
        </div>
        <div class="admin_qna_raidos">
            <span>
            <label ><input type="radio" name="admin_qna_raidos" id="">전체</label>
            <label ><input type="radio" name="admin_qna_raidos" id="">거래신고</label>
            <label ><input type="radio" name="admin_qna_raidos" id="">회원/계정</label>
            <label ><input type="radio" name="admin_qna_raidos" id="">오류/제안</label>
            <label ><input type="radio" name="admin_qna_raidos" id="">채팅/알람</label>
            <label ><input type="radio" name="admin_qna_raidos" id="">기타문의</label>
         
        </span>
        </div>
    <div class="admin_qna_result">
        <span >검색결과 : </span> 
            <span class="admin_qna_counttOne">4</span>
            <span>/ 총</span>
            <span class="admin_qna_countAll">4</span>
            <span>건</span>
        </div>
        
        <div class="admin_qna_tableWrap">
        <table class="admin_qna_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" name="qna_checkbox" id="" value='selectall'
                    onclick='qnaSelectAll(this)'></th>
                <th >번호</th>
                <th>회원번호</th>
                <th>신고유형</th>
                <th>제목</th>
                <th>작성일</th>
                <th>답변상태</th>
                <th>삭제상태</th>
            </thead>
            </tr>
            <tbody>
            <c:choose>
                <c:when test="${empty QnaList}">
                <%-- 조회된 게시글 목록이 비어있구나 null인 경우 --%>
                <tr>
                    <th colspan="6">목록이 존재하지 않습니다.</th>
                </tr>
                </c:when>

                <c:otherwise>
                    <c:forEach items="${QnaList}" var="qna">
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>${qna.qnaNo}</td>
                            <td>${qna.userNo}</td>
                            <td>${qna.qnaType}</td>
                            <td><a href='/admin/admin_qna_read/${qna.qnaNo}'>${qna.qnaTitle}</a></td>
                            <td>${qna.qnaEnrollDate}</td>
                            <td>${qna.qnaCheckFl}</td>
                            <td>${qna.qnaDeleteFl}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
        </table>
    </div>

    </div>

<script src="\resources\js\admin\admin_qna.js"></script>
</body>
</html>