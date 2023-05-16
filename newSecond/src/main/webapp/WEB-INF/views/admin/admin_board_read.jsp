<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_qnd_detail</title>
    <link rel="stylesheet" href="\resources\css\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin_board_read.css">
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
  <div class="admin_board_read_wrap">
    <span class="admin_board_read_bar">게시글 관리</span>
 <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
    <hr>
    <!-- 문의사항 테이블 -->
    <table class="admin_board_read_table" border="1">
            <tr>
                <th>번호</th>
                <td>1</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>뉴세컨마켓 사용 가이드</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>2023.04.27</td>
            </tr>
            <tr>
                <th>조회수</th>
                <td>250</td>
            </tr>
        </table>
        
       <!-- 글 읽어 오기 -->
            <div class="admin_board_read_content">
                <div>안녕하세요.<br>
                    뉴세컨마켓입니다.</div>
            </div>
            
    
            <div class="admin_board_read_BtnWrap">
                <button class="admin_board_read_Btn">블라인드</button>
            </div>

   
    
</body>
</html>