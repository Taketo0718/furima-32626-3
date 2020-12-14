function calc (){
  const item_price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")


  item_price.addEventListener("keyup", function() {
    console.log("yes!")
    value = item_price.value
    value2 = Math.floor(value * 0.1)
    add_tax_price.innerHTML = value2
    profit.innerHTML = value - value2
  })
}
window.addEventListener('load', calc);