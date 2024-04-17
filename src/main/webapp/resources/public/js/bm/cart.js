'use strict'

const productImg = document.querySelector('.product-img');
const brand = document.querySelector(".p-brand");
const style =document.querySelector(".p-style");
const quantityEach =document.querySelector(".p-quantity");
const priceEach = document.querySelector(".price-each");
const pSize = document.querySelector(".p-size")
const subtotal = document.querySelector(".subtotal");


// data 가져오기

let cartItems = JSON.parse(localStorage.getItem("items"));
let totals=0;

//functions
const cartState = function(){
    if(!cartItems || cartItems.length === 0 )
     { 
    document.querySelector(".cart-state").insertAdjacentHTML('afterbegin', `
    <p class="empty-cart"> 장바구니가 비었습니다. </p>
    `);
  return;
}
  
   cartItems.forEach(item=> {
	const product = item.pvoData;
    const [small, medium, large] = item.size;
    const quantity = item.size.reduce((s, n) => s + n, 0);
    const price = item.price * quantity;
	totals += price;
     const html = ` 
 <div class="item-added">
        <div class="img-box col-1" style="background-image: url('${path}/resources/img/${product.pro_type}/${product.pro_img1}'); background-size: cover; background-position: center;"></div>              
        <div class="order-descriptions col-2">
         <span class="small-label">name </span><span class="p-name">${product.pro_name}</span> <br>
          <span class="small-label">style </span><span class="p-style">${product.description}</span><br>
         <span class="small-label">size </span><span class="p-size">${small != 0 ? 'small:' + small + ',' : ''}${medium != 0 ? 'medium:' + medium + ',' : ''}${large != 0 ? 'large:' + large : ''} </span><br>
         <span class="small-label">quantity </span><span class="p-quantity">${quantity} </span><br>
         <span class="small-label">price </span><span class="p-quantity">${product.price} </span>
        </div>
        <div class="col-3">                             
         <button class="item-remove" data-idx="${product.pro_idx}">remove</button>
         <a href="pro_detail.do?pro_idx=${product.pro_idx}" class="item-detail">detail</a>
        </div>
        <div class="col-4">
          <span class="price-each">${product.price*quantity} &#8361;</span>
        </div>    
        </div>                          
  `;
  
  subtotal.textContent= totals;
  document.querySelector(".cart-state").insertAdjacentHTML('afterbegin', html);
   })
   const remove = document.querySelectorAll(".item-remove");
   
   const removeItem = function(){
    const selectedItem = parseInt(this.dataset.idx);
    
   const leftItems = cartItems.filter(item=> parseInt(item.idx) !== selectedItem);
   console.log(leftItems);
      this.closest('.item-added').remove() 
      localStorage.setItem("items", JSON.stringify(leftItems));
 		cartItems = leftItems;
        
    if(leftItems.length===0){
        document.querySelector(".cart-state").insertAdjacentHTML('afterbegin', `
    <p class="empty-cart" > 장바구니가 비었습니다. </p>
    `);
    
    }
     
   }
 remove.forEach(btn => btn.addEventListener('click', removeItem));

}

cartState();
