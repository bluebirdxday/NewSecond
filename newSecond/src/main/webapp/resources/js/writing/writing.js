const textLimit20 = document.querySelector(".textLimit20");
const textLimit500 = document.querySelector(".textLimit500");
const textLimit20Result = document.querySelector('#textLimit20Result');
const textLimit500Result = document.querySelector('#textLimit500Result');

/* 제목 20자 제한 */
textLimit20.addEventListener('input', () => {
    const inputText = textLimit20.value;
    const textLength = inputText.length;
    textLimit20Result.textContent = '(' + textLength + '/20)';
});

/* 상세내용 500자 제한 */
textLimit500.addEventListener('input', () => {
    const inputText = textLimit500.value;
    const textLength = inputText.length;
    textLimit500Result.textContent = '(' + textLength + '/500)';
});



/* ------------------------------------------------------------------ */

const fileInput = document.querySelector('#fileInput');
const imageContainer = document.querySelector('.post--main__ImageScroller');

/* 이미지 파일 업로드 */
// fileInput.addEventListener('change', function () { /* 화살표 함수로 바꾸지마!*/
//     // 선택된 파일 정보 가져오기
//     const selectedFile = this.files[0];

//     // 파일이 선택되지 않았을 경우 리턴
//     if (!selectedFile) {
//         return;
//     }

//     // FileReader 객체 생성
//     const reader = new FileReader();

//     // 파일 로드 완료 이벤트 핸들러 등록
//     reader.addEventListener('load', function () {
//         // 이미지 요소 추가
//         const image = document.createElement('img');
//         image.src = reader.result;
//         imageContainer.appendChild(image);
//     });

//     // 파일 읽기 시작
//     reader.readAsDataURL(selectedFile);
// });

/* ------------------------------------------------------------------ */

const imagePlus = document.querySelector('#imagePlus');
const imageBtn = document.querySelector('.post--main__ImageContainer > div:first-child');

imagePlus.addEventListener('mouseover', () => {
    imageBtn.style.backgroundColor = '#2365B9';
});

imagePlus.addEventListener('mouseout', () => {
    imageBtn.style.backgroundColor = '#C2D3EB';
});

/* +버튼을 눌렀을 떄 파일 업로드 */
imagePlus.addEventListener('click', (e) => {
    e.preventDefault();
    fileInput.click();
});

/* ------------------------------------------------------------------ */

const imageScroller = document.querySelector('.post--main__ImageScroller');
let imageCount = 0;

/* 파일 5개 제한 업로드 */
fileInput.addEventListener('change', e => {
    const files = e.target.files;
    const filesCount = files.length;

    for (let i = 0; i < filesCount; i++) {
        const file = files[i];
        if (imageCount < 5) {
            const image = document.createElement('img');
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.addEventListener('load', (event) => {
                image.src = event.target.result;
                imageScroller.appendChild(image);
                imageCount++;
                updateImageCount();
            });
        }
    }
});

function updateImageCount() {
    const countSpan = document.querySelector('.post--main__inputImage span:nth-child(3)');
    countSpan.textContent = `(${imageCount}/5)`;
    if (imageCount >= 5) {
        imagePlus.removeEventListener('click', handleClick);
        imagePlus.style.cursor = 'default';
    }
}

/* ------------------------------------------------------------------ */

/* 이미지 삭제 */

/* ------------------------------------------------------------------ */

const clothing = document.querySelector('.category--1depth__clothing');
const fashion = document.querySelector('.category--1depth__fashion');
const digital = document.querySelector('.category--1depth__digital');
const life = document.querySelector('.category--1depth__life');
const hobby = document.querySelector('.category--1depth__hobby');
const other = document.querySelector('.category--1depth__other');

/* 카테고리 선택자 */
// 1depth 각 div에 대한 클릭 이벤트를 등록합니다.
clothing.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '남성의류';
    div1.id = 'male2';
    div1.classList.add('category--2depth__item');
    const div2 = document.createElement('div');
    div2.textContent = '여성의류';
    div2.id = 'female2';
    div2.classList.add('category--2depth__item');

    depth2Container.appendChild(div1);
    depth2Container.appendChild(div2);
});

