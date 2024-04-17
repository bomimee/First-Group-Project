




const slides = document.querySelectorAll('.newsslide');
    let currentSlide = 0;

    function showSlide(index) {
        // 모든 슬라이드를 숨김
        slides.forEach(slide => {
            slide.style.display = 'none';
        });
        // 현재 인덱스에 해당하는 슬라이드만 표시
        slides[index].style.display = 'block';
    }

    function nextSlide() {
        // 현재 슬라이드를 숨기고 다음 슬라이드로 이동
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }

    // 처음에 첫 번째 슬라이드 표시
    showSlide(currentSlide);

    // 3초마다 다음 슬라이드로 이동
    setInterval(nextSlide, 2000);
    
    
    