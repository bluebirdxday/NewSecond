// 검색어 입력 안하고 제출
const searchForm = document.getElementById("searchForm");
const searchQuery = document.getElementById("searchQuery");
// const 
if(searchForm!=null){
    searchForm.addEventListener("submit",e=>{
        if(searchQuery.value.trim().length==0){
            e.preventDefault();
            document.getElementById('toastBody').innerText = "검색어를 입력해주세요!";
            document.getElementById('liveToast').classList.add('text-bg-danger');
            toastTrigger.click();
        }
    });

}

// 검색어 유지
(()=>{
    const params = new URL(location.href).searchParams;
    const query = params.get("query");
    const regEx = /\/goods\/search\/goodsList+/; // 주소 ~goodsList까지 포함

    if(query != "" && regEx.test(location.pathname)) searchQuery.value = query;
})();

// 기능별 조회 (최신순/낮은가격순/높은가격순/인기순)
const listsortList = document.getElementsByName("listSort");

function callSortedGoods(obj){
    // console.log(obj.value);
    fetch("/goods/search/goodsList?listSort" + obj.value)
    .then(resp=>resp.json())
    .then(sortedGoodsList => {
        if(sortedGoodsList.length>0){
            searchGoodsList = sortedGoodsList;
        }else{
            // 오류 없으면 수정
            document.getElementById('toastBody').innerText = "상품 정렬에 실패했습니다ㅠㅠ";
            document.getElementById('liveToast').classList.add('text-bg-danger');
            toastTrigger.click();
        }
    })
    .catch(err=>console.log(err));
}




// 판매 완료 상품 제외 비동기
// searchGoodsList 불러온 상품 리스트

// const soldoutCheck = document.getElementById("check1")
// function soldoutCheck{
//     if(soldoutCheck.checked==true){
//         //비동기로 상품 상태 'a','c'인것만 조회
//         for(var i=0; i<searchGoodsList.length; i++){

//         }
//     }



// }

