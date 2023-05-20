// 탭메뉴 클릭 이벤트
const tabList = document.querySelectorAll(".tabs li");
const contentList = document.querySelectorAll(".myshop--tab__content");

tabList.forEach(function(tab) {

    tab.addEventListener("click" , function(){

        var tab_id = tab.firstChild.getAttribute('rel');

        tabList.forEach(e=>{
            e.classList.remove('tabs--active');
        });

        contentList.forEach(e=>{
            e.classList.remove('tabs--active');
        });

        tab.classList.add('tabs--active');
        document.getElementById(`${tab_id}`).classList.add('tabs--active');
    });
});


// 탭메뉴 중 상품 컨텐츠 리스트 정렬
const sortList = document.querySelectorAll(".myshop--tab1__content-top li");

sortList.forEach(function(sort){

    sort.addEventListener("click", function(){
        sortList.forEach(e=>{
            e.classList.remove('sort--active');
        });
        sort.classList.add('sort--active');
    });
});


// 편집 버튼 클릭 시
const popup = document.querySelector(".myshop--popup__background");
const editShopBtn = document.querySelector(".myshop--info__btn-edit");


if(editShopBtn!=null){
    
    const shopProfile = document.querySelector(".myshop--profileImage__img").getAttribute("src");   /* 상점 프로필 src */
    const shopTitle = document.querySelector(".myshop--info__title").innerText;
    const shopInfo = document.querySelector(".myshop--info__content").innerText;
    
    const popupShopTitle = document.querySelector(".myshop--popup__input-edit");
    const popupShopInfo = document.querySelector(".myshop--popup__textarea-edit");

    // 내 상점 편집 팝업 열기
    document.querySelector(".myshop--info__btn-edit").addEventListener("click", ()=>{
        popup.classList.toggle("myshop--popup__show");
    
        // 글자수 입력
        document.getElementById("myshopEditInput").innerText = popupShopTitle.value.length;
        document.getElementById("myshopEditTextArea").innerText = popupShopInfo.value.length;
        
    });
    
    const realUpload = document.querySelector(".real-upload");  // input 태그
    const upload = document.querySelector(".upload");   // img 태그

    let initCheck;  // 초기 프로필 이미지 상태 저장
    let deleteCheck = -1;  // 프로필 이미지 새로 업로드 or 삭제되었음을 나타냄
    let originalImage;     // 초기 프로필 이미지 파일의 경로 저장

    // 내상점 닫기 버튼 클릭 시
    document.querySelector(".myshop--popup__btn-close").addEventListener("click", ()=>{
        popup.classList.remove("myshop--popup__show");

        upload.setAttribute("src", shopProfile);
        realUpload.value="";
        popupShopTitle.value = shopTitle;
        popupShopInfo.value = shopInfo;
    });
    
    // 내 상점 저장 버튼 클릭 시
    document.querySelector(".myshop--popup__btn-save").addEventListener("click", ()=>{
        // popup.classList.remove("myshop--popup__show");
    });
    

    if(realUpload!=null){
        
        originalImage = upload.getAttribute("src");
        
        if(originalImage == "/resources/src/img/basic_profile.png"){
            initCheck = false;
        }else{
            initCheck = true;
        }

    }
    
    // 내상점 편집 팝업 프로필 이미지
    upload.addEventListener("click", ()=> realUpload.click());
    
    realUpload.addEventListener("change", e=>{
        
        const maxSize = 1* 1024 * 1024 * 2;
        const file = e.target.files[0];     // 업로드한 파일의 정보

        if(file==undefined){
            deleteCheck = -1;   // 취소==파일없음
            upload.setAttribute("src", originalImage);
            return;
        }

        if(file.size>maxSize){
            document.getElementById('toastBody').innerText = "2MB 이하의 이미지를 선택해주세요";
            document.getElementById('liveToast').classList.add('text-bg-danger');
            document.getElementById('liveToast').classList.remove('text-bg-primary');
            toastTrigger.click();

            realUpload.value="";
            deleteCheck = -1;   //취소==파일없음

            upload.setAttribute("src", originalImage);
            return;
        }


        const reader = new FileReader();
        reader.readAsDataURL(file);


        reader.onload = e =>{
            const url = e.target.result;
            upload.setAttribute("src", url);
            deleteCheck = 1;
        }
        
    });
    

    document.getElementById("updateShopInfoFrm").addEventListener("submit", e=>{
        let flag = true;
        const curShopTitle = document.querySelector(".myshop--info__title").innerText;
        const curShopInfo = document.querySelector(".myshop--info__content").innerText;

        if(deleteCheck == 1) flag = false;

        if(initCheck && deleteCheck == 0) flag = false;

        if(flag && (shopTitle===curShopTitle) && (shopInfo===curShopInfo)){
            e.preventDefault();
        }
    });


    
    // 내상점 팝업 편집 글자수 세기
    const inputCount = document.getElementById("myshopEditInput");
    const textAreaCount = document.getElementById("myshopEditTextArea");
    
    popupShopTitle.addEventListener("input", e=>{
        inputCount.innerText = e.target.value.length;
    
        if(e.target.value.length>=20 || e.target.value.length<=2){
            inputCount.classList.add("myshop--edit__error");
        }else{ 
            inputCount.classList.remove("myshop--edit__error");
        }
    });
    
    popupShopInfo.addEventListener("input", e=>{
        textAreaCount.innerText = e.target.value.length;
    
        if(e.target.value.length>=50){
            textAreaCount.classList.add("myshop--edit__error");
        }else{ 
            textAreaCount.classList.remove("myshop--edit__error");
        }
    });
}



