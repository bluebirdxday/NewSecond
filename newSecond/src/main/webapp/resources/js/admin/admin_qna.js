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



function qnaSelectAll(checkbox) {
  var checkboxes = document.getElementsByClassName('admin_qna_checkbox');
  var count = 0;

  for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = checkbox.checked;
  }

  if (checkbox.checked) {
      count = checkboxes.length;
  }

  document.getElementById('checkboxCount').innerText = count;
}

function updateCheckboxCount() {
  var checkboxes = document.getElementsByClassName('admin_qna_checkbox');
  var count = 0;

  for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
          count++;
      }
  }

  document.getElementById('checkboxCount').innerText = count;
}

var checkboxElements = document.getElementsByClassName('admin_qna_checkbox');
for (var i = 0; i < checkboxElements.length; i++) {
  checkboxElements[i].addEventListener('change', updateCheckboxCount);
}
