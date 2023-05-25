// 캐러셀
const prev = document.querySelector('.prev');
const next = document.querySelector('.next');
const carousel = document.querySelector('.carousel');

let index = 0;
// 둘러싸는 캐러셀의 자식요소 수 -1 = 마지막 인덱스
const last = document.getElementById("imageList").childElementCount - 1;

prev.addEventListener('click', () => {
    if(index === 0) return;
    index -= 1;
    carousel.style.transform = `translate3d(-${300*index}px,0,0)`;
	
});
// 마지막 사진 인덱스
next.addEventListener('click', () => {
    if(index === last) return;
    index += 1;
    carousel.style.transform = `translate3d(-${300*index}px,0,0)`;
});


// 좋아요 버튼
const goodsLike = document.getElementById("goodsLike");

goodsLike.addEventListener("click",e=>{
    if(loginUserNo == goodsUserNo){
        // e.preventDefault();
        return;
    }

    if(loginUserNo == ""){
        document.getElementById('toastBody').innerText = "로그인 후 이용해주세요!";
        document.getElementById('liveToast').classList.add('text-bg-danger');
        toastTrigger.click();
        return;
    }
    let check; // 기존 찜x:0, 찜:1
    if(e.target.classList.contains("beforeLike")){
        check = 0;
    } else {
        check = 1;
    }
    // ajax
    const data = {"goodsNo": goodsNo, "loginUserNo": loginUserNo, "check": check};
    fetch("/goods/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(response => response.text())
    .then(count => {
        // console.log("count : " + count);
        if(count == -1){
            console.log("좋아요 처리를 실패했습니다. 다시 시도해주세요.");
            return;
        }

        e.target.classList.toggle("beforeLike");
        e.target.classList.toggle("afterLike");
        if(e.target.classList.contains("beforeLike")){
            e.target.setAttribute("src","/resources/src/img/heartBefore.png");
        }else{
            e.target.setAttribute("src","/resources/src/img/heartAfter.png");
            
            /* 희진 : 관심상품 등록 알림 */
            sendLikeBoardNotification(goodsUserNo, goodsNo, loginUserNo);
        }
        document.getElementById("wishCount").innerText = count;

    })
    .catch(err => {
        console.log("예외가 발생했습니다.");
        console.log(err);
    })

});






/* 희진 : 관심상품 등록 알림 */
// 알림 종류('F': 팔로우, 'P':가격 하락, 'L': 관심상품등록, 'K':키워드, 'N':새글 업데이트)
const sendLikeBoardNotification = (goodsUserNo, goodsNo, loginUserNo)=>{
    
    let likeNofiticationSock = new SockJS("/notificationSock");
    let likeInquireNotiSocket = new SockJS("/inquireNotificationSock"); 
    
    const goodsTitle = document.getElementById("goodsTitle").value;
    
    let notiGoodTitle =  goodsTitle.substr(0, 13) + "...";

    var likeGoodsObj = {
        "senderNo" : loginUserNo,
        "targetNo" : goodsUserNo,
        "notificationMessage" : "님께서 회원님의 [" + notiGoodTitle + "] 상품을 관심상품으로 등록하였습니다.",
        "notificationType" : "L",
        "notificationURL" : "/goods/" + goodsNo
    };

    likeNofiticationSock.send(JSON.stringify(likeGoodsObj));

    // var likeGoodsObj2 = {
    //     "targetNo" : goodsUserNo
    // }

    // likeInquireNotiSocket.send(JSON.stringify(likeGoodsObj2));

}


/* 희진 : 키워드 알림 */
const uploadComplete = document.getElementById("uploadComplete").value;
if(uploadComplete!=''){

    let likeNofiticationSock = new SockJS("/notificationSock");

    // 라이브 알림 보내기
    fetch("/notification/selectKeywordNotiList?goodsNo=" + goodsNo)
    .then(resp=>resp.json())
    .then(keywordNotiList=>{
        likeNofiticationSock.send(JSON.stringify(keywordNotiList));
    }).catch(err=>{
        console.log(err);
    })

}