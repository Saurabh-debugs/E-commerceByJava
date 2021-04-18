
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - Amazon</title>
        <%@include file ="components/common_css_js.jsp" %>
        <script>
            function name_pass_1_check() {
                if (document.myform_1.email.value == "") {
                    alert("please provide email id")
                    return false;
                } else {
                    var x = document.myform.user_email.value;
                    var atposition = x.indexOf("@");
                    var dotposition = x.lastIndexOf(".");
                    if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length) {
                        alert("Please enter a valid e-mail address \n atpostion:" + atposition + "\n dotposition:" + dotposition);
                        return false;
                    }
                }
                if (document.myform_1.password.value == null)
                {
                    alert("Please provide passward");

                    return false;
                }
            }
        </script>
    </head>
    <body>
        
    <!-- style="background: url(img/b2.jpeg);background-size: cover;background-attachment:fixed;"-->
        <%@include file ="components/navbar.jsp" %>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header text-center text-black" style="background: white">
                            <img src="img/amazon.png" style="max-width: 100px;" class="img-fluid" alt="">
                            <h3>Login-here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form name = "myform_1" action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-left d-block mb-3">if not registered click here</a>
                           
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg" onclick=" return name_pass_1_check();">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg">Reset</button>
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
                            <%@include file="components/footer.jsp" %>
    </body>
</html>
