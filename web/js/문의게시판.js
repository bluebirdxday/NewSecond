const qnaHead = document.querySelector('.qna_head');
  const qnaHeadContent = document.querySelector('.qna_head_content');

  qnaHead.addEventListener('click', function() {
    if (qndHeadContent.style.display === 'none') {
      qndHeadContent.style.display = 'block';
      qndHeadContent.style.position = 'absolute'
       
    } else {
      qndHeadContent.style.display = 'none';
     
    }
  });

  const qnaLi= document.querySelectorAll('.qna_li');

  for(let qnaList of qnaLi){

  qnaList.addEventListener(()=>{
    
for(let i=0; i<qnaLi.length; i++){
  qnaHead.innerText = qnaLi[i].innerText


   }});
}