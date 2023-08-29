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


        /* 키워드 알림 읽음 처리 */
        if(tab_id=='tab2'){
            
            fetch('/notification/updateKeywordReadOrNot', {
                method : "POST",
                headers : {"Content-Type" : "application/json"}
            })
            .then(resp=>resp.text())
            .then(result=>{

                if(result>0)
                    console.log("키워드 알림 읽음 처리 완료");
                
            })
            .catch(err=>console.log(err))
        }


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
// window.addEventListener('unload', function() {
//     // inquireNotiSocket.close();
//     // 현재 페이지에 존재하는 리스트 전달 후 readOrNot = "Y"로 update
//     const userNo = document.getElementById("notiUserNo");

//     fetch('/notification/updateReadOrNot' ,{
//         method : "POST",
//         headers : {"Content-Type" : "application/json"},
//         body : userNo
//     })
//     .then(resp=>resp.text())
//     .then((result)=>{

//     })
//     .catch(err=>{
//         console.log(err);
//     })

// });
