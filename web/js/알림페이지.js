// 탭메뉴 클릭 이벤트
const tabList = document.querySelectorAll(".notice--tabs li");
const contentList = document.querySelectorAll(".notice--tab__content");

tabList.forEach(function(tab) {

    tab.addEventListener("click" , function(){

        var tab_id = tab.firstChild.getAttribute('rel');

        tabList.forEach(e=>{
            e.classList.remove('notice--tabs__active');
        });

        contentList.forEach(e=>{
            e.classList.remove('notice--tabs__active');
        });

        tab.classList.add('notice--tabs__active');
        document.getElementById(`${tab_id}`).classList.add('notice--tabs__active');
    });
});