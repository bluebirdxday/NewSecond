<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="notice" value="${Notice}}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_notice_detail</title>
    <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
    <link rel="stylesheet" href="\resources\css\admin\admin_notice_write.css">
    
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

  <!-- ----------상단 제목---------- -->
    <form action="/admin/admin_notice_update/${noticeNo}" method="POST" 
        class="notice-update" id="noticeUpdateFrm" >

  <div class="admin_notice_write_wrap">
    <span class="admin_notice_write_bar">공지사항 관리</span>
 <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
    <hr>
    <!-- 문의사항 테이블 -->
    <table class="admin_notice_write_table" border="1">
            <tr>
                <th>제목</th>
                <td><input class="admin_notice_writeTitle" autofocus name="noticeTitle" value="${Notice.noticeTitle}"></td>
            </tr>
        </table>
        
       <!-- 글 읽어 오기 -->
            <div class="admin_notice_write_content">
                <textarea class="admin_notice_write_content2" name="noticeContent" id="" cols="3" rows="10">${Notice.noticeContent}</textarea><br>
            </div>
    

    
            <div class="admin_notice_write_BtnWrap">
                <button type="submit" class="admin_notice_write_Btn">글 등록</button>
         <%--        <button class="admin_notice_write_Btn">필독 취소</button> --%>
            </div>

             </div>

   </form>
    
</body>
</html>