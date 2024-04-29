document.addEventListener('DOMContentLoaded', function () {
    let qtyBox = document.querySelectorAll(".qty .box");

    qtyBox.forEach((box) => {

        let qtyMinus = box.querySelector(".qty .box span:first-child"); // Selects the "-" span
        let qtyPlus = box.querySelector(".qty .box span:last-child"); // Selects the "+" span
        let qty = box.querySelector(".qty .box .qt");


        qtyMinus.onclick = () => {
            let number = parseInt(qty.value);
            if (number != 1) {
                qty.value = number - 1;
                let id = qty.getAttribute("data-id");
                location.href = `Addtocart.aspx?qty=${qty.value}&cid=${id}`;
            }
        }

        qtyPlus.onclick = () => {
            let number = parseInt(qty.value);
            qty.value = number + 1;
            let id = qty.getAttribute("data-id");
            location.href = `Addtocart.aspx?qty=${qty.value}&cid=${id}`;
        }
    })

    

  
});