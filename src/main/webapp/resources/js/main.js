// 헤더바 스크롤 이벤트
const head = document.querySelector('#head');

let tabIdx = 0;
let scrPos = { y: 0, dy: 0, state: true };

window.addEventListener('scroll', () => {
    scrPos.y = window.scrollY;
    scrPos.state = (scrPos.y > scrPos.dy) ? true : false;
    scrPos.dy = scrPos.y;

    if (scrPos.state) {
        head.classList.add('active');
    } else {
        head.classList.remove('active');
    }
});

// 메인 슬라이드 이벤트
const article =  document.querySelector('article'),
	slide = article.querySelector('#slide'), 
	slide_container = slide.querySelector('ul'),
	slide_list = slide_container.getElementsByTagName('li'),
    btnLeft = slide.querySelector('.btn_left'),
    btnRight = slide.querySelector('.btn_right'),
    button = slide.querySelector('.button');

// 버튼 생성 
for (let i = 0; i < slide_list.length; i++) {
    button.innerHTML += `<a href="#" data-direction="${i}"></a>`;
}

const btnList = button.getElementsByTagName('a');

let idx = 0,
    nextIdx = 0,
    direction;

let start_time = -new Date();
function exec() {
    let click_time = new Date();

    if (click_time - start_time > 800) {

        start_time = click_time;

        return true;
    }
}

function btnStyle() {
    btnList[idx].style.opacity = '.2';
    btnList[nextIdx].style.opacity = '1';

}
function spareSlide() {
	slide_list[nextIdx].classList.remove('animated');
	slide_list[nextIdx].style.left = `${direction * 100}%`;
}

function moveSlide() {
    setTimeout(() => {
    	slide_list[idx].classList.add('animated');
    	slide_list[idx].style.left = `${-direction * 100}%`;

    	slide_list[nextIdx].classList.add('animated');
    	slide_list[nextIdx].style.left = `0%`;

        btnStyle();
        idx = nextIdx;
    }, 5);
}

slide.addEventListener('click', function (e) {
    const aLink = e.target.closest('a');
    
    if (exec() && slide.contains(aLink)) {
        const extractDirection = +aLink.dataset.direction;
        nextIdx = idx + extractDirection;
        if (nextIdx >= slide_list.length) {
            nextIdx = 0;
        } else if (nextIdx < 0) {
            nextIdx = slide_list.length - 1;
        }
        if (aLink.children[0]) {
            direction = extractDirection;
        } else {
            nextIdx = extractDirection;
            direction = extractDirection > idx ? 1 : -1;
        }
        if (idx != nextIdx) {
            spareSlide();
        } else {
            return;
        }
        moveSlide();

    }
});






