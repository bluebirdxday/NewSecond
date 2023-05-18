<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Side</title>

     <link rel="stylesheet" href="\resources\css\admin\adminSide.css">
</head>
<body>
  
    
    <ul class="admin_ul">
        <a href="/">
            <img src="../src/img/LOGO.png" alt="로고" id="homeLogo">
        </a>
        <li class="admin_list"><a class="admid_user" href="#">공지사항 관리</a></li>
        <li class="admin_list"><a class="admid_notice" href="#">회원 관리</a></li>
        <li class="admin_list"><a class="admid_board" href="#">게시글 관리</a></li>
        <li class="admin_list"><a class="admid_shop" href="#">상점 관리</a></li>
        <li class="admin_list"><a class="admid_qna" href="#">Q&A 관리</a></li>
    </ul>

<div class="admin_content">
</div>

    
</body>
</html>