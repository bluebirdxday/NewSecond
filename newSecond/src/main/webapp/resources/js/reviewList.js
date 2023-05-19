
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
