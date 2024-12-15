const cards = document.querySelectorAll(".card");
const popupOverlay = document.getElementById("popupOverlay");
const popupCard = document.getElementById("popupCard");
cards.forEach((card) => {
  card.addEventListener("click", () => {
    popupOverlay.classList.add("active");
    popupCard.classList.add("active");
    popupCard.innerText = card.innerText;
  });
});

popupOverlay.addEventListener("click", () => {
  popupOverlay.classList.remove("active");
  popupCard.classList.remove("active");
});


	
