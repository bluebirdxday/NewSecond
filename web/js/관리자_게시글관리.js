/* 체크박스 전체선택 */
function boardSelectAll(boardSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = boardSelectAll.checked
    })
  }