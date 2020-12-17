

<%@page import="model.Games"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.Games"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Games Detail</title>
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>
        <link rel="stylesheet" href="subCss/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
        <script type="text/javascript" src="subCss/jquery.fancybox.pack.js?v=2.1.5"></script>
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
      
        <!--=======content================================-->
        <script type="text/javascript">
            $(document).ready(function() {
                $(".fancybox").fancybox();
            });
        </script>
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    <div class="grid_12">
                        <%
                            Games game = (Games) request.getAttribute("games");
                        %>
                        <h3><%=game.getName()%></h3>
                        
                        <br>
                        <table border="3">
                            <tr>
                                <td rowspan="17" align="center">
                                    <a class="fancybox" rel="group" href="images/GameImages/<%=game.getImage()%>"><img src="images/GameImages/<%=game.getImage()%>" alt="" /><br><strong>Click to Enlarge</strong></a></td>
                            </tr>
                            <tr>
                                <td  width="150" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Description</strong> </td>
                                <td align="left" width="600px"><strong><%=game.getDescription()%></strong></td>
                            </tr>
                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Issue Date </strong></td>
                                <td align="left"><%=game.getIssuedate()%></td>
                            </tr>

                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Status:</strong></td>
                                <td align="left"><font style="color: deeppink"><strong><%=game.getStatus() > 0 ? "Available" : "Out Of Stock"%></strong></font></td>
                            </tr>

                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Price:</strong></td>
                                <td align="left"><font style="color: #0000FF"><strong><%=game.getPrice()%> USD<strong></font></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td align="center"> <div class="clear"></div>
                                                    <a href="ShoppingCartServlet?gameId=<%=game.getId()%>" class="btn">Add to Cart</a>
                                                    <a href="ShoppingCartServlet?gameId=<%=game.getId()%>" class="btn">Buy Now!</a>
                                                </td>
                                            </tr>
                                            </table>
                                            
                                            </br>
                                            <center style="margin-right: 350px">
                                                <font style="color: #0000FF"><strong>Trailer:</strong></font><br><br/>
                                                <iframe  width="640" height="360" src="<%=game.getTrailer()%>" allowfullscreen></iframe></center>
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
