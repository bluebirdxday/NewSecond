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


trade.addEventListener(('click'),function boxChecked(){

    var trade = document. getElementById ( "trade" ) ;
     if (trade.checked) {

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



// Get the radio buttons and attach an event listener to them
const radioButtons = document.getElementsByName('admin_qna_raidos');
radioButtons.forEach(function(radioButton) {
  radioButton.addEventListener('change', filterPosts);
});

// Function to filter and show posts based on the selected radio button
function filterPosts() {
  const selectedValue = document.querySelector('input[name="admin_qna_raidos"]:checked').value;
  const posts =document.querySelectorAll(".admin_qna_tableWrap");

  // Loop through all the posts and show/hide them based on the selected radio button
  for (let i = 0; i < posts.length; i++) {
    const post = posts[i];
    const status = post.getAttribute('data-status');

    if (selectedValue === 'all' || selectedValue === status) {
      post.style.display = 'block'; // Show the post
    } else {
      post.style.display = 'none'; // Hide the post
    }
  }
}


