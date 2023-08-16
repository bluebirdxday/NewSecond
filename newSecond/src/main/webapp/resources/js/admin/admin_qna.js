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

// 체크박스가 체크되었는지 확인하는 함수
    function boxChecked ( ) {
      var trade = document. getElementById ( "trade" ) ;
       // 체크박스가 체크되어 있는 경우
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
    // selectQnaList 함수 정의
    selectQnaList(result)
       // selectQnaList 함수 정의
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

    const qnaTable = document.querySelector(".admin_qna_tableWrap");
    qnaTable.style.display="none";
  
  


}).catch(err=> console.log(err));

} } );



// 라디오 버튼 가져오기 및 이벤트 리스너 연결
const radioButtons = document.getElementsByName('admin_qna_raidos');
radioButtons.forEach(function(radioButton) {
  radioButton.addEventListener('change', filterPosts);
});

// 선택한 라디오 버튼을 기준으로 게시물을 필터링하여 보여주는 기능
function filterPosts() {
  const selectedValue = document.querySelector('input[name="admin_qna_raidos"]:checked').value;
  const posts =document.querySelectorAll(".admin_qna_tableWrap");

  //모든 게시물을 반복하고 선택한 라디오 버튼을 기준으로 표시/숨기기
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

