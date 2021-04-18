<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
        <%@include file ="components/common_css_js.jsp" %>
        <script>
            function name_pass_check() {
                if (document.myform.user_name.value == "")
                {
                    alert("Please provide your name!");

                    return false;
                }
                if (document.myform.user_email.value == "") {
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
                if (document.myform.user_password.value == "")
                {
                    alert("Please provide passward");

                    return false;
                }

                var phoneno = /^\d{10}$/;
                if (document.myform.user_phone.value.match(phoneno))
                {
                    return true;
                } else
                {
                    alert("Please enter the correct phone number");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <!--style="background: url(img/b12.jpg);background-size: cover;background-attachment:fixed;"-->
        <%@include file ="components/navbar.jsp" %>
        <br> 
        <br> 
        <br> 
         
        <div class="row mt-4">

            <div class="col-md-4 offset-md-4">


                <div class="card">
                    <%@include file="components/message.jsp" %>
                    <div class="card-body px-3">
                        <div class="container text-center">
                            <img src="img/amazon.png" style="max-width: 110px;" class="img-fluid" alt="pic">
                        </div>
                        <h3 class="text-center my-1">Signup here !!</h3>
                        <form name ="myform" action="Registerservlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder ="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder ="Enter your email-Id">
                            </div>
                            <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder ="Enter your Password">
                            </div>
                            <div class="form-group">
                                <label for="phone">User Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" placeholder ="Enter your Phone number">
                            </div>
                            <div class="form-group">
                                <label for="address">User Address</label>
                                <textarea name="user_address" style="height: 110px;" class="form-control" placeholder="Enter your address"></textarea>
                            </div>
                            <a href="login.jsp" class="text-center d-block mb-3">Existing user click here</a>
                            <div class="container text-center">
                                <button class="btn btn-outline-success" onclick=" return name_pass_check();">Register</button>
                                <button class="btn btn-outline-warning" type="reset">Reset</button>
                            </div>

                        </form>
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
