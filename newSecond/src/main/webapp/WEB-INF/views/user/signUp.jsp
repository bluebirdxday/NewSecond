<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="/resources/css/user/signUp.css">
</head>
<body>
    <div class="container">

        <h2>회원 정보를 입력해주세요</h2>

        <form action="/submit_registration" method="post">

            <div class="input-group">
                <input type="text" id="user_email" name="user_email" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Email</label>
            </div>

            <div class="input-group">
                <input type="password" id="user_password" name="user_password" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Password</label>
            </div>

            <div class="input-group">
                <input type="password" id="user_confirm_password" name="user_confirm_password" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Confirm Password</label>
            </div>

            <div class="input-group">
                <input type="text" id="user_nickname" name="user_nickname" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Nickname</label>
            </div>

            <div class="input-group">
                <input type="text" id="user_tel" name="user_tel" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Telephone</label>
            </div>

            <div class="input-group">
                <input type="text" id="user_address" name="user_address" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Address</label>
            </div>

            <button type="submit" class="submit-button">Register</button>
            
        </form>

    </div>

</body>
</html>