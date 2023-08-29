
/* 희진 : 알림 아이콘 */
const newNotification = document.querySelector(".notification-dot");
const notificationIcon = document.querySelector("#notification>.notifications");

if(notificationCount>0){
    newNotification.style.display = 'block';
}else
    newNotification.style.display = 'none';

/* 희진 : 실시간 알림 */
let notificationSock2 = new SockJS("/notificationSock");

notificationSock2.onmessage = function(e) {
    // 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 msg 변수에 저장.
    const msg = JSON.parse(e.data);

    let liveMessage;

    // 팔로우 알림, 관심상품 등록 알림
    if(msg.notificationType=="F" || msg.notificationType=="L"){
        liveMessage = msg.shopTitle + msg.notificationMessage;
        document.getElementById('alarmBody').innerText = liveMessage;
    }

    // 키워드 알림
    if(msg.notificationType=="K"){
        const words = msg.notificationMessage.split('^^');
/*         liveMessage = "<strong>[" + words[0] +"]</strong>   " +  words[1] +  "<br/> 설정하신 키워드의 새로운 글이 게시되었습니다.";
        document.getElementById('alarmBody').innerHTML = liveMessage; */
        liveMessage = "[" + words[0] +"]     " +  words[1] +  "\n설정하신 키워드의 새로운 글이 게시되었습니다.";
        document.getElementById('alarmBody').innerText= liveMessage;
    }

    
    // 새글 작성 알림
    if(msg.notificationType=="N"){
        const words = msg.notificationMessage.split('^^');
        liveMessage = "[" + words[0] +"]     " +  "\n" +  msg.shopTitle + words[1] ;
        document.getElementById('alarmBody').innerText= liveMessage;
    }
    

    // 후기 작성 알림
    if(msg.notificationType=="P"){
        const words = msg.notificationMessage.split('^^');
        liveMessage = "[" + words[0] +"]     " +  "\n" + words[1] ;
        document.getElementById('alarmBody').innerText= liveMessage;
    }

    newNotification.style.display = 'block';
    alarmTrigger.click();
}


/* 알림 아이콘 클릭 시 */
notificationIcon.addEventListener("click", ()=>{
    newNotification.style.display = 'none';
});