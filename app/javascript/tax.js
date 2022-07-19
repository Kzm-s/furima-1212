function tax () {
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener("input", () => {
    const price = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML = price - addTaxPrice.innerHTML;
    });
}

window.addEventListener('load', tax);