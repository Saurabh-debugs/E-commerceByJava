<%@page import="com.mycompany.mycart.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");

%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg fixed-top">
    <div class="container">
        <!--img src="img/amazon.png" style="max-width: 40px;" -->
        <a class="navbar-brand py-0" href="index.jsp">Amazon</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">
                <li class="nav-item active">
                    <a class="nav-link py-0" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link  py-0 dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <b> My account </b>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%              if (user1 == null) {
                        %> 
                         <a class="dropdown-item" href="#">My Details</a>
                         <a class="dropdown-item" href="details.jsp">My Details</a>
                        <a class="dropdown-item" href="#">My Order</a>
                        <a class="dropdown-item" href="#">Payment</a>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                         <% } else {
                             %>
                        <a class="dropdown-item" href="details.jsp">My Details</a>
                        <a class="dropdown-item" href="#">My Order</a>
                        <a class="dropdown-item" href="#">Payment</a>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <% }
                            %>
                    </div>
                </li>
            </ul>
            <!-- search bar -->
            <div class="search-bar mt-2 mb-2">
                <input type="hidden" name="search_param" value="all" id="search_param">
                <input type="text" class="form-control" name="x" id="search" placeholder="Search">

            </div>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item active mt-2">

                    <a class="nav-link " href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 20px"><span class="ml-2 cart-items">(0)</span></i> </a>
                </li>
                <%              if (user1 == null) {
                %>  

                <li class="nav-item active ml-3 mt-2">

                    <a class="nav-link " href="login.jsp">Login </a>
                </li>
                <li class="nav-item active mt-2 ">
                    <a class="nav-link  " href="register.jsp">Signup</a>
                </li>
                <%   } else {
                    if (user1.getUserType().equals("admin")) { 
 
                %>
                <li class="nav-item active mt-2">
                    <a class="nav-link" href="admin.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active mt-2">
                    <a class="nav-link " href="LogoutServlet">Logout</a>
                </li> 

                <%
                    }
                    else{
                %>
                <li class="nav-item active mt-2">
                    <a class="nav-link" href="details.jsp"><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active mt-2">
                    <a class="nav-link " href="LogoutServlet">Logout</a>
                </li> 
                <% }
                    }
                %>

            </ul>
        </div>
    </div>
</nav>
