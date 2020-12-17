
<%@page import="model.Games"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.GameDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.UserOrderDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>     
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        <!--=======content================================-->
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    <div class="grid_12">
                        <h3>Order Details</h3><hr>
                        <%
                             DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                             LocalDateTime now = LocalDateTime.now();
                             String orderDate = dtf.format(now);
                            
                            if (userId == null) {
                                out.write("<script type='text/javascript'>\n");
                                out.write("alert(' You have to login or register to ");
                                out.write("buy films. Thanks!');\n");
                                out.write("setTimeout(function(){window.location.href='register.jsp'},1000);");
                                out.write("</script>\n");
                                return;
                            } else {
                                String gameId = (String) request.getParameter("gameId");
                                int intUserId = Integer.parseInt(userId);
                                int confirm = 0;
                                UserDAO userDAO = new UserDAO();
                                GameDAO gameDAO = new GameDAO();
                               
                                User desUser = userDAO.findUserById(userId);
                                String desUserName = desUser.getFirstName() + " " + desUser.getLastName();
                                UserOrder userOrder = new UserOrder(intUserId, desUserName, desUser.getPhone(), desUser.getAddress(), 0, gameId, orderDate);
                                UserOrderDAO userOrderDAO = new UserOrderDAO();
                                userOrderDAO.addNewOrder(userOrder);
                                int id = Integer.getInteger(userOrder.getGameId());
                          
                           
                                
                               
                                out.println("Thank "+ desUserName +" ! We will call you to confirm this order.");
                            }
                        %>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--==============================footer=================================-->
        <%@ include file="footer.jsp" %>
    </body>
</html>
