
const deleteKeywordList = document.querySelectorAll(".keyword--btn__delete");



deleteKeywordList.forEach(function(item){

    item.addEventListener("mouseover", ()=>{
        item.src = "/web/src/img/minus-button-hover.png"
    });

    item.addEventListener("mouseout", ()=>{
        item.src = "/web/src/img/minus-button.png"
    });

});

