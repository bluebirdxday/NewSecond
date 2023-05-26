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


// let inquireNotiSocket;

// 페이지가 로드되면
window.addEventListener('DOMContentLoaded', function()
{
    // inquireNotiSocket = new SockJS("/inquireNotificationSock"); 

    // inquireNotiSocket.onmessage = function(e) {
        
    //     const notification = JSON.parse(e.data);

    //     console.log(notification);
    // };
});


// 페이지 이동이 일어났을 때
window.addEventListener('unload', function() {
    // inquireNotiSocket.close();
    // 현재 페이지에 존재하는 리스트 전달 후 readOrNot = "Y"로 update

    fetch('/notification/updateReadOrNot')

});
