// 캐러셀
const prev = document.querySelector('.prev');
const next = document.querySelector('.next');
const carousel = document.querySelector('.carousel');

let index = 0;

prev.addEventListener('click', () => {
    if(index === 0) return;
    index -= 1;
    carousel.style.transform = `translate3d(-${300*index}px,0,0)`;
    // carousel.style.transition = 'all 0.5s ease-in-out';
    // document.querySelector(".img").style.transition = 'all 0.5s ease-in-out'
    // prev.style.tra

	
});
// 마지막 사진 인덱스???
next.addEventListener('click', () => {
    if(index === 2) return;
    index += 1;
    carousel.style.transform = `translate3d(-${300*index}px,0,0)`;
});

// function moveSmooth(name){
//     var location = document.
// }






// 좋아요 버튼
const goodsLike = document.getElementById("goodsLike");

goodsLike.addEventListener("click",e=>{
    // 로그인 여부 검사 넣기
    //loginMemberNo 변수 알맞은 걸로 넣기
    // if(logiMemberNo = ""){
    //     alert("로그인 후 이용해주세요");
    //     return;
    // }

    let check; // 기존 빈하트:0, 찬하트:1

    if(e.target.classList.contains("beforeLike")){
        check = 0;
    } else {
        check = 1;
    }

    // ajax
    // boardNo, loginMemberNo 알맞은 변수로 바꾸기
    //const data = {"boardNo": boardNo, "memberNo": loginMemberNo, "check": check};

    fetch("/goodsDetail/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(response => response.text())
    .then(count => {
        console.log("count : " + count);
        if(count == -1){
            console.log("좋아요 처리를 실패했습니다. 다시 시도해주세요.");
            return;
        }
    })
    .catch(err => {
        console.log("예외가 발생했습니다.");
        console.log(err);
    })

});