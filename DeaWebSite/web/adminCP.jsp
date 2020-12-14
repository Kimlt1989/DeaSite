


<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Movies</title>
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/Jpages.js"></script>
        <script src="js/superfish.js"></script>
     <script type="text/javascript">
            $(function() {
                /* initiate plugin */
                $("div.holder").jPages({
                    containerID: "itemContainer",
                    perPage: 10,
                    previous: "←",
                    next: "→",
                    delay: 20
                });
            });
        </script>
        <style type="text/css">
            .holder {
                margin:15px 0;
            }
            .holder a {
                font-size:12px;
                cursor:pointer;
                margin:0 5px;
                color:#333;
            }
            .holder a:hover {
                background-color:#222;
                color:#fff;
            }
            .holder a.jp-previous {
                margin-right:15px;
            }
            .holder a.jp-next {
                margin-left:15px;
            }
            .holder a.jp-current,a.jp-current:hover {
                color:#FF4242;
                font-weight:bold;
            }
            .holder a.jp-disabled,a.jp-disabled:hover {
                color:#bbb;
            }
            .holder a.jp-current,a.jp-current:hover,.holder a.jp-disabled,a.jp-disabled:hover {
                cursor:default;
                background:none;
            }
            .holder span {
                margin: 0 5px;
            }          
        </style>
        <style type="text/css">
            table{ width: 100%;}
            td, th{ text-align: left; height:25px; }
            th { background: #f5f5f5; }
        </style>
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
    <%
        userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp");
        return;
    } else {
        UserDAO userDAO1 = new UserDAO();
        boolean isAdmin = userDAO1.findAdminAccount(userId);
        if (isAdmin == false) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
         
        <!--=======content================================-->
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    
                    <h2 style="color: #0000FF">Admin Section</h2>
                    </br>
                 
        <a href="adminManageGame.jsp">1. Manage Game Table</a><br><br>
        <a href="adminManageCategories.jsp">2. Manage Categories Table</a><br><br>
        <a href="adminManageSuppliers.jsp">3. Manage Supplier Table</a><br><br>
        <a href="adminManageUser.jsp">4. Manage User Table</a><br><br>
        <a href="adminConfirm.jsp">5. Confirm Order</a><br><br>
<!--        <a href="adminSentNew.jsp">6. Send News to Subscribe people</a><br><br>-->
<!--        <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Back to index</font></strong></a>-->
                    
                </div>
            </div>
        </div>
        <!--==============================footer=================================-->
     
        <%@ include file="footer.jsp" %>
    </body>
</html>