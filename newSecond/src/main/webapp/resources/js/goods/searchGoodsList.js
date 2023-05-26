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

function callSortedGoods(obj, query){
    console.log(obj.value);
    fetch("/goods/search/sortGoodsList?listSort=" + obj.value + "&searchName=" + query)
    .then(resp => resp.json())
    .then(sortedGoodsList => {
        console.log(query);
        console.log(sortedGoodsList);
        const goodsListTable = document.getElementById("goodsListTable");

        if(sortedGoodsList.length>0){
            goodsListTable.innerHTML = "";

            for(let i=0; i<12; i++){
                
                const goodsDiv = document.createElement("div");
                goodsDiv.classList.add("goods");
                
                const aTag = document.createElement("a");
                aTag.setAttribute("href","/goods/"+sortedGoodsList[i].goodsNo);
                
                const img  = document.createElement("img");
                if(sortedGoodsList[i].thumbnail==null){
                    img.setAttribute("src","/resources/src/img/no_image.jpeg");
                }else{
                    img.setAttribute("src",sortedGoodsList[i].thumbnail);
                }

                aTag.append(img);
                
                const statusDiv = document.createElement("div");

                if(sortedGoodsList[i].goodsStatus=='E'){
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("soldout");
                    statusDiv.innerText = "Sold Out";
                }else if(sortedGoodsList[i].goodsStatus=='C'){
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("reserved");
                    statusDiv.innerText = "Reserved";
                }

                aTag.append(statusDiv);
                
                const priceDiv = document.createElement("div");
                priceDiv.classList.add("goods_price");
                priceDiv.innerHTML = sortedGoodsList[i].goodsPrice.toLocaleString('ko-KR');

                const titleDiv = document.createElement("div");
                titleDiv.classList.add("goods_title");
                titleDiv.innerHTML = sortedGoodsList[i].goodsTitle;
                
                aTag.append(priceDiv);
                aTag.append(titleDiv);

                goodsDiv.append(aTag);
                goodsListTable.append(goodsDiv);
            }

        }if(sortedGoodsList.length == 12 ){
            const moreButton = document.getElementById("viewMoreGoods");
            moreButton.style.display="none";
        };
    })
    .catch(err=>{
        const moreButton = document.getElementById("viewMoreGoods");
        moreButton.setAttribute("style","display:none");
    });

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

