<!-- Button trigger modal -->
<%@page import="com.mycompany.mycart.entities.User"%>

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel" >Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="cart-body">
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <% User user_1 = (User) session.getAttribute("current-user");
            if(user_1 == null) {
        %>
        <button type="button" class="btn btn-primary checkout-btn">Check Out</button>
        <% } else {
        %>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goTocheckout()">Check Out</button>
         <% }
         %>
      </div>
    </div>
  </div>
</div>
<div id="toast">this is our custom Toast text</div>