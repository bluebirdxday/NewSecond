const imagePlusBtn = document.querySelector('#imagePlus');
const fileInputContainer = document.querySelector('#fileInputContainer');
const imageCount = document.querySelector('#imageCount');
const textLimit50 = document.querySelector(".textLimit50");
const textLimit500 = document.querySelector(".textLimit500");
const textLimit50Result = document.querySelector('#textLimit50Result');
const textLimit500Result = document.querySelector('#textLimit500Result');
const fileInput = document.querySelector('#fileInput');
const imageContainer = document.querySelector('.post--main__ImageScroller');
const imageBtn = document.querySelector('.post--main__ImageContainer > div:first-child');
const imageScroller = document.querySelector('.post--main__ImageScroller');

/* ------------------------------------------------------------------ */


/* 제목 50자 제한 */
textLimit50.addEventListener('input', () => {
    const inputText = textLimit50.value;
    const textLength = inputText.length;
    textLimit50Result.textContent = '(' + textLength + '/50)';
    if (textLength >= 50) {
        textLimit50Result.style.color = 'red';
    } else {
        textLimit50Result.style.color = '';
    }
});

/* 상세내용 500자 제한 */
textLimit500.addEventListener('input', () => {
    const inputText = textLimit500.value;
    const textLength = inputText.length;
    textLimit500Result.textContent = '(' + textLength + '/500)';
    if (textLength >= 500) {
        textLimit500Result.style.color = 'red';
    } else {
        textLimit500Result.style.color = '';
    }
});

/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* -----------------------------이미지 관련 JS------------------------------- */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */

/* 이미지 파일 업로드 */
imagePlusBtn.addEventListener('mouseover', () => {
    imageBtn.style.backgroundColor = '#2365B9';
});

imagePlusBtn.addEventListener('mouseout', () => {
    imageBtn.style.backgroundColor = '#C2D3EB';
});

/* +버튼을 눌렀을 떄 input 생성 후 클릭 */
imagePlusBtn.addEventListener('click', (e) => {
    e.preventDefault();
    const fileInput = document.createElement('input');
    fileInput.type = 'file';
    fileInput.name = 'image';
    fileInput.style.display = 'none';
    fileInput.accept = 'image/*';
    const dataId = generateDataId(); // 난수 함수 호출
    fileInput.setAttribute('data-id', dataId); // data-id 속성 추가
    fileInputContainer.appendChild(fileInput);
    fileInput.click();
});

/* input 식별을 위한 AA 난수 생성기 */
function generateDataId() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const randomIndex1 = Math.floor(Math.random() * characters.length);
    const randomIndex2 = Math.floor(Math.random() * characters.length);
    const dataId = characters[randomIndex1] + characters[randomIndex2];
    return dataId;
}

let fileCount = 0;

/* input 생성 후 업로드되면 미리보기 생성 */
fileInputContainer.addEventListener('change', (event) => {
    const files = event.target.files;

    if (files && files.length > 0) {
        const file = files[0];
        const reader = new FileReader();

        reader.onload = () => {
            const image = document.createElement('img');
            const dataId = event.target.getAttribute('data-id'); // input의 data-id 값 가져오기
            image.src = reader.result;
            image.dataset.id = dataId; // img에 data-id 속성 추가
            imageScroller.appendChild(image);
            enableImageDelete(image); // 삭제 함수 호출
        };

        reader.readAsDataURL(file);
        fileCount++;

        updateImageCount(); // 함수 호출
    }
});

/* 이미지 삭제 함수 */
function enableImageDelete(image) {

    image.addEventListener('click', () => {
        if (confirm('이미지를 삭제하시겠습니까?')) {
            const dataId = image.dataset.id; // img data-id 가져오기
            image.remove();
            fileCount--;
            updateImageCount();
            removeFileInput(dataId); // input 삭제 함수 호출 시 img 태그의 data-id를 전달
        }
    });
}

/* 이미지 삭제 후 업로드 파일 삭제 함수 */
function removeFileInput(dataId) {
    const fileInput = fileInputContainer.querySelector(`input[data-id="${dataId}"]`);
    // 해당 data-id를 가진 input 태그 선택
    if (fileInput) {
        fileInputContainer.removeChild(fileInput);
    }
}

/* 이미지 카운트 함수 */
function updateImageCount() {
    imageCount.textContent = `(${fileCount}/5)`;
}

/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* -----------------------------카테고리 관련 JS------------------------------- */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */

