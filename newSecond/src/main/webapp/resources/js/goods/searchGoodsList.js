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
    console.log(obj.value);
    fetch("/goods/search/goodsList/" + obj.value)
    .then(resp => resp.json())
    .then(sortedGoodsList => {
        clg(sortedGoodsList);
        clg("uu");
        if(sortedGoodsList.length>0){
            document.getElementById("goodsListTable").innerHTML = "";
            for(var i=0; i<12; i++){
                const goodsListTable = document.createElement("div");
                goodsListTable.classList.add("container--inner__middle");
                goodsListTable.setAttribute("id","goodsListTable");
                const goodsDiv = document.createElement("div");
                goodsDiv.classList.add("goods");
                goodsListTable.append(goodsDiv);
                
                const a = document.createElement("a");
                a.setAttribute("href","/goods/"+sortedGoodsList[i].goodsNo);
                
                const img  = document.createElement("img");
                if(sortedGoodsList[i].thumbnail== null){
                    img.setAttribute("src","/resources/src/img/no_image.jpeg");
                }else{
                    img.setAttribute("src",sortedGoodsList[i].thumbnail);
                }
                a.append(img);

                // console.log(sortedGoodsList[i].goodsStatus);

                if(sortedGoodsList[i].goodsStatus=='E'){
                    const statusDiv = document.createElement("div");
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("soldout");
                    statusDiv.innerText = "Sold Out";
                    a.append(statusDiv);
                }else if(sortedGoodsList[i].goodsStatus=='C'){
                    const statusDiv = document.createElement("div");
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("reserved");
                    statusDiv.innerText = "Reserved";
                    a.append(statusDiv);
                }
                
                const priceDiv = document.createElement("div");
                priceDiv.classList.add("goods_price");
                priceDiv.innerHTML = sortedGoodsList[i].goodsPrice.toLocaleString('ko-KR');
                const titleDiv = document.createElement("div");
                titleDiv.classList.add("goods_title");
                titleDiv.innerHTML = sortedGoodsList[i].goodsTitle;
                
                a.append(priceDiv);
                a.append(titleDiv);

                goodsDiv.append(a);
                document.getElementById("goodsListTable").append(goods);
            }
        }if(moreGoodsList.length == 12 ){
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

