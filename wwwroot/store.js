document.querySelector(".cart-qty-minus1").setAttribute("disabled","disabled");
var valueCount1
document.querySelector(".cart-qty-plus1").addEventListener("click",function(){
    valueCount1= document.getElementById("quantity1").value;
    valueCount1++;
    document.getElementById("quantity1").value=valueCount1;
    if(valueCount1>1){
        document.querySelector(".cart-qty-minus1").removeAttribute("disabled")
        document.querySelector(".cart-qty-minus1").classList.remove("disabled")
    }
})

document.querySelector(".cart-qty-minus1").addEventListener("click",function(){
    valueCount1= document.getElementById("quantity1").value;
    valueCount1--;
    document.getElementById("quantity1").value=valueCount1;

    if(valueCount1==0){
        document.querySelector(".cart-qty-minus1").setAttribute("disabled","disabled")
    }
})

document.querySelector(".cart-qty-minus2").setAttribute("disabled","disabled");
var valueCount2
document.querySelector(".cart-qty-plus2").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity2").value;
    valueCount2++;
    document.getElementById("quantity2").value=valueCount2;
    if(valueCount2>1){
        document.querySelector(".cart-qty-minus2").removeAttribute("disabled")
        document.querySelector(".cart-qty-minus2").classList.remove("disabled")
    }
})

document.querySelector(".cart-qty-minus2").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity2").value;
    valueCount2--;
    document.getElementById("quantity2").value=valueCount2;

    if(valueCount2==0){
        document.querySelector(".cart-qty-minus2").setAttribute("disabled","disabled")
    }
})


document.querySelector(".cart-qty-minus3").setAttribute("disabled","disabled");
var valueCount2
document.querySelector(".cart-qty-plus3").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity3").value;
    valueCount2++;
    document.getElementById("quantity3").value=valueCount2;
    if(valueCount2>1){
        document.querySelector(".cart-qty-minus3").removeAttribute("disabled")
        document.querySelector(".cart-qty-minus3").classList.remove("disabled")
    }
})

document.querySelector(".cart-qty-minus3").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity3").value;
    valueCount2--;
    document.getElementById("quantity3").value=valueCount2;

    if(valueCount2==0){
        document.querySelector(".cart-qty-minus3").setAttribute("disabled","disabled")
    }
})

document.querySelector(".cart-qty-minus4").setAttribute("disabled","disabled");
var valueCount2
document.querySelector(".cart-qty-plus4").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity4").value;
    valueCount2++;
    document.getElementById("quantity4").value=valueCount2;
    if(valueCount2>1){
        document.querySelector(".cart-qty-minus4").removeAttribute("disabled")
        document.querySelector(".cart-qty-minus4").classList.remove("disabled")
    }
})

document.querySelector(".cart-qty-minus4").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity4").value;
    valueCount2--;
    document.getElementById("quantity4").value=valueCount2;

    if(valueCount2==0){
        document.querySelector(".cart-qty-minus4").setAttribute("disabled","disabled")
    }
})

document.querySelector(".cart-qty-minus5").setAttribute("disabled","disabled");
var valueCount2
document.querySelector(".cart-qty-plus5").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity5").value;
    valueCount2++;
    document.getElementById("quantity5").value=valueCount2;
    if(valueCount2>1){
        document.querySelector(".cart-qty-minus5").removeAttribute("disabled")
        document.querySelector(".cart-qty-minus5").classList.remove("disabled")
    }
})

document.querySelector(".cart-qty-minus5").addEventListener("click",function(){
    valueCount2= document.getElementById("quantity5").value;
    valueCount2--;
    document.getElementById("quantity5").value=valueCount2;

    if(valueCount2==0){
        document.querySelector(".cart-qty-minus5").setAttribute("disabled","disabled")
    }
})