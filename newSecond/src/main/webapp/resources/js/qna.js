const qnaHead = document.querySelector('.qna_head');
  const qnaHeadContent = document.querySelector('.qna_head_content');

  window.onload=()=>{
    document.querySelector('.qna_dropbtn_click').onclick = ()=>{
        qna_dropdown();
    }
    document.getElementsByClassName('qnaList').onclick = ()=>{
      showMenu(value);
    };
    qna_dropdown = () => {
      var v = document.querySelector('.qna_dropdown-content');
      var qna_dropbtn = document.querySelector('.qna_dropbtn')
      v.classList.toggle('show');
      qna_dropbtn.style.borderColor = '#005EEE';

    }

    showMenu=(value)=>{
      var qna_dropbtn_content = document.querySelector('.qna_dropbtn_content');
      var qna_dropbtn_click = document.querySelector('.qna_dropbtn_click');
      var qna_dropbtn = document.querySelector('.qna_dropbtn');

     qna_dropbtn_content.innerText = '';
      qna_dropbtn_content.innerText = value;
      qna_dropbtn_content.style.color = '#005EEE';
      qna_dropbtn.style.borderColor = '#005EEE';
      
    }
  }
  window.onclick= (e)=>{
    if(!e.target.matches('.qna_dropbtn_click')){
      var qna_dropdowns = document.getElementsByClassName("qna_dropdown-content");

      var qna_dropbtn_icon = document.querySelector('.qna_dropbtn_icon');
      var qna_dropbtn_content = document.querySelector('.qna_dropbtn_content');
      var qna_dropbtn_click = document.querySelector('.qna_dropbtn_click');
      var qna_dropbtn = document.querySelector('.qna_dropbtn');

      var i;
      for (i = 0; i < qna_dropdowns.length; i++) {
        var openDropdown = qna_dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }

   /* 모달 */
/*     const qnaBtn = document.getElementById('qna_button');
  const modal = document.getElementById('qna_modal');
  const qnaCloseBtn = document.getElementById('qna_closeBtn');
     */
/*     qnaBtn.onclick = function() {
    modal.style.display = 'block';
     modal.style.position = 'fixed';
  }   */
/*     qnaCloseBtn.onclick = function() {
    modal.style.display = 'none';
  } */
  
/*    window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }    */