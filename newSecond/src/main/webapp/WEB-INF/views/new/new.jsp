<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>최근조회상품</title>

    <link rel="stylesheet" href="\resources\fontawesome\css/all.min.css">
    <link rel="stylesheet" href="/web/src/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="/resources/css/new.css">
</head>
<body>

    
    <div class="new_bar_container" style =" background-color:#8ab2e24b" >
        <div class="new_bar">RECENT</div>
        </div>  

        <div class="new_sortContainer">
            <div class="new_ck_deleteWrap">
            <span class="new_ck_delete"> 
                <input type="checkbox" class="new_checkboxOne" id="new_label" value='selectall'
                onclick='newSelectAll(this)'>
                <label class="new_ck_label" for="new_label">선택 
                    <button class="new_checkboxDelete">삭제</button>
                </label>
            </span>  
      
            <span class="new_sorting new">최근 조회순</span>
            <span class="new_sorting hprice">높은 가격순</span>
            <span class="new_sorting lprice">낮은 가격순</span>
        </div>
    </div> 
    </div>


        <div style="text-align:center">
        <div class="new_imgContatiner">

            <div class="new_imgDiv">
                <label class="new_ck_label">
                <img class="new_img" src="\resources\images\common\newProduct/img1 bicyle.jpg" alt="">
                <input type="checkbox" class="new_checkbox"></label>
                <div class="new_info"><span>서울 / 자전거 <b class="new_price" >50,000원</b></span></div>
            </div>
            <div class="new_imgDiv">
                <label class="new_ck_label">
                <img class="new_img" src="\resources\images\common\newProduct/img1 hoodie.jpeg" alt="">
                <input type="checkbox" class="new_checkbox"></label>
                <div class="new_info"><span>서울 / 그레이 후드 <b class="new_price" >50,000원</b></span></div>
            </div>
           
        <div class="new_imgDiv">
        <label class="new_ck_label">
            <img class="new_img" src="\resources\images\common\newProduct/img1 nike shoes.jpeg" alt="">
            <input type="checkbox" class="new_checkbox"></label>
            <div class="new_info"><span>서울 / 나이키 운동화 <b class="new_price" >50,000원</b></span></div>
        </div>
           
       
     </div>
     </div>
  
 

        


   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/new.js"></script>
    
    <script src="/web/src/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>