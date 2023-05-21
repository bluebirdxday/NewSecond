

// 비밀번호 변경 
const changePwFrm = document.getElementById("changePwFrm");
const currentPw = document.getElementById("userPassword");
const newPw = document.getElementById("newUserPassword");
const newPwConfirm = document.getElementById("newUserPasswordConfirm");

if(changePwFrm != null){ // 비밀번호 변경 페이지인 경우

    changePwFrm.addEventListener("submit", e => {

        // 현재 비밀번호 미작성 시
        if(currentPw.value.trim() == "") {
            alert("현재 비밀번호를 입력해주세요");   
            e.preventDefault();
            currentPw.focus();
            return;
        }

        // 비밀번호 유효성 검사
        const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
        
        if(!regEx.test(newPw.value)){ // 무효
            alert("비밀번호가 유효하지 않습니다");  
            e.preventDefault();
            newPw.focus();
            return;
        }
    
        // 비밀번호 == 비밀번호 확인
        if(newPw.value != newPwConfirm.value){ // 유효
            alert("비밀번호가 일치하지 않습니다");
            e.preventDefault();
            newPwConfirm.focus();
            return;
        }


    })

}



// 회원 탈퇴
const secessionFrm = document.getElementById("secessionFrm");

if(secessionFrm != null){ // 탈퇴 페이지인 경우

    const userPassword = document.getElementById("userPassword");
    const agree = document.getElementById("agree");

    secessionFrm.addEventListener("submit", e => {
    
        if(userPassword.value.trim() == ""){ // 비밀번호 미작성
            alert("비밀번호를 작성해주세요");
            e.preventDefault();
            userPassword.focus();
            return;
        }
        
        if(!agree.checked){ // 동의 체크가 되지 않은 경우
            alert("약관 동의 후 탈퇴 버튼을 눌러주세요");
            e.preventDefault();
            agree.focus();
            return;
        }

        if(!confirm("정말 탈퇴 하시겠습니까?")){ // 취소 클릭 시
            alert("탈퇴 취소");
            e.preventDefault();
            return;
        }


    });


}