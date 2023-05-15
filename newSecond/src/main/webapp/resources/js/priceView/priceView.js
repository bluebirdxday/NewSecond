document.getElementById('searchBox').addEventListener('focus', () => {
    if (this.value === '검색어를 입력하세요') {
        this.value = '';
    }
});