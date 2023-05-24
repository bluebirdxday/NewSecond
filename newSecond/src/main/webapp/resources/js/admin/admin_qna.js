/* 전체 글자 수 count */
const countAll = document.querySelector('.admin_qna_countAll');
const table = document.querySelector('.admin_qna_table');
const tableCount = table.rows.length;

countAll.innerText = tableCount-1;

/* 체크박스 전체선택 */
function qnaSelectAll(qnaSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = qnaSelectAll.checked
    })
  }


  const trade = document.getElementById("trade");

  trade.addEventListener(('click'),()=>{
  

  boxChecked();

    function boxChecked ( ) {
      var trade = document. getElementById ( "trade" ) ;
       if ( trade.checked == true ) {

const qnaCategory =  trade.value;

  fetch("/admin/admin_qna/radioTrade", {
    method : "POST",
    headers : {"Content-Type": "application/json"},
    body : JSON.stringify({"qnaCategory" : qnaCategory})
  }).then(resp=> resp.text())
  .then(result=>{
    console.log(result);
    console.log(qnaCategory);

    selectQnaList(result)

    function selectQnaList(result)

      const qnaTable = document.querySelectorAll(".admin_qna_tableWrap");
      qnaTable.style.display="none";
    
    


  }).catch(err=> console.log(err));

} } });



/* 테스트 */
const trade = document.getElementById("trade");

trade.addEventListener(('click'),()=>{


boxChecked();

  function boxChecked ( ) {
    var trade = document. getElementById ( "trade" ) ;
     if ( trade.checked == true ) {

const qnaCategory =  trade.value;

fetch("/admin/admin_qna/radioTrade", {
  method : "POST",
  headers : {"Content-Type": "application/json"},
  body : JSON.stringify({"qnaCategory" : qnaCategory})
}).then(resp=> resp.text())
.then(result=>{
  console.log(result);
  console.log(qnaCategory);

  selectQnaList(result)

  function selectQnaList(result)

    const qnaTable = document.querySelectorAll(".admin_qna_tableWrap");
    qnaTable.style.display="none";
  
  


}).catch(err=> console.log(err));

} } });

function myFunc() {

  const radio = document.getElementsByClassName("admin_qna_raidos")
  var str = "";

  for(var i=0; i<cardLen; i++) {
    if(myform.card[i].checked) {
      str += myform.card[i].value + "/";
    }
  }
  document.getElementById("demo").innerHTML = str;
}
function cardCheck(sel) {
  if(sel.checked) {
    alert("선택한 카드는? " + sel.value);
  }
  else {
    alert(sel.value + " 선택을 해제하셨군요..")
  }
}