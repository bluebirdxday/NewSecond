
function deleteReview(reviewNo) {

    if(confirm("정말 삭제하시겠습니까?")){
        fetch("/review/reviewList/updateOrDelete", {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({reviewNo : reviewNo})
            }).then(response => response.text())
            .then(result => {

                if (result>0) {
                    alert("리뷰가 삭제되었습니다.");
                    location.reload();
                } else {
                    alert("리뷰 삭제에 실패하였습니다.");
                }
        
                }
            ).catch(error => {
            console.log(error.message);
            });

    }
}
