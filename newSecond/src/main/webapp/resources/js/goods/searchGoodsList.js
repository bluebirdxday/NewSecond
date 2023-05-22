// 검색어 입력 안하고 제출
const searchForm = document.getElementById("searchForm");
const searchQuery = document.getElementById("searchQuery");
// const 
searchForm.addEventListener("submit",e=>{
    if(searchQuery.value.trim().length==0){
        e.preventDefault();
        document.getElementById('toastBody').innerText = "검색어를 입력해주세요!";
        document.getElementById('liveToast').classList.add('text-bg-danger');
        toastTrigger.click();
    }
});

// 검색어 유지

(()=>{
    const params = new URL(location.href).searchParams;
    const query = params.get("query");
    if(query != "" && 
    (location.pathname == "/goods/search/goodsList"))
    searchQuery.value = query;
})();

