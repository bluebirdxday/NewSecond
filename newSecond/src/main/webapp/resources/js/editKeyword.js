
// 키워드 수 제한 두기
const maxKeyword = document.getElementById("maxKeyword");

if(maxKeyword!=null){
    maxKeyword.addEventListener("cilck", ()=>{
        alert("등록할 수 있는 키워드 개수를 초과하였습니다.")
    });
}


// //키워드 추가 버튼 클릭 시
// const addKeyword = document.getElementById("addKeyword");

// addKeyword.addEventListener("click", ()=>{
    
//     const newDiv = document.createElement("div");
//     const newChildDiv = document.createElement("div");
//     const newChildDiv2 = document.createElement("div");
//     const newChildDiv2Child = document.createElement("img");
    
//     const inputKeyword = document.querySelector(".keywordedit--input>input");

//     newDiv.setAttribute("class", "keywordedit--item");

//     newChildDiv.innerText = inputKeyword.value;

//     newChildDiv2Child.setAttribute("src", "/resources/src/img/minus-button.png");
//     newChildDiv2Child.setAttribute("class", "keyword--btn__delete");
    
//     newChildDiv2.appendChild(newChildDiv2Child);
    
//     newDiv.appendChild(newChildDiv);
//     newDiv.appendChild(newChildDiv2);
    
//     document.querySelector(".keywordedit--content__list").appendChild(newDiv);
    
//     addKeyword();
    
// });


const deleteKeywordList = document.querySelectorAll(".keyword--btn__delete");

if(deleteKeywordList != null){
    deleteKeywordList.forEach(function(item){
    
        // 키워드 삭제 hover시
        item.addEventListener("mouseover", ()=>{
            item.src = "/resources/src/img/minus-button-hover.png"
        });
    
        item.addEventListener("mouseout", ()=>{
            item.src = "/resources/src/img/minus-button.png"
        });
    
    });
}


// 키워드 추가 버튼 클릭 시
const insertKeywordText = document.getElementById("insertKeywordFrm");
const keyword = document.querySelector('input[name="keyword"]');

insertKeywordText.addEventListener("submit", (e)=>{
    
    if(keyword.value.trim().length<2){
        document.getElementById('toastBody').innerText = "키워드를 최소 2글자 이상 입력해주세요.";
        document.getElementById('liveToast').classList.add('text-bg-danger');
        document.getElementById('liveToast').classList.remove('text-bg-primary');
        e.preventDefault();
        keyword.value = "";
    }
    
    if(keyword.value.trim().length>20){
        document.getElementById('toastBody').innerText = "키워드는 최대 20글자까지 가능합니다.";
        document.getElementById('liveToast').classList.add('text-bg-danger');
        document.getElementById('liveToast').classList.remove('text-bg-primary');
        e.preventDefault();
        keyword.value = "";
    }

    toastTrigger.click();
    
});


// 키워드 삭제 버튼 클릭 시
function deleteKeyword(keywordNo) {

    if(confirm("정말 삭제하시겠습니까?")){
        fetch("/notification/editKeyword/delete", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body:  JSON.stringify({"userNo" : userNo, "keywordNo" : keywordNo})
            })
            .then(response => response.text())
            .then(result => {

                if (result>0) {
                    document.getElementById('toastBody').innerText = "키워드가 삭제되었습니다.";
                    document.getElementById('liveToast').classList.add('text-bg-primary');
                    document.getElementById('liveToast').classList.remove('text-bg-danger');
                } else {
                    document.getElementById('toastBody').innerText = "키워드가 삭제에 실패하였습니다.";
                    document.getElementById('liveToast').classList.add('text-bg-danger');
                    document.getElementById('liveToast').classList.remove('text-bg-primary');
                }
            }
            ).catch(error => {
                console.log(error.message);
            });

        }
        
        toastTrigger.click();
        setTimeout(() => location.reload(), 1000);
}