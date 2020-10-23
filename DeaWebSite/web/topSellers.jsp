

<%@page import="model.Games"%>
<%@page import="java.util.List"%>
<%@page import="dao.GameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Seller</title>
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>     
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        <hr style="height:10px;background-color:#069" color="#003399"/>
        <!--=======content================================-->
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    <div class="grid_12">
                        <h3>Top Seller</h3>
                        <ul id="itemContainer" style="padding-right: 50px">
                              <%
                        GameDAO gameDAO = new GameDAO();
                        int numberOfFilms = 8;
                        List<Games> games = gameDAO.getTopSellerGames();
                        if (games != null) {
                            for (Games each : games) {
                               
                    %>

                    
                     <li><div class="grid_4">
                            <div class="img_inner fleft"><img src="images/GameImages/<%=each.getImage()%>" alt="">
                                
                            </div>
                       
                        <div class="extra_wrapper">
                            <p class="col1"><strong><%=each.getName()%>
                                </strong><br/>
                                Price: <font style="color: red">$<%=each.getPrice()%></font>
                            </p>
                                    
                            <br>
                            <a href="GamesDetailServlet?gameId=<%=each.getId()%>" class="btn">Detail</a>
                        </div>
                    </div>
                    </li>
                    
                    <%
                            }
                        }
                    %>

                     </ul>  
                    </div>
                    <div class="clear"></div>
                    <br><br><a href="index.jsp"><strong><font style="color: #0000FF"><<< Back to Index</font></strong></a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--==============================footer=================================-->
        <hr style="height:10px;background-color:#069" color="#003399"/>
        <%@ include file="footer.jsp" %>
    </body>
</html>
