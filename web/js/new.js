/* 체크박스 전체선택 */
function newSelectAll(newSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = newSelectAll.checked
    })
  }

