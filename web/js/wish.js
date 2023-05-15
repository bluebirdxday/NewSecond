/* 체크박스 전체선택 */
function wishSelectAll(wishSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = wishSelectAll.checked
    })
  }