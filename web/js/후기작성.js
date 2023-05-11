
window.onload=()=>{
    
    // textarea 포커스in
    const textarea = document.querySelector(".writereview--textarea>textarea");
    const textareaDiv = document.querySelector(".writereview--textarea");
    
    textarea.addEventListener("focusin", ()=>{
        textareaDiv.style.border = "2px solid #E3E3E3";
        textarea.style.backgroundColor = "#ffffff";
        textareaDiv.style.backgroundColor = "#ffffff";
        
    });
    
    textarea.addEventListener("focusout", ()=>{
        textareaDiv.style.border = "none";
        
        if(textarea.innerText==""){
            textarea.style.backgroundColor = "#F0F0F0";
            textareaDiv.style.backgroundColor = "#F0F0F0";
        }
    });
    
    
    // 후기 작성 가능 리스트 드롭다운
    document.querySelector(".writereview--dropdown__btn").addEventListener("click", ()=>{
        dropdown();
    });

    document.querySelector(".writereview--dropdown__btn-click").addEventListener("click", ()=>{
        dropdown();
    });

    document.querySelector(".writereview--dropdown__btn-content").addEventListener("click", ()=>{
        dropdown();
    });

    document.querySelectorAll(".writereview--dropdown__item").forEach(item =>{
        item.addEventListener("click", function(){
            const itemText = item.innerText;
    
            showTransactionList(itemText);
    
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
    
    
};



window.onclick= (e)=>{
    
    if(!e.target.matches(".writereview--dropdown__btn") && !e.target.matches(".writereview--dropdown__btn-click")){
        const dropdown = document.querySelector(".writereview--dropdown__content");
        
        if (dropdown.classList.contains("show")) {
            dropdown.classList.remove("show");
            changeArrow();
        }
        
    }
    
    if(e.target.matches(".writereview--dropdown__content>div")){
        changeArrow();
    }
}

function changeArrow(){
    const arrow = document.querySelector(".writereview--dropdown__btn-click");
    
    if(arrow.innerText=="▼"){
        arrow.innerText = "▲";
    }else{
        arrow.innerText="▼";
    }
}

const drawStar = (target) => {
    document.querySelector(".rating--star span").style.width = `${target.value * 10}%`;
}
