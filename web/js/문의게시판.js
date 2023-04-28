const qnaHead = document.querySelector('.qna_head');
  const qnaHeadContent = document.querySelector('.qna_head_content');

  qnaHead.addEventListener('click', function() {
    if (qnaHeadContent.style.display === 'none') {
      qnaHeadContent.style.display = 'block';
      qnaHeadContent.style.position = 'absolute'
         
    }else {
      qnaHeadContent.style.display = 'none';
     
    } 
  });

