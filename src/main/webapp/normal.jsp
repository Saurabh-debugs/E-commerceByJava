<%@page import="com.mycompany.mycart.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not Logged in !! please login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are not Normal user !! do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to amazon </title>
        <%@include file="components/common_css_js.jsp" %> 
    </head>
    <body > <!--style="background: url(img/b12.jpg);background-size: cover;background-attachment:fixed;"-->

        <%@include file="components/navbar.jsp" %>
        <br>
       
        <%@include file="components/slideshow.jsp" %>
       
       <%@include file="components/ShowCategory.jsp" %> 
       
            
        <br>
        <br>
        <br>
        <br>


            <%@include file="components/footer.jsp" %>



    </body>
</html>
