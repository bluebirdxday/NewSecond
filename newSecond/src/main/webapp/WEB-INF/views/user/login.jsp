<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="/resources/css/login.css">

    <div class="dropdown">

        <button type="button" class="dropdown-text " data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" data-bs-offset="-100,10" >
            로그인
        </button>

        <form class="dropdown-menu p-4 speech-bubble loginPage--WrapForm" action="/user/login" method="post">

                <div class="mb-2">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="email@example.com" required autofocus autocomplete="off" />
                </div>

                <div class="mb-2">
                    <label for="userPassword" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="Password" required>
                </div>

                <div class="mb-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                        <label class="form-check-label" for="dropdownCheck2">
                        아이디 기억하기
                        </label>
                    </div>
                </div>
            
            <div class="d-flex justify-content-around mb-3 ">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>

            <div class="login--submit d-flex justify-content-center">
                <button type="submit" class="btn btn-primary ">로그인</button>
            </div>

        </form>

    </div>

