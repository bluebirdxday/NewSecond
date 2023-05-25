/* 전체 글자 수 count */
const countAll = document.querySelector('.admin_user_countAll');
const table = document.querySelector('.admin_user_table');
const tableCount = table.rows.length;

countAll.innerText = tableCount-1;


/* 강제 블락 */
/* const forcedBlock = document.getElementsByClassName('block');
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
} */

/* 강제 탈퇴 */
/* const forcedSignOut = document.getElementsByClassName('forcedsignOut');

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
 */

/* 체크박스 전체선택 */
function userSelectAll(userSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = userSelectAll.checked
    })
  }

/* 강제탈퇴를 눌렀을 때 상태가 탈퇴로 바뀌면서 탈퇴 하는 버튼  */

const forcedsignOut =  document.getElementsByClassName("forcedsignOut");
const states = document.getElementsByClassName("admin_user_states");
const signOutH = document.getElementsByClassName("signOutH");



for(let i=0; i<forcedsignOut.length; i++){
  forcedsignOut[i].addEventListener(('click'),()=>{

    if (confirm("정말 탈퇴 하시겠습니까?")) {

    if(states[i].innerText == '정상'){
    states[i].innerText = '탈퇴';
    forcedsignOut[i].style.display = "none";
    signOutH[i].style.display = "block";
    }
    else return;
  
/*     const forcedsignOut = document.getElementById("forcedsignOut"); */
/*     const signOutH = document.getElementById("signOutH"); */
    var signOutUserNo = document.getElementsByClassName("signOutUserNo")[i].value;
    
    if(forcedsignOut!=null){
      signOutUser(signOutUserNo);
    }
  }
  });

}

function signOutUser(userNo){

  console.log(userNo);

  fetch("/admin/admin_user/signOut", {
    method : "POST",
    headers : {"Content-Type": "application/json"},
    body : JSON.stringify({"userNo" : userNo})
  }).then(resp=> resp.text())
  .then(result=>{
    console.log(result);


  }).catch(err=> console.log(err));

}

/* 체크박스 전체선택 */
function userSelectAll(userSelectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = userSelectAll.checked
  })
}

/* 회원블락를 눌렀을 때 상태가 탈퇴로 바뀌면서 탈퇴 하는 버튼  */

const block =  document.getElementsByClassName("block");
const blockH = document.getElementsByClassName("blockH");


for(let i=0; i<block.length; i++){
  block[i].addEventListener(('click'),()=>{

  if (confirm("정말 블락 하시겠습니까?")) {

  if(states[i].innerText == '정상'){
  states[i].innerText = '블락';
  block[i].style.display = "none";
  blockH[i].style.display = "block";
  blockH[i].style.margin = "0px";

  }
  else return;

  var signOutUserNo = document.getElementsByClassName("signOutUserNo")[i].value;
  
  if(block!=null){
    signOutUser(signOutUserNo);
  }
}
});

}

function signOutUser(userNo){

console.log(userNo);

fetch("/admin/admin_user/block", {
  method : "POST",
  headers : {"Content-Type": "application/json"},
  body : JSON.stringify({"userNo" : userNo})
}).then(resp=> resp.text())
.then(result=>{
  console.log(result);


}).catch(err=> console.log(err));

}



for(let i=0; i<block.length; i++){
  blockH[i].addEventListener(('click'),()=>{

  if (confirm("블락해제 하시겠습니까?")) {

  if(states[i].innerText == '블락'){
  states[i].innerText = '정상';
  blockH[i].style.display = "none";
  block[i].style.display = "block";
  block[i].style.margin = "0px";

  }
  else return;

  var signOutUserNo = document.getElementsByClassName("signOutUserNo")[i].value;
  
  if(block!=null){
    signOutHUser(signOutUserNo);
  }
}
});

}

function signOutHUser(userNo){

console.log(userNo);

fetch("/admin/admin_user/blockH", {
  method : "POST",
  headers : {"Content-Type": "application/json"},
  body : JSON.stringify({"userNo" : userNo})
}).then(resp=> resp.text())
.then(result=>{
  console.log(result);


}).catch(err=> console.log(err));

}