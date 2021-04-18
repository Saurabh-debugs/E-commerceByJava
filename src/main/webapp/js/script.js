function add_to_cart(pid, pname, price){
    let cart = localStorage.getItem("cart");
    if(cart===null){
        // no cart yet ----
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
      //  console.log("product is added first time");
        showToast("Item is added to cart ");
    }else
    {
        // cart is already present --------
        let pcart = JSON.parse(cart);
       let oldProduct =  pcart.find((item) => item.productId == pid)
           if(oldProduct) {
               // only we have to increase the quantity
              oldProduct.productQuantity =  oldProduct.productQuantity + 1
              pcart.map((item)=>{
                  if(item.productId == oldProduct.productId){
                      item.productQuantity = oldProduct.productQuantity;
                  }
              })
              localStorage.setItem("cart",JSON.stringify(pcart));
           //   console.log("product quantity is increased ");
           showToast(oldProduct.productName + " Quantity is Increased  Quantity = " + oldProduct.productQuantity);
           }else{
               // we have to add the product
                let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
                pcart.push(product)
                localStorage.setItem("cart",JSON.stringify(pcart));
               // console.log("product is added")
                showToast("product is added to cart ");
           }
        
    }
   
    updateCart();  
  
    
}
// update the cart
function updateCart(){
  let cartString =  localStorage.getItem("cart");
  let cart = JSON.parse(cartString);
  if(cart == null || cart.length == 0){
      console.log("cart is empty");
      $(".cart-items").html("(0)");
      $(".cart-body").html("<h3>Cart does not have any Items</h3>");
      $(".checkout-btn").attr('disabled',true);
  }
  else{
      // there is something to show in the cart -------
        console.log(cart);
       $(".cart-items").html(`( ${cart.length} )`);
       let table = `
       <table class='table'>
        <thead class='thread-light'>
        <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        
        
        </tr>
        </thead>
        `;
        let totalPrice = 0;
       cart.map((item)=> {
            table +=`
            <tr>
            <td> ${item.productName}</td>
            <td> ${item.productPrice}</td>
            <td> ${item.productQuantity}</td>
            <td> ${item.productQuantity * item.productPrice}</td>
            <td> <button onclick='deleteItemFromcart(${item.productId})' class ='btn btn-danger btn-sm'>Remove</button> </td>
            </tr>  `
            totalPrice+= item.productPrice * item.productQuantity;
       })
        
        
        table = table + `
<tr><th class='text-align-right'>Total Price: &#x20B9;${totalPrice} </th></tr>
</table>`
        $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled',false);
  }
}
//delete item 
function deleteItemFromcart(pid)
{
   let cart = JSON.parse(localStorage.getItem('cart'));
   let newcart = cart.filter((item) => item.productId != pid);
   
   localStorage.setItem('cart',JSON.stringify(newcart))
   showToast("product is removed from Cart ");
   updateCart();
}


$(document).ready(function (){
    updateCart()
})


function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    },2000);
    }
   
function goTocheckout() {
    window.location = "checkout.jsp";
}



