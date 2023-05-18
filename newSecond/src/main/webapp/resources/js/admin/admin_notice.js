// 필독 등록 버튼을 클릭할 때 실행되는 함수
function toggleImportant(event) {
  const row = event.target.closest('tr'); // 클릭된 버튼이 속한 행
  const numberCell = row.querySelector('td:nth-child(2)'); // 해당 행의 번호 열
  const number = numberCell.dataset.originalNumber || numberCell.textContent; // 해당 행의 번호
  const button = event.target; // 클릭된 버튼

  // 필독 등록 버튼인 경우
  if (button.textContent === '필독 등록') {
    const span = document.createElement('span'); // 새로운 span 태그 생성
    span.textContent = '필독'; // span 태그의 내용 설정
    numberCell.textContent = ''; // 번호 열의 내용 삭제
    numberCell.dataset.originalNumber = number; // 원래 번호를 dataset에 저장
    numberCell.appendChild(span); // 해당 행의 번호 열에 span 태그 추가
    numberCell.style.backgroundColor= 'green';
    numberCell.style.borderRadius= '20px';
    numberCell.style.padding= '0px 0px';
    span.style.padding = '0px 0px';

    button.textContent = '필독 취소'; // 버튼 텍스트 변경
  }
  // 필독 취소 버튼인 경우
  else if (button.textContent === '필독 취소') {
    const span = numberCell.querySelector('span'); // 해당 행의 번호 열에 있는 span 태그 가져오기
    if (span) {
      span.remove(); // span 태그 삭제
      numberCell.textContent = numberCell.dataset.originalNumber; // 원래 번호를 다시 출력
      delete numberCell.dataset.originalNumber; // dataset에서 원래 번호 삭제
      numberCell.style.backgroundColor= '';
    }
    button.textContent = '필독 등록'; // 버튼 텍스트 변경
  }
}

// 모든 필독 등록 버튼에 클릭 이벤트 리스너 등록
const buttons = document.querySelectorAll('.admin_notice_tableBtn');
buttons.forEach(button => button.addEventListener('click', toggleImportant));

/* 체크박스 전체선택 */
function boardSelectAll(boardSelectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = boardSelectAll.checked
  })
}
