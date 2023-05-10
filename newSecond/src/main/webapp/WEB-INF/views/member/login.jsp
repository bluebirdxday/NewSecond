<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <link rel="stylesheet" href="/resources/css/login.css">
    <div id="loginModal" class="loginPage--loginModal" onclick="closeModalWindow(event)">
        <div class="loginPage--modalWindow">
                <section class="loginPage--modalWindow__top">
                    <img src="\resources\images\common\LOGO.png">
                </section>
                <section class="loginPage--modalWindow__midForm">
                    <form action="/member/login" method="post">
                        <input type="text" class="form-control" name="userEmail" placeholder="이메일" required autofocus autocomplete="off" />
                        <input type="password" class="form-control" name="userPassword" placeholder="비밀번호" required autocomplete="off"/>      
                        <div class="loginPage--modalWindow__midFormBot">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>   
                        </div>
                    </form>  
                </section>    
                <section class="loginPage--modalWindow__bot">
                    <div class="loginPage--modalWindowBot__top">
                        <a href="#">아이디 찾기</a>
                        <a href="#">비밀번호 찾기</a>
                    </div>
                    <div class="loginPage--modalWindowBot__bot">
                        <a href="/web/html/signup.html">회원가입</a>
                    </div>
                </section>
        </div>
    </div>

    <script src="/resources/js/login.js"></script>
