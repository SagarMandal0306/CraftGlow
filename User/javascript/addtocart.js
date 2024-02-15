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

});