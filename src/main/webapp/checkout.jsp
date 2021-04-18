<%-- 
    Document   : checkout
    Created on : Mar 20, 2021, 6:28:04 PM
    Author     : saurabh890
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check-Out</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <br>
        <br>
        <br>
        <br>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!-- card Details -->
                    <div class="card">
                        <div class="card-header custom-bg text-white">
                        <h3 class="text-center mt-1">Your Selected Items</h3>
                        </div>
                        <div class="cart-body">

                        </div> 
                    </div>

                </div>
                <div class="col-md-6">
                    <!-- form details -->
                    <div class="card">
                        <div class="card-header custom-bg text-white">
                        <h3 class="text-center mt-2">Your Details for Order</h3>
                        </div>
                        <div class="card-body">
                            <form method="post" action="#">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="exampleInputname"><b>Your Name</b></label>
                                        <input value="<%= user1.getUserName()%>" type="text" class="form-control" id="name_1" aria-describedby="emailHelp" placeholder="Enter your Name">
                                    </div>
                                    <label for="exampleInputEmail1"><b> Email Id</b></label>
                                    <input value="<%= user1.getUserEmail()%>" type="email" class="form-control" id="email_1" aria-describedby="emailHelp" placeholder="Enter email Id">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputContactNo"><b> Contact No</b></label>
                                    <input value="<%= user1.getUserPhone()%>" type="text" class="form-control" id="phone_1" aria-describedby="emailHelp" placeholder="Enter Your Contact No">
                                </div>
                                <div class="form-group">
                                    <label for="address_2"><b>Address</b></label>
                                    <textarea value="<%= user1.getUserAddress()%>" class="form-control" id="address_2" rows="3"></textarea>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-outline-success">Order Now </button>
                                    <button class="btn btn-outline-primary">Continue Shopping </button>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>

            </div>
        </div>





        <%@include file="components/common_modals.jsp" %>
        <br>
        <br>
        <br>
         <%@include file="components/footer.jsp" %>
    </body>
</html>
