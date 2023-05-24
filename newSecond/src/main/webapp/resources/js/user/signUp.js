
const checkObj = {
    "userEmail" : false,
    "userPassword" : false,
    "userPasswordConfirm" : false,
    "userNickname" : false,
    "userTel" : false,
    "userAddress" : false
};


const userEmail = document.getElementById("userEmail");
const emailMessage = document.getElementById("emailMessage");
/* const tooltipInstance = bootstrap.Tooltip.getInstance(userEmail); */


userEmail.addEventListener("input", () => {
    
    if(userEmail.value.trim().length == 0){
        userEmail.value = "";
        /* const tooltip = bootstrap.Tooltip.getInstance(userEmail)
        tooltip.setContent({'.tooltip-inner': '메일을 받을 수 있는 이메일을 입력해주세요.'}); */

        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
        
        emailMessage.classList.remove("confirm", "error");
        
        checkObj.userEmail = false;
        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(   regEx.test(userEmail.value)   ){ 

        fetch('/dupCheck/email?email=' + userEmail.value)

        .then(response => response.text()) 

        .then(count => {

            if(count == 0){
                /* const tooltip = bootstrap.Tooltip.getInstance(userEmail)
                tooltip.setContent({'.tooltip-inner': '<span class="confirm">사용 가능한 이메일 입니다.</span>'}); */
                emailMessage.innerText = "사용 가능한 이메일 입니다";
                emailMessage.classList.add("confirm"); 
                emailMessage.classList.remove("error"); 

                checkObj.userEmail = true; 
            } else{
                /* const tooltip = bootstrap.Tooltip.getInstance(userEmail)
                tooltip.setContent({'.tooltip-inner': '<span class="error">이미 사용 중인 이메일 입니다.</span>'}); */
                emailMessage.innerText = "이미 사용 중인 이메일 입니다";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                checkObj.userEmail = false;
                
            }

        })

        .catch(err => console.log(err));
        
        
    } else{ 
        /* const tooltip = bootstrap.Tooltip.getInstance(userEmail);
        tooltip.setContent({'.tooltip-inner': '<span class="error">이메일 형식이 유효하지 않습니다.</span>'}); */
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다";
        emailMessage.classList.add("error"); 
        emailMessage.classList.remove("confirm"); 
        
        checkObj.userEmail = false; 
        
    }

});



const userPassword = document.getElementById("userPassword");
const userPasswordConfirm = document.getElementById("userPasswordConfirm");
const passwordMessage = document.getElementById("passwordMessage");

userPassword.addEventListener("input", () => {

    if(userPassword.value.trim().length == 0){
        userPassword.value = ""; 

        /* const tooltip = bootstrap.Tooltip.getInstance(userPassword)
        tooltip.setContent({'.tooltip-inner': '영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.'}); */


        passwordMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
        passwordMessage.classList.remove("confirm", "error"); 

        checkObj.userPassword = false;  
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
    
    if(regEx.test(userPassword.value)){

        checkObj.userPassword = true;

        if(userPasswordConfirm.value.trim().length == 0) {

            /* const tooltip = bootstrap.Tooltip.getInstance(userPassword)
            tooltip.setContent({'.tooltip-inner': '<span class="confirm">유효한 비밀번호 형식입니다.</span>'}); */

            passwordMessage.innerText = "유효한 비밀번호 형식입니다."
            passwordMessage.classList.add("confirm");
            passwordMessage.classList.remove("error");

        }else{

            if(userPassword.value == userPwConfirm.value) {


                passwordMessage.innerText = "비밀번호가 일치합니다";
                passwordMessage.classList.add("confirm");
                passwordMessage.classList.remove("error");


                checkObj.userPasswordConfirm = true;
                
                
            } else { 

                passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
                passwordMessage.classList.add("error");
                passwordMessage.classList.remove("confirm");

                checkObj.userPasswordConfirm = false;
            
            }
        }
        
    } else{ 
        
        /* const tooltip = bootstrap.Tooltip.getInstance(userPasswordConfirm)
        tooltip.setContent({'.tooltip-inner': '<span class="error">비밀번호가 일치하지 않습니다.</span>'}); */
        passwordMessage.innerText = "비밀번호 형식이 유효하지 않습니다"
        passwordMessage.classList.add("error");
        passwordMessage.classList.remove("confirm");

        checkObj.userPassword = false;

    }

});


userPasswordConfirm.addEventListener('input', () => {

    if(checkObj.userPassword){

        if(userPassword.value == userPasswordConfirm.value) {

            /* const tooltip = bootstrap.Tooltip.getInstance(userPasswordConfirm)
            tooltip.setContent({'.tooltip-inner': '<span class="confirm">비밀번호가 일치합니다.</span>'}); */

            passwordMessage.innerText = "비밀번호가 일치합니다";
            passwordMessage.classList.add("confirm");
            passwordMessage.classList.remove("error");
            checkObj.userPasswordConfirm = true;
            
            
        } else {

            /* const tooltip = bootstrap.Tooltip.getInstance(userPasswordConfirm)
            tooltip.setContent({'.tooltip-inner': '<span class="error">비밀번호가 일치하지 않습니다.</span>'}); */

            passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
            passwordMessage.classList.add("error");
            passwordMessage.classList.remove("confirm");
            checkObj.userPasswordConfirm = false;
            
        }

    } else{ 
        checkObj.userPasswordConfirm = false;
    }


});




const userNickname = document.getElementById("userNickname");
const nickMessage = document.getElementById('nickMessage');

userNickname.addEventListener("input", () => {
    
    if(userNickname.value.trim() == ""){

        /* const tooltip = bootstrap.Tooltip.getInstance(userNickname)
        tooltip.setContent({'.tooltip-inner': '<span>한글,영어,숫자로만 2~10글자.</span>'}); */
        nickMessage.innerText = "한글,영어,숫자로만 2~10글자";
        nickMessage.classList.remove("confirm", "error");

        checkObj.userNickname = false;
        userNickname.value="";    
        return;
    }

    // 정규표현식으로 유효성 검사
    const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(userNickname.value)){ // 유효

        fetch("/dupCheck/nickname?nickname="+userNickname.value)
        .then(resp => resp.text())  // 응답 객체를 text로 파싱(변환)
        .then(count => {
            if(count == 0){ // 중복 아닌 경우
                /* const tooltip = bootstrap.Tooltip.getInstance(userNickname)
                tooltip.setContent({'.tooltip-inner': '<span class="confirm">사용 가능한 닉네임 입니다.</span>'}); */
                nickMessage.innerText = "사용 가능한 닉네임 입니다";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.userNickname = true; 
                
                
            }else{ // 중복인 경우

                /* const tooltip = bootstrap.Tooltip.getInstance(userNickname)
                tooltip.setContent({'.tooltip-inner': '<span class="error">이미 사용중인 닉네임 입니다.</span>'}); */

                nickMessage.innerText = "이미 사용중인 닉네임 입니다";
                nickMessage.classList.add("error");
                nickMessage.classList.remove("confirm");
                checkObj.userNickname = false;


            }

        })
        .catch(err => console.log(err));

        
    } else{ // 무효
        /* const tooltip = bootstrap.Tooltip.getInstance(userNickname)
        tooltip.setContent({'.tooltip-inner': '<span class="error">닉네임 형식이 유효하지 않습니다.</span>'}); */

        nickMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        checkObj.userNickname = false;


    }


});



const userTel = document.getElementById("userTel");
const telMessage = document.getElementById("telMessage");

// 전화번호가 입력되었을 때
userTel.addEventListener("input", () => {

        // 전화번호에 입력이 되지 않은 경우
        if(userTel.value.trim() == ""){

            /* const tooltip = bootstrap.Tooltip.getInstance(userTel)
            tooltip.setContent({'.tooltip-inner': '<span class="error">전화번호를 입력해주세요.(- 제외)</span>'}); */

            telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
            telMessage.classList.remove("confirm", "error");

            checkObj.userTel = false;
            userTel.value="";    
            return;
        }
    
        // 정규표현식으로 유효성 검사
        const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;
    
        if(regEx.test(userTel.value)){ // 유효

            /* const tooltip = bootstrap.Tooltip.getInstance(userTel)
            tooltip.setContent({'.tooltip-inner': '<span class="confirm">유효한 전화번호 형식입니다.</span>'}); */

            telMessage.innerText = "유효한 전화번호 형식입니다";
            telMessage.classList.add("confirm");
            telMessage.classList.remove("error");
            checkObj.userTel = true;
            
        } else{ // 무효

            /* const tooltip = bootstrap.Tooltip.getInstance(userTel)
            tooltip.setContent({'.tooltip-inner': '<span class="error">전화번호 형식이 유효하지 않습니다.</span>'}); */

            telMessage.innerText = "전화번호 형식이 유효하지 않습니다";
            telMessage.classList.add("error");
            telMessage.classList.remove("confirm");
            checkObj.userTel = false;
    
    
        }

});

const userSearch = document.getElementById("addressSearch");
const userAddressPostcode = document.getElementById("userAddress_postcode");
const addressMessage = document.getElementById("addressMessage");
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


valueRecognizer.addEventListener("click", () => {
    if(userAddressPostcode.value != ""){
        addressMessage.classList.add("d-none");
        checkObj.userAddress = true;
    }else{
        addressMessage.classList.remove("d-none");
        checkObj.userAddress = false;
    }
});








// 회원 가입 form태그가 제출 되었을 때
document.getElementById("signUpFrm").addEventListener("submit", e => {

    for(let key in checkObj){

        if(!checkObj[key]){ 

            switch(key){
            case "userEmail" : 
                alert("이메일이 유효하지 않습니다"); break;

            case "userPassword" :
                alert("비밀번호가 유효하지 않습니다"); break;

            case "userPasswordConfirm" :
                alert("비밀번호가 확인되지 않았습니다."); break;

            case "userNickname" :
                alert("닉네임이 유효하지 않습니다."); break;

            case "userTel" :
                alert("전화번호가 유효하지 않습니다."); break;
                
            case "userAddress" :
                alert("주소를 입력해주세요."); break;
            }

                
            if(key !="userAddress"){
                document.getElementById(key).focus;
            }else{
                userSearch.focus;
            }


            e.preventDefault();
            return;   


        }
    }

});







