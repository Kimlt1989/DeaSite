

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="dao.UserDAO"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script type="text/javascript" src="js/jquery.js"></script>
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/sForm.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <link rel="stylesheet" href="animate.min.css" type="text/css" />
        <link rel="stylesheet" href="animate.delay.css" type="text/css" />
        <script type="text/javascript" src="js/placeholder.js"></script>
        <link rel="stylesheet" href="css/loginStyle.css">
        <style type="text/css">
            input.parsley-error
            {
                color: #FF0000 !important;
                background-color: #F2DEDE !important;
                border: 1px solid #EED3D7 !important;
            }
            ul.parsley-error-list
            {
                font-size: 11px;
                margin: 2px;
                list-style-type:none;
                color: #FF0000
            }

            ul.parsley-error-list li
            {
                line-height: 11px;
            }

            .auto-style1 {
                border: 1px solid #FFFF00;
                background-color: #000000;
            }
            .auto-style2 {
                color: #FFFF00;
                text-align: center;
            }
            .auto-style3 {
                color: #FFFF00;
            }
            .auto-style4 {
                color: #FFFF00;
                text-align: right;
            }


        </style>
 
        <title>Login</title>

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div style="margin-top: 800px" class="container">

            <form id="slick-login" action="LoginServlet" method="post">
                <label for="username">username</label><input type="text" name="username" class="placeholder" placeholder="your username">
                <label for="password">password</label><input type="password" name="password" class="placeholder" placeholder="your password">
                <input type="submit" value="Log In" name="submit">                    
            </form>
                        <a href="register.jsp" class="ahref">A
                                </a>
          

        </div>
    </body>
</html>
