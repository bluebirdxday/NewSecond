const textLimit20 = document.querySelector(".textLimit20");
const textLimit500 = document.querySelector(".textLimit500");
const textLimit20Result = document.querySelector('#textLimit20Result');
const textLimit500Result = document.querySelector('#textLimit500Result');
const fileInput = document.querySelector('#fileInput');
const imageContainer = document.querySelector('.post--main__ImageScroller');
const imagePlus = document.querySelector('#imagePlus');
const imageBtn = document.querySelector('.post--main__ImageContainer > div:first-child');
const imageScroller = document.querySelector('.post--main__ImageScroller');

/* ------------------------------------------------------------------ */

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

/* 이미지 파일 업로드 */
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

const imageCount = document.querySelector('#imageCount');
let fileCount = 0;

const imagePlusBtn = document.querySelector('#imagePlus');
const fileInputContainer = document.querySelector('#fileInputContainer');

imagePlusBtn.addEventListener('click', () => {
  const fileInput = document.createElement('input');
  fileInput.type = 'file';
  fileInput.name = 'image';
  fileInput.style.display = 'none';
  fileInput.accept = 'image/*';

  fileInputContainer.appendChild(fileInput);
  fileInput.click();
});

fileInputContainer.addEventListener('change', (event) => {
  const files = event.target.files;

  if (files && files.length > 0) {
    const file = files[0];
    const reader = new FileReader();

    reader.onload = () => {
      const image = document.createElement('img');
      image.src = reader.result;
      imageScroller.appendChild(image);
      enableImageDelete(image);
    };

    reader.readAsDataURL(file);
    fileCount++;

    updateImageCount();
  }
});

function enableImageDelete(image) {
  image.addEventListener('mouseover', () => {
    image.style.position = 'relative';
    image.innerHTML += '<div class="deleteOverlay"></div>';
  });

  image.addEventListener('mouseout', () => {
    image.style.position = '';
    image.querySelector('.deleteOverlay').remove();
  });

  image.addEventListener('click', () => {
    if (confirm('이미지를 삭제하시겠습니까?')) {
      image.remove();
      fileCount--;
      updateImageCount();
      removeFileInput();
    }
  });
}

function removeFileInput() {
  const fileInput = fileInputContainer.querySelector('input[type=file]');
  if (fileInput) {
    fileInputContainer.removeChild(fileInput);
  }
}

function updateImageCount() {
  imageCount.textContent = `(${fileCount}/5)`;
}


// let imageCount = 0;

// // + 버튼 클릭 시 새로운 input 태그 추가
// imagePlus.addEventListener('click', () => {
//     if (imageCount < 5) {
//         const newInput = document.createElement('input');
//         newInput.type = 'file';
//         newInput.name = 'image';
//         newInput.style.display = 'none';
//         newInput.accept = 'image/*';
//         newInput.addEventListener('change', handleFileChange);
//         document.getElementById('fileInputContainer').appendChild(newInput);
//         newInput.click();
//     }
// });

// // 파일 변경 시 이미지 추가
// function handleFileChange(e) {
//     const file = e.target.files[0];
//     const image = document.createElement('img');
//     const reader = new FileReader();
//     reader.readAsDataURL(file);
//     reader.addEventListener('load', (event) => {
//         image.src = event.target.result;
//         imageScroller.appendChild(image);
//         imageCount++;
//         updateImageCount();
//     });
// }

// // 이미지 개수 카운트 및 제한
// function updateImageCount() {
//     const countSpan = document.querySelector('.post--main__inputImage span:nth-child(3)');
//     countSpan.textContent = `(${imageCount}/5)`;
//     if (imageCount >= 5) {
//         imagePlus.style.cursor = 'default';
//         // 경고창 띄우기
//         imagePlus.addEventListener('click', () => {
//             alert('파일은 최대 5개까지 업로드할 수 있습니다.');
//         });
//         imagePlus.removeEventListener('click', handleClick);
//     }
// }

// // 페이지 로드 시 기존 이미지 개수 초기화
// window.addEventListener('load', () => {
//     imageCount = document.querySelectorAll('.post--main__ImageScroller img').length;
//     updateImageCount();
// });

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

