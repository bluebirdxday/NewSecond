<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="qna" value="${Qna}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna copy</title>

    <style>
        @import url('https://fonts.googleapis.com/icon?family=Material+Icons');
    </style>

    <link rel="stylesheet" href="/web/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/web/src/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="/resources/css/qna.css">


</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
  <!-- 제목 바 -->
        <div class="qna_bar_container" style =" background-color:#8ab2e24b"> 
            <div class="qna_bar">1:1 문의</div>
    </div>  
<!-- 문의하기 드랍 및 내용  -->
  <form action="/admin/qna_check" method="POST" class="qna_check" id="qnaWriteFrm" >
    <div class="qna_container">
    <div class="qna_dropdown">
        <button type="button" class="qna_dropbtn">
          <span class="qna_dropbtn_content">문의 게시판</span>
          <span class="qna_dropbtn_click" style="font-family: Material Icons; font-size : 30px; color :  #005EEE; float:right;"
            onclick="dropdown()">arrow_drop_down</span>
        </button>
        <div class="qna_dropdown-content">
          <div class="qnaList" onclick="showMenu(this.innerText)" >거래신고</div>
          <div class="qnaList" onclick="showMenu(this.innerText)" >회원/계정</div>
          <div class="qnaList" onclick="showMenu(this.innerText)" >오류/제안</div>
          <div class="qnaList" onclick="showMenu(this.innerText)" >채팅/알람</div>
        </div>
      </div>

      <input type="hidden" name="qnaType" value="">

      <div class="qna_title">
      문의제목 :${qna.qnaTitle} <input type="text" name="" id="" class="qna_titleInput">
      </div>

      <div class="qna_content">
        <textarea name="" id="qna_content" cols="88" rows="20" 
        style="resize: none;" placeholder="  문의내용">${qna.qnaContent}</textarea>
    </div>
    
</div>

<!-- 문의하기 버튼 -->
 
      <div id="qna_button_wrap">
     <button type="submit" id="qna_button"><a href="\qna\qna_check">문의 하기</a></button>
    </div>
    </form>
    

  
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/qna.js"></script>
    

</body>
</html>