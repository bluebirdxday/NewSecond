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
    <link rel="stylesheet" href="\resources\css\admin_user.css">

</head>
<body>

    <ul class="admin_ul">
        <a href="/">
            <img src="../src/img/LOGO.png" alt="로고" id="homeLogo">
        </a>
        <li class="admin_list"><a class="admid_user" href="\admin\admin_user">회원 관리</a></li>
        <li class="admin_list"><a class="admid_notice" href="\admin\admin_notice">공지사항 관리</a></li>
        <li class="admin_list"><a class="admid_board" href="/web/html/관리자_게시글관리.html">게시글 관리</a></li>
        <li class="admin_list"><a class="admid_qna" href="/web/html/관리자_문의관리.html">문의 관리</a></li>
    
    </ul>

    <!-- -------------------- -->
  

    <div class="admin_user_wrap">
        <div class="admin_user_bar">회원관리</div>
        <hr>
        <div >
            <span>
                <input class="admin_user_search" type="text" name="" id="">
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
    <div class="admin_user_result">
        <span >검색결과 : </span> 
            <span class="admin_user_countOne">3</span>
            <span>/ 총</span>
            <span class="admin_user_countAll">3</span>
            <span>명</span>
        </div>
        
        <div class="admin_user_tableWrap">
        <table class="admin_user_table" style="border-collapse: collapse;">
            <thead>
            <tr >
                <th><input type="checkbox" name="" id="" value='selectall'
                    onclick='userSelectAll(this)'></th>
                <th >번호</th>
                <th>아이디</th>
                <th>상태</th>
                <th>가입일</th>
                <th colspan="2">관리</th>
            </thead>
            </tr>
            <tbody>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>1</td>
                <td>bungae</td>
                <td class="admin_user_states">정상</td>
                <td>2022.10.01</td>
                <td>
                <button class="admin_user_tableBtn signOut" >강제탈퇴</button>
                </td>
                <td>
                <button class="admin_user_tableBtn block" >회원블락</button>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>2</td>
                <td>bungae</td>
                <td class="admin_user_states">블락</td>
                <td>2022.10.01</td>
                <td>
                    <button class="admin_user_tableBtn signOut" >강제탈퇴</button>
                    </td>
                    <td>
                    <button class="admin_user_tableBtn block" >블락해제</button>
                    </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>3</td>
                <td>bungae</td>
                <td class="admin_user_states">탈퇴</td>
                <td>2022.10.01</td>
                <td>
                    <button class="admin_user_tableBtn signOut">강제탈퇴</button>
                    </td>
                    <td>
                    <button class="admin_user_tableBtn block">회원블락</button>
                    </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td>4</td>
                <td>bungae</td>
                <td class="admin_user_states">정상</td>
                <td>2022.10.01</td>
                <td>
                    <button class="admin_user_tableBtn signOut">강제탈퇴</button>
                    </td>
                    <td>
                    <button class="admin_user_tableBtn block">회원블락</button>
                    </td>
            </tr>
        </tbody>
        </table>
    </div>

    </div>


<script src="\resources\js\admin_user.js"></script>

</body>
</html>