// 상점 팔로우
function follow(userNo, loginUserNo){

    fetch("/shop/follow", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify({"passiveUserNo" : userNo, "activeUserNo" : loginUserNo})
    })
    .then(resp => resp.text())
    .then(()=>{
        location.reload();
    })
    .catch(err=>{ console.log(err); })
}


// 상점 언팔로우
function unFollow(userNo, loginUserNo){
    
    fetch("/shop/unFollow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify({"passiveUserNo" : userNo, "activeUserNo" : loginUserNo})
        })
        .then(resp => resp.text())
        .then(()=>{
            location.reload();
        })
        .catch(err=>{ console.log(err); })
}
    




// 상점 상품 판매 게시글 예약, 판매완료 
const overlayText = document.querySelectorAll('.overlay-text');

const reserved = document.querySelectorAll('.reserved');
const soldout = document.querySelectorAll('.soldout');

if(overlayText!=null){
    
    overlayText.forEach(e=>{

        e.style.position = 'absolute';
        e.style.top = '50%';
        e.style.left = '50%';
        e.style.transform = 'translate(-50%, -50%)';
        e.style.color = 'white';
        e.style.fontSize = '30px';
        e.style.width = '95px';
        e.style.fontWeight = '900';
        e.style.textAlign = 'center';
    })
    
}

if(reserved!=null){

    reserved.forEach(e=>{
        e.style.webkitTextStroke = '1px black'; // 글자 테두리 색상
        e.style.webkitTextFillColor = '#C2D3EB'; // 글자 색상
    })
}

if(soldout!=null){

    soldout.forEach(e=>{
        e.style.webkitTextStroke = '1px #e6ebfd'; // 글자 테두리 색상
        e.style.webkitTextFillColor = '#505bf0'; // 글자 색상
    })
}






// 상품 게시글 인기순/높은가격순/낮은가격순으로 조회
sortList.forEach(function(sort) {
    
    let sortType = 0;

    sort.addEventListener("click", function() {
        const popularity = this.classList.contains("by-popularity");
        const lowprice = this.classList.contains("by-lowprice");
        const highprice = this.classList.contains("by-highprice");

        if (popularity) sortType = 1;
        if (lowprice) sortType = 2;
        if (highprice) sortType = 3;

        selectGoodsList(userNo, sortType);

    });
    
});


function selectGoodsList(userNo, sortType){

    fetch("/shop/sortGoodsList", {
        method : "POST",
        headers : {"Content-Type": "application/json"},
        body : JSON.stringify({"userNo" : userNo, "sortType" : sortType})
    })
    .then(resp=>resp.json())
    .then(goodsList=>{
        

        const container = document.querySelector(".myshop--tab1__gridcontainer");
        container.innerHTML="";

        if(goodsList!=null){

            for(let goods of goodsList){


                // 게시글 1개 컨테이너
                const itemDiv = document.createElement("div");
                itemDiv.classList.add("tab1--gridcontainer__item");
                
    
                // 게시글 이미지 컨테이너
                const itemImgDiv = document.createElement("div");
                itemImgDiv.classList.add("tab1--item__img");
                
                // 게시글 썸네일
                const itemImg = document.createElement("img");
                itemImg.setAttribute("src", goods.thumbnail);
                
    
                // 판매완료/판매중 설정
                if(goods.goodsStatus=='E' || goods.goodsStatus=='C'){
                    itemImg.setAttribute("style", "filter : brightness(40%);");
                }
                
                const soldoutOrReservedDiv = document.createElement("div");
    
                if(goods.goodsStatus=='E'){
                    soldoutOrReservedDiv.classList.add("overlay-text");
                    soldoutOrReservedDiv.classList.add("soldout");
                    soldoutOrReservedDiv.innerText = "Sold Out";
                    soldoutOrReservedDiv.setAttribute("style", "position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; width: 95px; font-weight: 900; text-align: center; color: rgb(80, 91, 240); -webkit-text-stroke: 1px rgb(230, 235, 253); -webkit-text-fill-color: rgb(80, 91, 240);");
                    
                    
                }
                
                if(goods.goodsStatus=='C'){
                    soldoutOrReservedDiv.classList.add("overlay-text");
                    soldoutOrReservedDiv.classList.add("reserved");
                    soldoutOrReservedDiv.innerText = "Reserved";
                    soldoutOrReservedDiv.setAttribute("style", "position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; width: 95px; font-weight: 900; text-align: center; color: #C2D3EB; -webkit-text-stroke: 1px #000000); -webkit-text-fill-color: #C2D3EB;");
                }
    
                itemImgDiv.append(itemImg);
                itemImgDiv.append(soldoutOrReservedDiv);

    
                // 게시글 정보 div
                const itemDescDiv = document.createElement("div");
                itemDescDiv.classList.add("tab1--item__description");
    
                
                const firstDiv = document.createElement("div");
    
                // 게시글명
                if(goods.goodsTitle.length > 10){
                    firstDiv.innerText = goods.goodsTitle.substr(0, 10) + "...";
                }else{
                    firstDiv.innerText = goods.goodsTitle;
                }
                
    
                const secondDiv = document.createElement("div");
    
                // 상품 가격
                const priceDiv = document.createElement("div");
                priceDiv.innerText = goods.goodsPrice.toLocaleString(); 
    
                // 상품 등록시간
                const enrollDateDiv = document.createElement("div");
                enrollDateDiv.innerText = goods.sellEnrollDate;
    
                secondDiv.append(priceDiv, enrollDateDiv);
    
                itemDescDiv.append(firstDiv, secondDiv);
    
                itemDiv.append(itemImgDiv, itemDescDiv);

                container.append(itemDiv);

                
            }

        }

    
    })
    .catch(err=>{
        console.log(err);
    })
    
}
