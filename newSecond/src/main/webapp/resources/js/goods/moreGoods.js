// MORE 버튼 눌렀을 때 12개씩 상품 더 보이도록
// 상품 12배수 초과하지 않을 때 더보기 버튼 안보이도록

const more = document.getElementById("viewMoreGoods");
const goodsListTable = document.getElementById("goodsListTable");

more.addEventListener("click", e => {
    // radio
    const sorts = document.getElementsByName("listSort");
    for (var i = 0; i < sorts.length; i++) {
        if (sorts[i].checked) {
        var sort = sorts[i].value;
        console.log("Selected Value: " + sort);
        break;
        }
    }
    const addGoodsDiv = "";
    const startCallNum = goodsListTable.childElementCount;

    // const untilNum = startCallNum + 11; 몇번까지 (more버튼 구현 위해 startNum~끝까지 조회)
    // 제출된 검색어
    const searchName = new URL(location.href).searchParams.get("query");

    const data = {"startCallNum" : startCallNum, "searchName" : searchName, "sort" : sort};

    fetch("/goods/searchMore",{
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.json())
    .then(moreGoodsList => {
        if(moreGoodsList.length>0){
            for(var i=0; i<12; i++){
                const goodsDiv = document.createElement("div");
                goodsDiv.classList.add("goods");
                goodsListTable.append(goodsDiv);
                
                const a = document.createElement("a");
                a.setAttribute("href","/goods/"+moreGoodsList[i].goodsNo);
                
                const img  = document.createElement("img");
                if(moreGoodsList[i].thumbnail== null){
                    img.setAttribute("src","/resources/src/img/no_image.jpeg");
                }else{
                    img.setAttribute("src",moreGoodsList[i].thumbnail);
                }
                a.append(img);

                if(moreGoodsList[i].goodsStatus=='E'){
                    const statusDiv = document.createElement("div");
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("soldout");
                    statusDiv.innerText = "Sold Out";
                    a.append(statusDiv);
                }else if(moreGoodsList[i].goodsStatus=='C'){
                    const statusDiv = document.createElement("div");
                    statusDiv.classList.add("status");
                    statusDiv.classList.add("reserved");
                    statusDiv.innerText = "Reserved";
                    a.append(statusDiv);
                }
                const priceDiv = document.createElement("div");
                priceDiv.classList.add("goods_price");
                priceDiv.innerHTML = moreGoodsList[i].goodsPrice.toLocaleString('ko-KR');
                const titleDiv = document.createElement("div");
                titleDiv.classList.add("goods_title");
                titleDiv.innerHTML = moreGoodsList[i].goodsTitle;
                
                a.append(priceDiv);
                a.append(titleDiv);

                goodsDiv.append(a);
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

});