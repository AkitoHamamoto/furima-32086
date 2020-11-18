function calc () {
  const input_price = document.getElementById("item-price");
  const tax_price = document.getElementById("add-tax-price");
  const profit_price = document.getElementById("profit");

  input_price.addEventListener('input', () => {
    const price = input_price.value
    const tax = price * 0.1
    const profit = price - tax
    tax_price.innerHTML = tax
    profit_price.innerHTML = profit
  });
 
}

setInterval(calc, 1000);