fashion.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '신발';
    div1.id = 'shoes2';
    div1.classList.add('category--2depth__item');
    const div2 = document.createElement('div');
    div2.textContent = '가방';
    div2.id = 'bag2';
    div2.classList.add('category--2depth__item');
    const div3 = document.createElement('div');
    div3.textContent = '시계/주얼리';
    div3.id = 'jewelry2';
    div3.classList.add('category--2depth__item');
    const div4 = document.createElement('div');
    div4.textContent = '패션 액세서리';
    div4.id = 'fashion2';
    div4.classList.add('category--2depth__item');

    depth2Container.appendChild(div1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(div4);
});
digital.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '디지털/가전';
    div1.id = 'digital2';
    div1.classList.add('category--2depth__item');

    depth2Container.appendChild(div1);
});
hobby.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '스타굿즈';
    div1.id = 'stargoods2';
    div1.classList.add('category--2depth__item');
    const div2 = document.createElement('div');
    div2.textContent = '키덜트';
    div2.id = 'kidult2';
    div2.classList.add('category--2depth__item');
    const div3 = document.createElement('div');
    div3.textContent = '예술/희귀/수집품';
    div3.id = 'art2';
    div3.classList.add('category--2depth__item');
    const div4 = document.createElement('div');
    div4.textContent = '음반/악기';
    div4.id = 'music2';
    div4.classList.add('category--2depth__item');
    const div5 = document.createElement('div');
    div5.textContent = '도서/티켓/문구';
    div5.id = 'book2';
    div5.classList.add('category--2depth__item');
    
    depth2Container.appendChild(div1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(div4);
    depth2Container.appendChild(div5);
});
life.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '뷰티/미용';
    div1.id = 'beauty2';
    div1.classList.add('category--2depth__item');
    const div2 = document.createElement('div');
    div2.textContent = '가구/인테리어';
    div2.id = 'furniture2';
    div2.classList.add('category--2depth__item');
    const div3 = document.createElement('div');
    div3.textContent = '생활/주방용품';
    div3.id = 'living2';
    div3.classList.add('category--2depth__item');
    const div4 = document.createElement('div');
    div4.textContent = '공구/산업용품';
    div4.id = 'tool2';
    div4.classList.add('category--2depth__item');
    const div5 = document.createElement('div');
    div5.textContent = '식품';
    div5.id = 'food2';
    div5.classList.add('category--2depth__item');
    const div6 = document.createElement('div');
    div6.textContent = '유아동/출산';
    div6.id = 'baby2';
    div6.classList.add('category--2depth__item');
    const div7 = document.createElement('div');
    div7.textContent = '반려동물용품';
    div7.id = 'pet2';
    div7.classList.add('category--2depth__item');
    const div8 = document.createElement('div');
    div8.textContent = '스포츠/레저';
    div8.id = 'sports2';
    div8.classList.add('category--2depth__item');
    const div9 = document.createElement('div');
    div9.textContent = '차량/오토바이';
    div9.id = 'vehicle2';
    div9.classList.add('category--2depth__item');

    depth2Container.appendChild(div1);
    depth2Container.appendChild(div2);
    depth2Container.appendChild(div3);
    depth2Container.appendChild(div4);
    depth2Container.appendChild(div5);
    depth2Container.appendChild(div6);
    depth2Container.appendChild(div7);
    depth2Container.appendChild(div8);
    depth2Container.appendChild(div9);
});
other.addEventListener('click', () => {
    const depth2Container = document.getElementById('category--2depth');

    while (depth2Container.firstChild) {
        depth2Container.removeChild(depth2Container.firstChild);
    }

    const div1 = document.createElement('div');
    div1.textContent = '기타';
    div1.id = 'other2';
    div1.classList.add('category--2depth__item');
    const div2 = document.createElement('div');
    div2.textContent = '나눔';
    div2.id = 'share2';
    divs.classList.add('category--2depth__item');
    const div3 = document.createElement('div');
    div3.textContent = '구인';
    div3.id = 'hire2';
    div3.classList.add('category--2depth__item');

    depth2Container.appendChild(div1);
    depth2Container.appendChild(div2);
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

/* const imageScroller = document.querySelector('.post--main__ImageScroller'); */
const images = imageScroller.querySelectorAll('img'); /* 추가되는 이미지들 */
const title = document.getElementById('title'); /* 제목 */
const detailText = document.getElementById('detailText'); /* 상세설명 */
const price = document.getElementById('priceInput'); /* 가격 */
const quantity = document.getElementById('quantityInput'); /* 수량 */
const conditions = document.getElementsByName('inputCondition'); /* 컨디션 */
console.log(price.innerText);
let selectedCondition;
for (let i = 0; i < inputConditions.length; i++) {
    if (inputConditions[i].checked) {
        selectedCondition = inputConditions[i].value;
        break;
    }
}
console.log(selectedCondition); // 선택된 라디오 버튼의 값 출력




const items = document.querySelectorAll('.category--2depth__item');
items.forEach(item => {
    item.addEventListener('click', () => {
        alert('안녕');
    });
});