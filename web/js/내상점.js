const tapContent = document.querySelectorAll(".myshop--tab__content");

// 탭 컨텐츠 숨기기
tapContent.forEach(el => el.style.display = 'none');

// 첫번째 탭콘텐츠 보이기
tapContent[0].style.display = 'block';

// 탭메뉴 클릭 이벤트
const tabList = document.querySelectorAll(".tabs li");

tabList.forEach(function(tab) {

    tab.addEventListener('click' , function(){
        tabList.forEach(function(e){
            e.classList.remove('active');
    });

    tab.classList.add('active');
    });
});