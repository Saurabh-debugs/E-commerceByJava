<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="net.bytebuddy.asm.Advice.ArgumentHandler.Factory"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not Logged in !! please login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin !! do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }

%>

<%    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();

  // getting count 
  Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazon - Admin Page </title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: url(img/b12.jpg);background-size: cover;background-attachment:fixed;">
        <%@include file="components/navbar.jsp" %>
        <br>
        <br>
        <br>

        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid rounded-circle" src="img/group.png" alt="user_icon">
                            </div>
                            <h1>Users</h1>
                            <h1><%= m.get("userCount")%></h1>
                        </div>
                    </div> 
                </div> 
                <!-- second col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid rounded-circle" src="img/interface.png" alt="user_icon">
                            </div>
                            <h1>Categories</h1>
                            <h1><%= list.size()%></h1>
                        </div>
                    </div> 
                </div>
                <!-- third col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                            </div>
                            <h1>Products</h1>
                            <h1><%= m.get("productCount")%></h1>
                        </div>
                    </div> 

                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid rounded-circle" src="img/content1.png" alt="user_icon">
                            </div>
                            <p>click here to add the category</p>
                            <h1>Add-Categories</h1>

                        </div>
                    </div> 
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid rounded-circle" src="img/shopping-cart.png" alt="user_icon">
                            </div>
                            <p>click here to add the product</p>
                            <h1>Add-Products</h1>

                        </div>
                    </div> 
                </div>
            </div>

        </div>
        <!-- add category model -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 250px;" class="form-control" placeholder="Enter Category description" name="catDescription" required /></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!-- end category model -->

        <!-- add product modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- form -->
                        <form action ="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter name of your product" name="pName" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 80px;" class="form-control" placeholder="Enter product description" name="pDescription" required /></textarea> 
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product price " name="pPrice" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Discount " name="pDiscount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity " name="pQuantity" required/>
                            </div>





                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <% for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%></option>
                                    <% }
                                       %> 
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Select Product picture</label>
                                <br>
                                <input type="file" name="pPic" required />

                            </div>
                            <div class="container text-center">
                                <button class="btn-outline-success">Add Product</button>
                            </div>
                        </form>




                        <!-- End Form -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <br>
        <%@include file="components/common_modals.jsp" %>

        <!-- end product modal -->
        <%@include file="components/footer.jsp" %>
    </body>
</html>
