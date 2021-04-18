

<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazon</title>
        <%@include file ="components/common_css_js.jsp" %>

    </head>
    <body> 
        <!--style="background: url(img/b12.jpg);background-size: cover;background-attachment:fixed;"-->
        <%@include file ="components/navbar.jsp" %>
        <br>

        <%@include file ="components/slideshow.jsp" %>
        <br>

        <%@include file="components/ShowCategory.jsp" %> 
        <br>
        <div class="row mt-2 mx-2">
            <%                String cat = request.getParameter("category");
                //  out.println(cat);
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {

                    int cid = Integer.parseInt(cat);
                    list = dao.getAllProductsById(cid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
            <!-- show Category -->
            <div class="col-md-2">
                <div class="list-group mt-4 ">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg">
                        All Products 
                    </a>




                    <%
                        for (Category c : clist) {


                    %>  

                    <a href="index.jsp?category=<%=c.getCategoryId()%> " class="list-group-item list-group-item-action"><b><%= c.getCategoryTitle()%></b></a>  
                            <%
                                }

                            %>
                </div>
            </div>
            <!-- show products -->
            <div class="col-md-10" >
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class ="card-columns">
                            <!--- traversing product -->

                            <%                                for (Product p : list) {

                            %>
                            <!-- product card -->
                            <div class="card">

                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto()%>" style=" max-height: 200px; max-width: 95%; width: auto;" class="card-img-top m-2"  alt="...">
                                </div>
                                <div class="card-body">

                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text">
                                        <%= Helper.get10words(p.getpDesc())%>

                                    </p>

                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick ="add_to_cart(<%=p.getPId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingdiscount()%>)">Add to Cart</button>
                                    <button class="btn-outline-success"><b>&#8377;<%= p.getPriceAfterApplyingdiscount()%></b>/-<span class="text-secondary discount-label"><b>&#8377;<%=p.getpPrice()%>&nbsp;&nbsp; <%=p.getpDiscount()%>% off</b></span></button>
                                </div>
                                
                            </div>

                            <%  }
                                if (list.size() == 0) {
                                    out.println("<h4>Currently No product is Available !!</h4>");
                                }
                            %>

                        </div>

                    </div>
                </div>

            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
        <br>
        <br>
        <%@include file="components/footer.jsp" %>










    </body>
</html>
