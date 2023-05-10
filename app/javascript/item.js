window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    taxprice = document.getElementById("add-tax-price");
    taxprice.innerHTML = Math.round(priceInput.value * 0.1 );

    profit = document.getElementById("profit");
    profit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ));

  })
});