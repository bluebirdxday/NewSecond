/* 체크박스 전체 선택 */
function boardSelectAll(boardSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = boardSelectAll.checked
    })
  }


/* 선택 블라인드 */
  // 이름이 'checkboxA'인 모든 체크박스 가져오기
  const checkboxA = document.getElementsByClassName("admin_board_checkbox");
  const checkboxNo = document.getElementsByClassName("admin_board_checkbox_no");
  const hiddenBtn = document.getElementById("hiddenBtn");

  
  hiddenBtn.addEventListener(('click'),()=>{

    if (confirm("정말 블라인드 하시겠습니까?")) {
      for(let i=0; i<checkboxA.length; i++){
        if (checkboxA[i].checked) {
     var boardNo = document.getElementsByClassName("admin_board_checkbox_no")[i].innerText
    
 } if(checkboxA!=null){
  boardBlind(boardNo);
}
  }
}else return;

  });

  function boardBlind(boardNo){

    console.log(boardNo);
  
    fetch("/admin/admin_board/blind", {
      method : "POST",
      headers : {"Content-Type": "application/json"},
      body : JSON.stringify({"goodsNo" : boardNo})
    }).then(resp=> resp.text())
    .then(result=>{
      console.log(result);
  
  
    }).catch(err=> console.log(err));
  
  }

  /* 선택 삭제 */

  const delBtn = document.getElementById("delBtn");

  delBtn.addEventListener(('click'),()=>{

    
  if (confirm("정말 삭제 하시겠습니까?")) {
    for(let i=0; i<checkboxA.length; i++){
      if (checkboxA[i].checked) { //체크박스가 체크되었을 때
   var boardNo = document.getElementsByClassName("admin_board_checkbox_no")[i].innerText
  
} if(checkboxA!=null){ //CheckboxA가 null일 때
boardDelete(boardNo);
}
}
}else return;

});

function boardDelete(boardNo){

  

  fetch("/admin/admin_board/delete", {
    method : "POST", //POST 요청
    headers : {"Content-Type": "application/json"},
    body : JSON.stringify({"goodsNo" : boardNo})
  }).then(resp=> resp.text())
  .then(result=>{
    console.log(result);
    console.log(boardNo);

  }).catch(err=> console.log(err));

}