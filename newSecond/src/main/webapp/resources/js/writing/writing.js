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

const fileInput = document.querySelector('.fileInput');
const imageContainer = document.querySelector('.post--main__ImageScroller');

/* 이미지 파일 업로드 */
fileInput.addEventListener('change', function () { /* 화살표 함수로 바꾸지마!*/
    // 선택된 파일 정보 가져오기
    const selectedFile = this.files[0];

    // 파일이 선택되지 않았을 경우 리턴
    if (!selectedFile) {
        return;
    }

    // FileReader 객체 생성
    const reader = new FileReader();

    // 파일 로드 완료 이벤트 핸들러 등록
    reader.addEventListener('load', function () {
        // 이미지 요소 추가
        const image = document.createElement('img');
        image.src = reader.result;
        imageContainer.appendChild(image);
    });

    // 파일 읽기 시작
    reader.readAsDataURL(selectedFile);
});

/* ------------------------------------------------------------------ */

const imagePlus = document.querySelector('#imagePlus');

/* +버튼을 눌렀을 떄 파일 업로드 */
imagePlus.addEventListener('click', () => {
    fileInput.click();
});