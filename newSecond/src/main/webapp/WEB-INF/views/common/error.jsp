<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Error</title>
    <style>
            @font-face {
            font-family: 'Pretendard';
            src: url(/resources/src/img/font/Pretendard-Light.woff) format('woff');
            font-weight: 300;
            font-style: light;
        }

        @font-face {
            font-family: 'Pretendard';
            src: url(/resources/src/img/font/Pretendard-Regular.woff) format('woff');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'Pretendard';
            src: url(/resources/src/img/font/Pretendard-Medium.woff) format('woff');
            font-weight: 500;
            font-style: medium;
        }

        @font-face {
            font-family: 'Pretendard';
            src: url(/resources/src/img/font/Pretendard-Bold.woff) format('woff');
            font-weight: 700;
            font-style: bold;
        }

        @font-face {
            font-family: 'Pretendard';
            src: url(/resources/src/img/font/Pretendard-ExtraBold.woff) format('woff');
            font-weight: 800;
            font-style: bolder;
        }

        #error-container{
            width: 800px;
            height: 300px;
            text-align: center;
            
            position: absolute;
            top : 0; bottom: 0; left: 0; right: 0;
            margin: auto;
        }
        
        #btn-area button{
            width: 180px;
            height: 40px;
            margin: 20px 3px 0 3px;
            border-radius: 10px;
            background-color: #C2D3EB;
            border: none;
            font-size: 18px;
        }

        #error-container > h1{ margin-bottom: 50px; }

        .error-cnotent-title{
            text-align: left;
            font-weight: bold;
        }
        
        #btn-area{ text-align: center;  }

        p{
            font-size: 20px;
        }

    </style>
</head>
<body>

    <div id="error-container">
        <h1>서비스 이용 중 문제가 발생했습니다</h1>
        
        <p>찾을 수 없는 페이지 입니다</p>
        <p>
            자세한 문제 원인 및 해결은 관리자에게 문의해주세요
        </p>

        <div id="btn-area">
            <a href="/"><button>홈으로 이동</button></a>
            
            <button onclick="history.back()">이전 페이지</button>
            
        </div>
    </div>

    
    
</body>
</html>