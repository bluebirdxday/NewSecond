function openModal() {
    const modal = document.getElementById('loginModal');
    modal.style.display = 'block';
} 

function closeModalWindow(event) {
    const modal = document.getElementById('loginModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
}