
/* 희진 : 알림 */
let notificationSock2 = new SockJS("/notificationSock");

notificationSock2.onmessage = function(e) {
    // 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
    const msg = JSON.parse(e.data);

    console.log(msg);

    const followMsg = msg.shopTitle + msg.notificationMessage;

    document.getElementById('alarmBody').innerText = followMsg;
    alarmTrigger.click();
}