



/* 회원 탈퇴 */
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