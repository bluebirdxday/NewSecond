/* 전체 글자 수 count */
const countAll = document.querySelector('.admin_qna_countAll');
const table = document.querySelector('.admin_qna_table');
const tableCount = table.rows.length;

countAll.innerText = tableCount-1;

/* 체크박스 전체선택 */
function qnaSelectAll(qnaSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = qnaSelectAll.checked
    })
  }
  

// Get references to the radio buttons and table rows
const radioTrade = document.getElementById('trade');
const tableRows = document.querySelectorAll('.admin_qna_table tbody tr');

// Add an event listener to the trade radio button
radioTrade.addEventListener('change', function() {
  // Check if the trade radio button is selected
  if (radioTrade.checked) {
    // Loop through each table row
    tableRows.forEach(function(row) {
      // Get the category cell value
      const category = row.querySelector('td:nth-child(4)').textContent;
      
      // Check if the category is not "거래신고"
      if (category !== '거래신고') {
        // Hide the row
        row.style.display = 'none';
      } else {
        // Show the row
        row.style.display = '';

        
      }
    });
  } else {
    // If the trade radio button is not selected, show all rows
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});

const radioUser = document.getElementById('user');


// Add an event listener to the trade radio button
radioUser.addEventListener('change', function() {
  // Check if the trade radio button is selected
  if (radioUser.checked) {
    // Loop through each table row
    tableRows.forEach(function(row) {
      // Get the category cell value
      const category = row.querySelector('td:nth-child(4)').textContent;
      
      // Check if the category is not "거래신고"
      if (category !== '회원/계정') {
        // Hide the row
        row.style.display = 'none';
      } else {
        // Show the row
        row.style.display = '';

        
      }
    });
  } else {
    // If the trade radio button is not selected, show all rows
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});
const radioError = document.getElementById('error');

// Add an event listener to the trade radio button
radioError.addEventListener('change', function() {
  // Check if the trade radio button is selected
  if (radioError.checked) {
    // Loop through each table row
    tableRows.forEach(function(row) {
      // Get the category cell value
      const category = row.querySelector('td:nth-child(4)').textContent;
      
      // Check if the category is not "거래신고"
      if (category !== '오류/제안') {
        // Hide the row
        row.style.display = 'none';
      } else {
        // Show the row
        row.style.display = '';

        
      }
    });
  } else {
    // If the trade radio button is not selected, show all rows
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});

const radioChatting = document.getElementById('chatting');

// Add an event listener to the trade radio button
radioChatting.addEventListener('change', function() {
  // Check if the trade radio button is selected
  if (radioChatting.checked) {
    // Loop through each table row
    tableRows.forEach(function(row) {
      // Get the category cell value
      const category = row.querySelector('td:nth-child(4)').textContent;
      
      // Check if the category is not "거래신고"
      if (category !== '채팅/알람') {
        // Hide the row
        row.style.display = 'none';
      } else {
        // Show the row
        row.style.display = '';

        
      }
    });
  } else {
    // If the trade radio button is not selected, show all rows
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});

const radioEtc = document.getElementById('etc');

// Add an event listener to the trade radio button
radioEtc.addEventListener('change', function() {
  // Check if the trade radio button is selected
  if (radioEtc.checked) {
    // Loop through each table row
    tableRows.forEach(function(row) {
      // Get the category cell value
      const category = row.querySelector('td:nth-child(4)').textContent;
      
      // Check if the category is not "거래신고"
      if (category !== '기타문의') {
        // Hide the row
        row.style.display = 'none';
      } else {
        // Show the row
        row.style.display = '';

        
      }
    });
  } else {
    // If the trade radio button is not selected, show all rows
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});

// 라디오 버튼과 테이블 행에 대한 참조를 가져옵니다.
const radioAll = document.getElementById('all');

// '전체' 라디오 버튼에 이벤트 리스너를 추가합니다.
radioAll.addEventListener('change', function() {
  // '전체' 라디오 버튼이 선택되었는지 확인합니다.
  if (radioAll.checked) {
    // 모든 테이블 행을 표시합니다.
    tableRows.forEach(function(row) {
      row.style.display = '';
    });
  }
});
