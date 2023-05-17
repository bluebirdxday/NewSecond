<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_user</title>
    <link rel="stylesheet" href="\resources\css\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin_qna.css">
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
            </thead>
            </tr>
            <tbody>
            <!-- <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>번호</td>
                <td>회원번호</td>
                <td>신고유형</td>
                <td>제목</td>
                <td>작성일</td>
                <td>
                <button class="admin_user_tableStatus answer[In]Complete">답변상태</button>
                </td>
                <td>
            </tr> -->
            <tr>
                <td><input type="checkbox" name="qna_checkbox" id=""></td>
                <td>4</td>
                <td>010</td>
                <td>거래신고</td>
                <td><a href="\admin\admin_qna_read">사기 당했어요(상세페이지 예시)</a></td>
                <td>2023.04.27</td>
                <td>
                    <span class="admin_qna_tableStatus answerComplete">답변완료</span>
                </td>
                <td>
            </tr>
            <tr>
                <td><input type="checkbox" name="qna_checkbox" id=""></td>
                <td>3</td>
                <td>1100</td>
                <td>오류/제안</td>
                <td>오류 났어요</td>
                <td>2023.04.27</td>
                <td>
                    <span class="admin_qna_tableStatus answerIncomplete">답변 미등록</span>
                </td>
                <td>
            </tr>
            <tr>
                <td><input type="checkbox" name="qna_checkbox" id=""></td>
                <td>2</td>
                <td>120</td>
                <td>채팅/알람</td>
                <td>채팅 내용 신고할게요</td>
                <td>2023.04.27</td>
                <td>
                    <span class="admin_qna_tableStatus answerComplete">답변완료</span>
                </td>
                <td>
            </tr>
            <tr>
                <td><input type="checkbox" name="qna_checkbox" id=""></td>
                <td>1</td>
                <td>125</td>
                <td>기타문의</td>
                <td>로그아웃이 안돼요</td>
                <td>2023.04.05</td>
                <td>
                    <span class="admin_qna_tableStatus answerIncomplete">답변 미등록</span>
                </td>
                <td>
            </tr>
        </tbody>
        </table>
    </div>

    </div>

<script src="\resources\js\admin_qna.js"></script>
</body>
</html>