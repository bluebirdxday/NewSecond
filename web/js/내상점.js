// 탭메뉴 클릭 이벤트
const tabList = document.querySelectorAll(".tabs li");
const contentList = document.querySelectorAll(".myshop--tab__content");

tabList.forEach(function(tab) {

    tab.addEventListener('click' , function(){

        var tab_id = tab.firstChild.getAttribute('rel');

        tabList.forEach(function(e){
            e.classList.remove('active');
        });

        contentList.forEach(function(e){
            e.classList.remove('active');
        });

        tab.classList.add('active');
        document.getElementById(`${tab_id}`).classList.add('active');
    });
});