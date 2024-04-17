const reviewFiles = document.querySelectorAll(".review-file");
const fileButton = document.querySelectorAll(".file-button");
const fileInputs = document.querySelectorAll(".file");
const remove = document.querySelectorAll(".remove");
const starImgs = document.querySelectorAll(".star");
const reviewText = document.querySelector(".review-q-gray");

const handleStar = function (e) {
  const num = e.target.dataset.point;
  switch (num) {
    case "1":
      reviewText.textContent = "별로에요";
      break;
    case "2":
      reviewText.textContent = "그저그래요";
      break;
    case "3":
      reviewText.textContent = "괜찮아요";
      break;
    case "4":
      reviewText.textContent = "만족해요";
      break;
    case "5":
      reviewText.textContent = "최고에요";
      break;
  }

  starImgs.forEach((img, i) => {
    img.src = `${path}/resources/img/star.png`;
    if (i < num) img.src = `${path}/resources/img/yellow.png`;
  });
};

starImgs.forEach((star) => star.addEventListener("click", handleStar));


