const qnaHead = document.querySelector('.qna_head');
  const qndHeadContent = document.querySelector('.qnd_head_content');

  qnaHead.addEventListener('click', function() {
    if (qndHeadContent.style.display === 'none') {
      qndHeadContent.style.display = 'block';
      qndHeadContent.style.position = 'absolute'
       
    } else {
      qndHeadContent.style.display = 'none';
     
    }
  });

 
