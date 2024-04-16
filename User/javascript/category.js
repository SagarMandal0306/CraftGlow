document.addEventListener('DOMContentLoaded', function () {
    let cartItems = document.querySelectorAll(".cart-add");

    cartItems.forEach((item) => {
        item.addEventListener("click", () => {
            item.innerText = "Go to Cart";
            // You can add more logic here to handle cart functionality
        });
    });


   
});