const clothing = document.querySelector('.category--1depth__clothing');
const fashion = document.querySelector('.category--1depth__fashion');
const digital = document.querySelector('.category--1depth__digital');
const life = document.querySelector('.category--1depth__life');
const hobby = document.querySelector('.category--1depth__hobby');
const other = document.querySelector('.category--1depth__other');
const divline1= document.createElement('div');
const divline2 = document.createElement('div');
const divline3 = document.createElement('div');
const divline4 = document.createElement('div');
const divline5 = document.createElement('div');
const divline6 = document.createElement('div');
const divline7 = document.createElement('div');
const divline8 = document.createElement('div');
const divline9 = document.createElement('div');

/* 카테고리 선택자 */
// 1depth 각 div에 대한 클릭 이벤트를 등록합니다.
clothing.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('label');
    div1.textContent = '남성의류';
    div1.id = 'male2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '여성의류';
    div2.id = 'female2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.required = true; // required 속성 추가
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    depth2Container.appendChild(div1);
    depth2Container.appendChild(divline1);
    depth2Container.appendChild(div2);
});

fashion.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('label');
    div1.textContent = '신발';
    div1.id = 'shoes2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '가방';
    div2.id = 'bag2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.required = true; // required 속성 추가
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '시계/주얼리';
    div3.id = 'jewelry2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.required = true; // required 속성 추가
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '패션 액세서리';
    div4.id = 'fashion2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
    radio4.required = true; // required 속성 추가
    radio4.value = div4.textContent;
    div4.appendChild(radio4);


    depth2Container.appendChild(div1);
    depth2Container.appendChild(divline1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(divline2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(divline3);
    depth2Container.appendChild(div4);
});
digital.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('label');
    div1.textContent = '디지털/가전';
    div1.id = 'digital2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const divline = document.createElement('div');

    depth2Container.appendChild(div1);
});
hobby.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }


    const div1 = document.createElement('label');
    div1.textContent = '스타굿즈';
    div1.id = 'stargoods2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const divline = document.createElement('div');

    const div2 = document.createElement('label');
    div2.textContent = '키덜트';
    div2.id = 'kidult2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.required = true; // required 속성 추가
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '예술/희귀/수집품';
    div3.id = 'art2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.required = true; // required 속성 추가
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '음반/악기';
    div4.id = 'music2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
    radio4.required = true; // required 속성 추가
    radio4.value = div4.textContent;
    div4.appendChild(radio4);

    const div5 = document.createElement('label');
    div5.textContent = '도서/티켓/문구';
    div5.id = 'book2';
    div5.classList.add('category--2depth__item');
    const radio5 = document.createElement('input');
    radio5.type = 'radio';
    radio5.name = 'category2';
    radio5.required = true; // required 속성 추가
    radio5.value = div5.textContent;
    div5.appendChild(radio5);
    
    depth2Container.appendChild(div1);
    depth2Container.appendChild(divline1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(divline2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(divline3);
    depth2Container.appendChild(div4);
    depth2Container.appendChild(divline4);
    depth2Container.appendChild(div5);
});
life.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('label');
    div1.textContent = '뷰티/미용';
    div1.id = 'beauty2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '가구/인테리어';
    div2.id = 'furniture2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.required = true; // required 속성 추가
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '생활/주방용품';
    div3.id = 'living2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.required = true; // required 속성 추가
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '공구/산업용품';
    div4.id = 'tool2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
    radio4.required = true; // required 속성 추가
    radio4.value = div4.textContent;
    div4.appendChild(radio4);

    const div5 = document.createElement('label');
    div5.textContent = '식품';
    div5.id = 'food2';
    div5.classList.add('category--2depth__item');
    const radio5 = document.createElement('input');
    radio5.type = 'radio';
    radio5.name = 'category2';
    radio5.required = true; // required 속성 추가
    radio5.value = div5.textContent;
    div5.appendChild(radio5);

    const div6 = document.createElement('label');
    div6.textContent = '유아동/출산';
    div6.id = 'baby2';
    div6.classList.add('category--2depth__item');
    const radio6 = document.createElement('input');
    radio6.type = 'radio';
    radio6.name = 'category2';
    radio6.required = true; // required 속성 추가
    radio6.value = div6.textContent;
    div6.appendChild(radio6);

    const div7 = document.createElement('label');
    div7.textContent = '반려동물용품';
    div7.id = 'pet2';
    div7.classList.add('category--2depth__item');
    const radio7 = document.createElement('input');
    radio7.type = 'radio';
    radio7.name = 'category2';
    radio7.required = true; // required 속성 추가
    radio7.value = div7.textContent;
    div7.appendChild(radio7);

    const div8 = document.createElement('label');
    div8.textContent = '스포츠/레저';
    div8.id = 'sports2';
    div8.classList.add('category--2depth__item');
    const radio8 = document.createElement('input');
    radio8.type = 'radio';
    radio8.name = 'category2';
    radio8.required = true; // required 속성 추가
    radio8.value = div8.textContent;
    div8.appendChild(radio8);

    const div9 = document.createElement('label');
    div9.textContent = '차량/오토바이';
    div9.id = 'vehicle2';
    div9.classList.add('category--2depth__item');
    const radio9 = document.createElement('input');
    radio9.type = 'radio';
    radio9.name = 'category2';
    radio9.required = true; // required 속성 추가
    radio9.value = div9.textContent;
    div9.appendChild(radio9);


    depth2Container.appendChild(div1);
    depth2Container.appendChild(divline1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(divline2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(divline3);
    depth2Container.appendChild(div4);
    depth2Container.appendChild(divline4);
    depth2Container.appendChild(div5);
    depth2Container.appendChild(divline5);
    depth2Container.appendChild(div6);
    depth2Container.appendChild(divline6);
    depth2Container.appendChild(div7);
    depth2Container.appendChild(divline7);
    depth2Container.appendChild(div8);
    depth2Container.appendChild(divline8);
    depth2Container.appendChild(div9);
});
other.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('label');
    div1.textContent = '기타';
    div1.id = 'other2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.required = true; // required 속성 추가
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '나눔';
    div2.id = 'share2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.required = true; // required 속성 추가
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '구인';
    div3.id = 'hire2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.required = true; // required 속성 추가
    radio3.value = div3.textContent;
    div3.appendChild(radio3);


    depth2Container.appendChild(div1);
    depth2Container.appendChild(divline1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(divline2);
    depth2Container.appendChild(div3);
});


