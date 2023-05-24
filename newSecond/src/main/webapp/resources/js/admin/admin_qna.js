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

      const qnaTable = document.getElementsByClassName("admin_qna_tableWrap");
      qnaTable = "";
    
    


  }).catch(err=> console.log(err));

} } });



