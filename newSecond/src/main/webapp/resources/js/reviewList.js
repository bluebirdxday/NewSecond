
function deleteReview(reviewNo) {

    if(confirm("정말 삭제하시겠습니까?")){
        fetch("/review/reviewList/delete", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body:  reviewNo
            }).then(response => response.text())
            .then(result => {

                if (result>0) {
                    document.getElementById('toastBody').innerText = "리뷰가 삭제되었습니다.";
                    document.getElementById('liveToast').classList.remove('text-bg-danger');
                    document.getElementById('liveToast').classList.add('text-bg-primary');
                    location.reload();
                } else {
                    document.getElementById('toastBody').innerText = "리뷰 삭제에 실패하였습니다.";
                    document.getElementById('liveToast').classList.add('text-bg-danger');
                    document.getElementById('liveToast').classList.remove('text-bg-primary');
                }
        
                }
            ).catch(error => {
            console.log(error.message);
            });

    }

    toastTrigger.click();
}


/* 리뷰 작성 알림 */
const reviewUserNo = document.getElementById("reviewUserNo").value;
const reviewGoodsNo = document.getElementById("reviewGoodsNo").value;

if(reviewUserNo!='' && reviewGoodsNo!=''){

    console.log(reviewUserNo);
    console.log(reviewGoodsNo);
    let addReviewNotiSock = new SockJS("/notificationSock");

    // 작성된 리뷰 (loginUserNo의 주인: senderNo , goodsNo의 주인: targetNo)
    fetch("/notification/addReviewNotification?userNo="+ reviewUserNo + "&goodsNo=" + reviewGoodsNo)
    .then(resp=>resp.json())
    .then(newReviewNotiList=>{
        addReviewNotiSock.send(JSON.stringify(newReviewNotiList));
    }).catch(err=>{
        console.log(err);
    })

}