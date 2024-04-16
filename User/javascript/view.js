

document.addEventListener('DOMContentLoaded', function() {
    let qtyMinus = document.querySelector(".qty .box span:first-child"); // Selects the "-" span
    let qtyPlus = document.querySelector(".qty .box span:last-child"); // Selects the "+" span
    let qty=document.querySelector(".qty .box .qt");
    
    
    qtyMinus.onclick=()=>{
        let number=parseInt(qty.value);
        if(number!=0){
            qty.value=number-1;
            
        }
    }

    qtyPlus.onclick=()=>{
        let number=parseInt(qty.value);
        qty.value=number+1;
    }

    let cartItems = document.querySelectorAll(".cart-add");

    cartItems.forEach((item) => {
        item.addEventListener("click", () => {
            item.innerText = "Go to Cart";
            // You can add more logic here to handle cart functionality
        });
    });

  
        const stars = document.querySelectorAll('.star-rating input');
      
        stars.forEach((star, index) => {
          star.addEventListener('change', () => {
            for (let i = 0; i <= index; i++) {
              stars[i].parentNode.classList.add('selected');
            }
            for (let i = index + 1; i < stars.length; i++) {
              stars[i].parentNode.classList.remove('selected');
            }
          });
        });
      
      
    
});


