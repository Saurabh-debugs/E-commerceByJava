<%-- 
    Document   : details
    Created on : Mar 20, 2021, 9:18:29 PM
    Author     : saurabh890
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
        <%@include file ="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file ="components/navbar.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <h1 style="text-align: center"> &nbsp; &nbsp; &nbsp; &nbsp; Welcome Back <%= user1.getUserName()%> !! </h1>
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                   <div class="card mt-4">  
                     <!--   <div class="card-header text-center text-black" style="background: white"> -->
                     <div style="text-align: center">
                            <img src="img/amazon.png" style="max-width: 100px;" class="img-fluid" alt="">
                            <h3>Your details</h3>
                     </div>
                     <!--   </div>   -->
                        <div class="card-body">

                            <form name = "myform_2">
                                <div class="form-group">
                                    <label for="UserName_1">Name:</label>
                                    <h6> <%= user1.getUserName()%></h6>
                                </div>
                                <div class="form-group">
                                    <label for="UserEmail_1">Email Id:</label>
                                    <h6><%= user1.getUserEmail()%></h6>
                                </div>
                                <div class="form-group">
                                    <label for="UserAddress_1">Address:</label>
                                    <h6><%= user1.getUserAddress()%></h6>
                                </div>
                                <div class="form-group">
                                    <label for="UserContact_1">Contact:</label>
                                    <h6><%= user1.getUserPhone()%></h6>
                                </div>

                            </form>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <%@include file="components/common_modals.jsp" %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
