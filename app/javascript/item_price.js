const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");

    const feeRate = 0.1;
    const feeAmount = Math.floor(inputValue * feeRate);
    addTaxDom.innerHTML = feeAmount;

    const profitDom = document.getElementById("profit");
    const salesProfit = inputValue - feeAmount;
    profitDom.innerHTML = salesProfit;
  });
};


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);