/* 카테고리 2차 선택자 */
const male2 = document.createElement('male2');
const female2 = document.createElement('female2');

const shoes2 = document.createElement('shoes2');
const bag2 = document.createElement('bag2');
const jewelry2 = document.createElement('jewelry2');
const fashion2 = document.createElement('fashion2');

const digital2 = document.createElement('digital2');

const stargoods2 = document.createElement('stargoods2');
const kidult2 = document.createElement('kidult2');
const art2 = document.createElement('art2');
const music2 = document.createElement('music2');
const book2 = document.createElement('book2');

const beauty2 = document.createElement('beauty2');
const furniture2 = document.createElement('furniture2');
const living2 = document.createElement('living2');
const tool2 = document.createElement('tool2');
const food2 = document.createElement('food2');
const baby2 = document.createElement('baby2');
const pet2 = document.createElement('pet2');
const sports2 = document.createElement('sports2');
const vehicle2 = document.createElement('vehicle2');

const other2 = document.createElement('other2');
const share2 = document.createElement('share2');
const hire2 = document.createElement('hire2');




/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* -----------------------------DB 연결을 위한 JS------------------------------ */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------- */


/* form 전송 전 필수입력 값 체크 */
const submit = document.getElementById("submitBtn");

submit.addEventListener("click", (e) =>  {

    var titleCheck = document.getElementById("title");
    var imageCheck = document.getElementById("fileInput");
    var detailTextCheck = document.getElementById("detailText");
    var priceCheck = document.getElementById("priceInput");
    var quantityCheck = document.getElementById("quantityInput");
    var conditionCheck = document.getElementsByName("condition");
    var category2Check = document.getElementsByName("category2");
    
    if(titleCheck.value.trim() === "") {
        alert("제목을 입력해주세요.");
        titleCheck.focus();
        return false;
    }
    
    if(detailTextCheck.value.trim() === "") {
        alert("상품에 대한 설명을 입력해주세요.");
        detailTextCheck.focus();
        return false;
    }

    if(priceCheck.value.trim() === "") {
        alert("상품 가격을 입력해주세요.");
        priceCheck.focus();
        return false;
    }


    /* 최종 제출 방지 */

    if( // 제출 방지
        titleCheck.value.trim() === "" ||
        detailTextCheck.value.trim() === "" ||
        priceCheck.value.trim() === ""
    ) {
        e.preventDefault();
    }

    return true; // 폼 전송

});

