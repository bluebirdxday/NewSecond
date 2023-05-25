
/* --------- 내정보 수정 파트 -------*/

//닉네임 수정
document.getElementById("nicknameCheck").addEventListener("submit", e => {

    const userNickname = document.getElementById("userNickname");
    const tooltip = bootstrap.Tooltip.getInstance(userNickname);
    const regEx = /^[가-힣\w\d]{2,10}$/;

    if(!regEx.test(userNickname.value)){ // 유효성 검사 맞지 않으면
        tooltip.setContent({'.tooltip-inner': '닉네임 형태가 맞지 않습니다. <br> 한글,영어,숫자조합의 2~10글자를 입력해주세요'});
        userNickname.focus(); 
        e.preventDefault();
        return;
    }
    
});

//전화번호 수정
document.getElementById("TelCheck").addEventListener("submit", e => {

    const userTel = document.getElementById("userTel");
    const tooltip = bootstrap.Tooltip.getInstance(userTel);
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;

    if(!regEx.test(userTel.value)){ // 유효성 검사 맞지 않으면
        tooltip.setContent({'.tooltip-inner': '전화번호 형식이 유효하지 않습니다. 다시 입력해주세요'});
        userTel.focus(); 
        e.preventDefault();
        return;
    }

});

const userSearch = document.getElementById("addressSearch");
const userAddressPostcode = document.getElementById("userAddress_postcode");
const addressMessasge =document.getElementById("addressMessage");
const valueRecognizer = document.getElementById("valueRecognizer")

userSearch.addEventListener("click", () =>{
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            document.getElementById('userAddress_postcode').value = data.zonecode;
            document.getElementById("userAddress_address").value = addr;

            document.getElementById("userAddress_detailAddress").focus();

            valueRecognizer.click();
        }
    }).open();

})



/* ----------------------------------*/

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