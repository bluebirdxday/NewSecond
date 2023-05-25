<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="notice" value="${noticeList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admid_qnd_detail</title>
 
    <link rel="stylesheet" href="\resources\css\notice\notice_read.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <!-- ----------상단 제목---------- -->
  <div class="notice_read_wrap">
    <span class="notice_read_bar">공지사항</span>
 <!--        <span class="admin_notice_barBtn">새 공지사항</span>  -->
    <hr>
    <!-- 문의사항 테이블 -->
    <table class="notice_read_table" border="1">
            <tr>
                <th>번호</th>
                <td>${Notice.noticeNo}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${Notice.noticeTitle}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${Notice.noticeEnrollDate}</td>
            </tr>
            <tr>
                <th>조회수</th>
                <td>${Notice.noticeViewCount}</td>
            </tr>
        </table>
        
       <!-- 글 읽어 오기 -->
            <div class="notice_read_content">
                <div>${Notice.noticeContent}</div>
            </div>
            
    
   
    
      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>