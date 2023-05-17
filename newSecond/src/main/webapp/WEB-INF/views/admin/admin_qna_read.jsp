<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_qnd_detail</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_qna_read.css">
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

  <!-- ----------상단 제목---------- -->
  <div class="admin_qna_read_wrap">
    <span class="admin_qna_read_bar">문의 관리</span>
 <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
    <hr>
    <!-- 문의사항 테이블 -->
    <table class="admin_qna_read_table" border="1">
            <tr>
                <th>제목</th>
                <td>사기 당했어요</td>
            </tr>
            <tr>
                <th>문의유형</th>
                <td>거래신고</td>
            </tr>
            <tr>
                <th>회원번호</th>
                <td>010</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>2023.05.01</td>
            </tr>
        </table>
        
       <!-- 글 읽어 오기 -->
            <div class="admin_qna_read_content">
                <div>샀는데 가품이에요. 신고 어떻게 하나요?</div>
            </div>
            
            <!-- 댓글기능 -->
            <div class="admin_qna_read_comment">
                <div>
                    112에 신고하세요...
                </div>
            </div>

            <div class="admin_qna_read_BtnWrap">
                <button class="admin_qna_read_Btn">답변 삭제</button>
                <button class="admin_qna_read_Btn">답변 수정</button>
                <button class="admin_qna_read_Btn">답변 등록</button>
            </div>

   
            <script src="\resources\js\admin_qna_read.js"></script>
</body>
</html>