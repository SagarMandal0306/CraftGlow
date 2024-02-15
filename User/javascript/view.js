

document.addEventListener('DOMContentLoaded', function() {
    let qtyMinus = document.querySelector(".qty .box span:first-child"); // Selects the "-" span
    let qtyPlus = document.querySelector(".qty .box span:last-child"); // Selects the "+" span
    let qty=document.querySelector(".qty .box span:nth-child(2)");
    
    
    qtyMinus.onclick=()=>{
        let number=parseInt(qty.textContent);
        if(number!=0){
            qty.textContent=number-1;
            
        }
    }

    qtyPlus.onclick=()=>{
        let number=parseInt(qty.textContent);
        qty.textContent=number+1;
    }


    document.addEventListener("DOMContentLoaded", function() {
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
      
    
});


