const hamburger = document.querySelector('.hamburger');
const category = document.querySelector('.category');

hamburger.addEventListener('click', () => {
    category.classList.toggle('active');
})

document.addEventListener('click', (e) => {
    if (!category.contains(e.target) && !hamburger.contains(e.target)) {
        category.classList.remove('active');
    }
})


const b1 = document.querySelector('.b1');
const searchbar2 = document.querySelector('.searchbar2');
const res2 = document.querySelector('.res2');

b1.addEventListener('click', (e) => {
	e.preventDefault();
//	e.stopPropagation();
    searchbar2.classList.toggle('active');
    res2.classList.toggle('active');
})

document.addEventListener('click', (e) => {
    if (!searchbar2.contains(e.target) && !res2.contains(e.target) && !b1.contains(e.target)) {
        searchbar2.classList.remove('active');
    }
})

document.addEventListener('click', (e) => {
    if (!res2.contains(e.target) && !searchbar2.contains(e.target) && !b1.contains(e.target)) {
        res2.classList.remove('active');
    }
})