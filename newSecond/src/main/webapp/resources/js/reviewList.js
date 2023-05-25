
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
// if(addedReview==null){

//     let addReviewNotiSock = new SockJS("/notificationSock");

//     // 작성된 리뷰 (loginUserNo의 주인: senderNo , goodsNo의 주인: targetNo)
//     fetch("/notification/addReviewNotification?senderNo="+ addedReview.userNo + "&goodsNo=" + addedReview.goodsNo)
//     .then(resp=>resp.json())
//     .then(newReviewNotiList=>{
//         likeNofiticationSock.send(JSON.stringify(newPostNotiList));
//     }).catch(err=>{
//         console.log(err);
//     })

// }