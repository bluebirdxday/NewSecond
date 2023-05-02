// 탭메뉴 클릭 이벤트
const tabList = document.querySelectorAll(".tabs li");
const contentList = document.querySelectorAll(".myshop--tab__content");

tabList.forEach(function(tab) {

    tab.addEventListener("click" , function(){

        var tab_id = tab.firstChild.getAttribute('rel');

        tabList.forEach(e=>{
            e.classList.remove('tabs--active');
        });

        contentList.forEach(e=>{
            e.classList.remove('tabs--active');
        });

        tab.classList.add('tabs--active');
        document.getElementById(`${tab_id}`).classList.add('tabs--active');
    });
});


// 탭메뉴 중 상품 컨텐츠 리스트 정렬
const sortList = document.querySelectorAll(".myshop--tab1__content-top li");

sortList.forEach(function(sort){

    sort.addEventListener("click", function(){
        sortList.forEach(e=>{
            e.classList.remove('sort--active');
        });
        sort.classList.add('sort--active');
    });
});



// 내 상점 편집 팝업 열기
document.querySelector(".myshop--popup__show").addEventListener("click", ()=>{
    document.querySelector(".myshop--popup__background").className = "myshop--popup__background myshop--popup__show";
});

document.querySelector(".myshop--popup__btn-close").addEventListener("click", ()=>{
    document.querySelector(".myshop--popup__background").className = "myshop--popup__background";
});

document.querySelector(".myshop--popup__btn-save").addEventListener("click", ()=>{
    document.querySelector(".myshop--popup__background").className = "myshop--popup__background";
});


// 내상점 편집 팝업 이미지 
const realUpload = document.querySelector(".real-upload");
const upload = document.querySelector(".upload");

upload.addEventListener("click", ()=> realUpload.click());

realUpload.addEventListener("change", ()=>{
    const imageSrc = URL.createObjectURL(realUpload.files[0]);
    upload.src = imageSrc;
});