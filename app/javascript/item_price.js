window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    inputValue = itemPrice.value;
    const addTax = document.getElementById("add-tax-price");
    const priceTax = inputValue * 0.1;
    addTax.innerHTML = Math.floor(priceTax);
    const profit = document.getElementById("profit");
    const priceProfit = inputValue - addTax.innerHTML;
    profit.innerHTML = priceProfit;
  });
});