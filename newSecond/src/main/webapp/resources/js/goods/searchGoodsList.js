// 검색어 입력 안하고 제출
const searchForm = document.getElementById("searchForm");
searchForm.addEventListener("submit",e=>{
    if(searchQuery.value.trim().length==0){
        e.preventDefault();
        document.getElementById('toastBody').innerText = "검색어를 입력해주세요!";
        document.getElementById('liveToast').classList.add('text-bg-danger');
        toastTrigger.click();
    }
});

// 검색어 유지
const searchQuery = document.getElementById("searchQuery");

(()=>{
    const params = new URL(location.href).searchParams;
    const query = params.get("query");
    if(query != "") searchQuery.value = query;
    if
})();



// // MORE 버튼 눌렀을 때 12개씩 상품 더 보이도록
// // 상품 12배수 초과하지 않을 때 더보기 버튼 안보이도록

// const more = document.getElementById("viewMoreGoods");
// const goodsTable = document.getElementById("goodsListTable");

// more.addEventListener("click", e => {
//     const addListHtml = "";
//     const startCallNum = goodsTable.childElementCount;
//     // 제출된 검색어
//     const searchName = new URL(location.href).searchParams.get("query");

//     const data = {"startCallNum" : startCallNum, "searchName" : searchName};

//     fetch("/goods/searchMore",{
//         method : "POST",
//         headers : {"Content-Type" : "application/json"},
//         body : JSON.stringify(data)
//     })
//     .then(resp => resp.json())
//     .then(moreGoodsList => {
//         for(var goods of moreGoodsList){
//             const p = 
//         }
//     })
//     .catch(err => console.log(err));

// });