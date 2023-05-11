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

    // 글자수 입력
    document.getElementById("myshopEditInput").innerText = document.querySelector(".myshop--popup__input-edit").value.length;
    document.getElementById("myshopEditTextArea").innerText = document.querySelector(".myshop--popup__textarea-edit").value.length;
    
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


// 내상점 팝업 편집 글자수 세기
const inputCount = document.getElementById("myshopEditInput");
const textAreaCount = document.getElementById("myshopEditTextArea");

document.querySelector(".myshop--popup__input-edit").addEventListener("input", e=>{
    inputCount.innerText = e.target.value.length;

    if(e.target.value.length>=20 || e.target.value.length<=2){
        inputCount.classList.add("myshop--edit__error");
    }else{ 
        inputCount.classList.remove("myshop--edit__error");
    }
});

document.querySelector(".myshop--popup__textarea-edit").addEventListener("input", e=>{
    textAreaCount.innerText = e.target.value.length;

    if(e.target.value.length>=50){
        textAreaCount.classList.add("myshop--edit__error");
    }else{ 
        textAreaCount.classList.remove("myshop--edit__error");
    }
});