/*     const div0 = document.createElement('div');
    div0.textContent = '남성의류';
    div0.id = 'male2';
    div0.classList.add('category--2depth__item');
    const label0 = document.createElement('label');
    label0.for = "male2Radio"
    const radio0 = document.createElement('input');
    radio0.type = 'radio';
    radio0.name = 'category2';
    radio0.id = "male2Radio";
 */




    const div1 = document.createElement('label');
    div1.textContent = '남성의류';
    div1.id = 'male2';
    div1.classList.add('category--2depth__item');
    const radio1 = document.createElement('input');
    radio1.type = 'radio';
    radio1.name = 'category2';
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '여성의류';
    div2.id = 'female2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
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
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '가방';
    div2.id = 'bag2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '시계/주얼리';
    div3.id = 'jewelry2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '패션 액세서리';
    div4.id = 'fashion2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
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
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '예술/희귀/수집품';
    div3.id = 'art2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '음반/악기';
    div4.id = 'music2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
    radio4.value = div4.textContent;
    div4.appendChild(radio4);

    const div5 = document.createElement('label');
    div5.textContent = '도서/티켓/문구';
    div5.id = 'book2';
    div5.classList.add('category--2depth__item');
    const radio5 = document.createElement('input');
    radio5.type = 'radio';
    radio5.name = 'category2';
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
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '가구/인테리어';
    div2.id = 'furniture2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '생활/주방용품';
    div3.id = 'living2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
    radio3.value = div3.textContent;
    div3.appendChild(radio3);

    const div4 = document.createElement('label');
    div4.textContent = '공구/산업용품';
    div4.id = 'tool2';
    div4.classList.add('category--2depth__item');
    const radio4 = document.createElement('input');
    radio4.type = 'radio';
    radio4.name = 'category2';
    radio4.value = div4.textContent;
    div4.appendChild(radio4);

    const div5 = document.createElement('label');
    div5.textContent = '식품';
    div5.id = 'food2';
    div5.classList.add('category--2depth__item');
    const radio5 = document.createElement('input');
    radio5.type = 'radio';
    radio5.name = 'category2';
    radio5.value = div5.textContent;
    div5.appendChild(radio5);

    const div6 = document.createElement('label');
    div6.textContent = '유아동/출산';
    div6.id = 'baby2';
    div6.classList.add('category--2depth__item');
    const radio6 = document.createElement('input');
    radio6.type = 'radio';
    radio6.name = 'category2';
    radio6.value = div6.textContent;
    div6.appendChild(radio6);

    const div7 = document.createElement('label');
    div7.textContent = '반려동물용품';
    div7.id = 'pet2';
    div7.classList.add('category--2depth__item');
    const radio7 = document.createElement('input');
    radio7.type = 'radio';
    radio7.name = 'category2';
    radio7.value = div7.textContent;
    div7.appendChild(radio7);

    const div8 = document.createElement('label');
    div8.textContent = '스포츠/레저';
    div8.id = 'sports2';
    div8.classList.add('category--2depth__item');
    const radio8 = document.createElement('input');
    radio8.type = 'radio';
    radio8.name = 'category2';
    radio8.value = div8.textContent;
    div8.appendChild(radio8);

    const div9 = document.createElement('label');
    div9.textContent = '차량/오토바이';
    div9.id = 'vehicle2';
    div9.classList.add('category--2depth__item');
    const radio9 = document.createElement('input');
    radio9.type = 'radio';
    radio9.name = 'category2';
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
    radio1.value = div1.textContent;
    div1.appendChild(radio1);

    const div2 = document.createElement('label');
    div2.textContent = '나눔';
    div2.id = 'share2';
    div2.classList.add('category--2depth__item');
    const radio2 = document.createElement('input');
    radio2.type = 'radio';
    radio2.name = 'category2';
    radio2.value = div2.textContent;
    div2.appendChild(radio2);

    const div3 = document.createElement('label');
    div3.textContent = '구인';
    div3.id = 'hire2';
    div3.classList.add('category--2depth__item');
    const radio3 = document.createElement('input');
    radio3.type = 'radio';
    radio3.name = 'category2';
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

submit.addEventListener("click", () =>  {

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

    // if(imageCheck.value.trim() === "") {
    //     alert("이미지 사진을 1개 이상 첨부해주세요.");
    //     imageCheck.focus();
    //     return false;
    // }
    
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

    if(quantityCheck.value.trim() === "") {
        alert("상품 수량을 입력해주세요.");
        quantityCheck.focus();
        return false;
    }

    if(!isConditionSelected(conditionCheck)) { // 함수
        alert("상품 상태를 선택해주세요.");
        conditionCheck.focus();
        return false;
    }

    // if(!isCategory2Selected(category2Check)) { // 함수
    //     alert("상품 카테고리를 선택해주세요.");
    //     category2Check.focus();
    //     return false;
    // }

    return true; // 폼 전송


});

// 상태 선택 확인 함수
function isConditionSelected(conditionCheck) {
    for (var i = 0; i < conditionCheck.length; i++) {
        if (conditionCheck[i].checked) {
            return true;
        }
    }
    return false;
}

// 카테고리 선택 확인 함수
// function isCategory2Selected(category2Check) {
//     for (var i = 0; i < category2Check.length; i++) {
//         if (category2Check[i].checked) {
//             return true;
//         }
//     }
//     return false;
// }


