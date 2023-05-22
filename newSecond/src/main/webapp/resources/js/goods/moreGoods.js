// MORE 버튼 눌렀을 때 12개씩 상품 더 보이도록
// 상품 12배수 초과하지 않을 때 더보기 버튼 안보이도록

const more = document.getElementById("viewMoreGoods");
const goodsListTable = document.getElementById("goodsListTable");

more.addEventListener("click", e => {
    const addGoodsDiv = "";
    const startCallNum = goodsListTable.childElementCount;
    // const untilNum = startCallNum + 11; 몇번까지 (more버튼 구현 위해 startNum~끝까지 조회)
    // 제출된 검색어
    const searchName = new URL(location.href).searchParams.get("query");

    const data = {"startCallNum" : startCallNum, "searchName" : searchName};

    fetch("/goods/searchMore",{
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.json())
    .then(moreGoodsList => {
        if(moreGoodsList.length>0){
            // console.log(moreGoodsList.length);
            for(var i=0; i<moreGoodsList.length; i++){
                const goodsDiv = document.createElement("div");
                goodsDiv.classList.add("goods");
                
                const a = document.createElement("a");
                a.setAttribute("href",`/goods/${moreGoodsList[i].goodsNo}`);
                // goodsDiv.append(a);
                
                const img  = document.createElement("img");
                if(!`${moreGoodsList[i].thumbnail}`){
                    img.setAttribute("src","/resources/src/img/no_image.jpeg");
                }else{
                    img.setAttribute("src",`${moreGoodsList[i].thumbnail}`);
                }
                
                const priceDiv = document.createElement("div");
                priceDiv.classList.add("goods_price");
                priceDiv.innerHTML = `${moreGoodsList[i].goodsPrice.toLocaleString('ko-KR')}`;
                const titleDiv = document.createElement("div");
                titleDiv.classList.add("goods_title");
                titleDiv.innerHTML = `${moreGoodsList[i].goodsTitle}`;
                
                goodsListTable.append(goodsDiv);
                
                a.append(img);
                a.append(priceDiv);
                a.append(titleDiv);

                goodsDiv.append(a);
            }

        }else{
            // 오류 없으면 수정
            alert("없으면 안되는데,,? more버튼이 안보였을텐데..?");
        }

        if(moreGoodsList.length<=12){
            const moreButton = document.getElementById("viewMoreGoods");
            moreButton.setAttribute("style","display:none");
        }
    })
    .catch(err=>console.log(err));

});