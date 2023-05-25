
const drawStar = (target) => {
    document.querySelector(".rating--star span").style.width = `${target.value * 10}%`;
}



// (리뷰 추가 페이지)후기 별점, 제목, 상세후기 미작성 시
const reviewForm = document.getElementById("reviewForm");
const reviewStars = document.querySelector("input[name='reviewStars']");
const goodsTitle = document.querySelector("input[name='goodsTitle']");
const reviewMessage = document.querySelector("textarea[name='reviewMessage']");

const textarea = document.querySelector(".writereview--textarea>textarea");
const textareaDiv = document.querySelector(".writereview--textarea");



// textarea 포커스
textarea.addEventListener('input', ()=>{
    // textarea의 값이 비어있는지 확인
    if (textarea.value.trim() !== '') {
        textareaDiv.style.border = "2px solid #E3E3E3";
        textarea.style.backgroundColor = "#ffffff";
        textareaDiv.style.backgroundColor = "#ffffff";
    } else {
      // 값이 없을 경우 배경 색상을 초기화
    textarea.style.backgroundColor = '';
    textareaDiv.style.backgroundColor = '';
    textareaDiv.style.border = 'none';
    }
});


if(reviewForm != null){  
    
    window.onload=()=>{
    
        // 후기 작성 가능 리스트 드롭다운
        document.querySelector(".writereview--dropdown__btn").addEventListener("click", ()=>{
            dropdown();
        });
        
        document.querySelectorAll(".writereview--dropdown__item").forEach(item =>{
            item.addEventListener("click", function(){
                const itemText = item.innerText;
                const goodsNoText = item.nextElementSibling.innerText;
                const hiddenInput = document.querySelector("input[name='goodsNo']");
                const goodsTitle = document.querySelector("input[name='goodsTitle']");
        
                showTransactionList(itemText);
                goodsTitle.value = itemText;
                hiddenInput.value = goodsNoText;
    
        
            });
        });
        
        function dropdown(){
            const content = document.querySelector(".writereview--dropdown__content");
            const dropbtn = document.querySelector(".writereview--dropdown__btn");
            
            content.classList.toggle("show");
            dropbtn.style.border = "2px solid #E3E3E3";
            
            changeArrow();
        }
        
        
        
        function showTransactionList(value){
            const dropbtn_content = document.querySelector(".writereview--dropdown__btn-content");
            const dropbtn = document.querySelector(".writereview--dropdown__btn");
            
            dropbtn_content.innerText = value;
            dropbtn.style.backgroundColor = "#ffffff";
            dropbtn_content.style.color = "#252525";
            dropbtn.style.borderColor = "#F0F0F0";
            
            changeArrow();
        }
        
        function changeArrow(){
            const arrow = document.querySelector(".writereview--dropdown__btn-click");
            
            if(arrow.innerText=="▼"){
                arrow.innerText = "▲";
            }else{
                arrow.innerText="▼";
            }
        }
    
    };
    
    
    
    window.onclick= (e)=>{
    
        if(!e.target.matches(".writereview--dropdown__btn")){
            const dropdown = document.querySelector(".writereview--dropdown__content");
        
            if (dropdown.classList.contains("show")) {
                dropdown.classList.remove("show");
            }
        }
    }

    
    reviewForm.addEventListener("submit", e=>{

        // 리뷰 별점 미작성 시
        if(reviewStars.value.trim()==""){
            alert("별점을 입력해주세요.");
            e.preventDefault();
            return;
        }

        // 구매내역 미선택 시
        if(goodsTitle.value.trim()==""){
            alert("후기를 작성하고자 하는 구매내역을 선택해주세요.");
            e.preventDefault();
            return;
        }

        // 상세 후기 미작성 시
        if(reviewMessage.value.trim()==""){
            alert("상세후기를 작성해주세요.");
            reviewMessage.focus();
            e.preventDefault();
            return;
        }

    });

}


// (리뷰 수정 페이지)후기 별점, 제목, 상세후기 미작성 시
const updateReviewForm = document.getElementById("updateReviewForm");

if(updateReviewForm != null){  

    updateReviewForm.addEventListener("submit", e=>{

        // 상세 후기 미작성 시
        if(reviewMessage.value.trim()==""){
            document.getElementById('liveToast').classList.remove('text-bg-primary');
            document.getElementById('liveToast').classList.add('text-bg-danger');
            document.getElementById('toastBody').innerText = "상세후기를 작성해주세요";
            toastTrigger.click();

            reviewMessage.focus();
            e.preventDefault();
            return;
        }

        if(reviewMessage.value.trim().length>200){
            alert("후기는 200자를 초과할 수 없습니다.");
            message = "후기는 200자를 초과할 수 없습니다";
            alertType = "fail";
            reviewMessage.focus();
            e.preventDefault();
        }

    });
    

}

