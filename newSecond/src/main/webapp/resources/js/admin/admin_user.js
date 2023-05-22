/* 전체 글자 수 count */
const countAll = document.querySelector('.admin_user_countAll');
const table = document.querySelector('.admin_user_table');
const tableCount = table.rows.length;

countAll.innerText = tableCount-1;


/* 강제 블락 */
const forcedBlock = document.getElementsByClassName('block');
const nameOfStates = document.querySelectorAll('.admin_user_states');

for(let i=0; i<forcedBlock.length;i++){
    forcedBlock[i].addEventListener('click',()=>{
        if(nameOfStates[i].innerText !== '블락'){
            forcedBlock[i].innerText = '블락해제';
            nameOfStates[i].innerText = '블락' ;
        }else{
            forcedBlock[i].innerText = '회원블락';
            nameOfStates[i].innerText = '정상';   
        }
    });  
}

/* 강제 탈퇴 */
const forcedSignOut = document.getElementsByClassName('signOut');

for(let i=0; i<forcedSignOut.length;i++){
    forcedSignOut[i].addEventListener('click',()=>{
        if(nameOfStates[i].innerText == '정상' || nameOfStates[i].innerText == '블락'){
            forcedSignOut[i].innerText = '강제탙퇴';
            nameOfStates[i].innerText = '탈퇴' ;
        }else if(nameOfStates[i].innerText == '탈퇴'){
            forcedSignOut[i].innerText = '탈퇴해제';
            nameOfStates[i].innerText = '정상';   
        }
    });  
}


/* 체크박스 전체선택 */
function userSelectAll(userSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = userSelectAll.checked
    })
  }



 document.getElementById("block").addEventListener("click", function() {
    var checkboxes = document.getElementsByClassName("admin_notice_checkbox");
    var checkboxesNo = document.getElementsByClassName("admin_notice_checkbox_no")
    var selectedItems = [];
    var noticeUpdateFrm = document.getElementById("noticeUpdateFrm");
  
    
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        selectedItems.push(checkboxesNo[i].innerText);
      }
    }
    if(states == '블락'){
      fetch("/admin_user/signOut", {
        method : "POST",
        headers : {"Content-Type": "application/JSON"},
        body : JSON.stringify(selectedItems)
      }).then(resp=> resp.text())
      .then(result=>{
  
      }).catch(err=> console.log(err));
      
    }
    
    }); 