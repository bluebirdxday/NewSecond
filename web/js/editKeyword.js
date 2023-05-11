
document.getElementById("addKeyword").addEventListener("click", ()=>{
    
    const newDiv = document.createElement("div");
    const newChildDiv = document.createElement("div");
    const newChildDiv2 = document.createElement("div");
    const newChildDiv2Child = document.createElement("img");
    
    const inputKeyword = document.querySelector(".keywordedit--input>input");

    newDiv.setAttribute("class", "keywordedit--item");

    newChildDiv.innerText = inputKeyword.value;

    newChildDiv2Child.setAttribute("src", "/web/src/img/minus-button.png");
    newChildDiv2Child.setAttribute("class", "keyword--btn__delete");
    
    newChildDiv2.appendChild(newChildDiv2Child);
    
    newDiv.appendChild(newChildDiv);
    newDiv.appendChild(newChildDiv2);
    
    document.querySelector(".keywordedit--content__list").appendChild(newDiv);
    
    inputKeyword.value = "";

    addKeyword();
    
});


function addKeyword(){
    
    const deleteKeywordList = document.querySelectorAll(".keyword--btn__delete");
    
    deleteKeywordList.forEach(function(item){
    
        // 키워드 삭제 hover시
        item.addEventListener("mouseover", ()=>{
            item.src = "/web/src/img/minus-button-hover.png"
        });
    
        item.addEventListener("mouseout", ()=>{
            item.src = "/web/src/img/minus-button.png"
        });
    
        // 키워드 삭제 클릭 시
        item.addEventListener("click", ()=>{
            item.parentElement.parentElement.remove();
        });
    
    });
}

addKeyword();