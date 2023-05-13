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

    <link rel="stylesheet" href="/resources/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <div class="login-container">

        <div class="mb-5">
            <h2>회원 정보를 입력해주세요</h2>
        </div>

        <form action="/submit_registration" method="post">
            
            <div class="input-container">
                <input type="text" id="user_email" name="user_email" required>
                <label>Email</label>
            </div>

            <div class="input-container">
                <input type="password" id="user_password" name="user_password" required>
                <label>Password</label>
            </div>

            <div class="input-container">
                <input type="password" id="user_confirm_password" name="user_confirm_password" required>
                <label>Confirm Password</label>
            </div>

            <div class="input-container">
                <input type="text" id="user_nickname" name="user_nickname" required>
                <label>Nickname</label>
            </div>

            <div class="input-container">
                <input type="text" id="user_tel" name="user_tel" required>
                <label>Telephone</label>
            </div>

            <div class="input-container">
                <input type="text" id="user_address" name="user_address" required>
                <label>Address</label>
            </div>

            <button type="submit" class="submit-button">Register</button>
        </form>

    </div>
    <script src="/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>