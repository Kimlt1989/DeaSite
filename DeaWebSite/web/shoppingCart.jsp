

<%@page import="model.UserOrder"%>
<%@page import="dao.UserOrderDAO"%>
<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="dao.UserDAO"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
      <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
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
                    <div class="">
                        <h3>Your Cart</h3>
                        
                        <%
                            if (userId == null) {
                                out.write("<script type='text/javascript'>\n");
                                out.write("alert(' You have to login or register to ");
                                out.write("buy games. Thanks!');\n");
                                out.write("setTimeout(function(){window.location.href='register.jsp'},1000);");
                                out.write("</script>\n");
                                return;
                            }
                        %>
                        <table border="2"> 
                            <tr>
                                <td align="center" width="50"><strong>No.</strong></td>
                                <td align="center" width="500"><strong>Game Name</strong></td>
                                <td align="center" width="100"><strong>Price</strong></td>
                                <td align="center" width="300"><strong>&nbsp;</strong></td>
                            </tr>
                            <%
                                List<String> gameIds = (List<String>) session.getAttribute("cart");
                                if (gameIds == null) {
                                    out.println("<tr><td></td><td><br><font style=\"color: red\"><strong>There is no item in your cart now</strong></font></td></tr>");
                                } else {
                                    String remove = request.getParameter("remove");
                                    double total = 0.0;
                                    String append = "";
                                    if (remove == null) {
                                        remove = "";
                                        int i = 0;
                                        for (String each : gameIds) {
                                            GameDAO gameDao = new GameDAO();
                                            int id = Integer.parseInt(each);
                                            Games game = gameDao.findExactlyGames(id);
                                            i++;
                                            total += game.getPrice();
                                            append += "<tr><td align=\"center\">" + i + "</td>";
                                            append += "<td align=\"center\">" + game.getName() + "</td>";
                                            append += "<td align=\"center\">" + game.getPrice() + "USD</td>";
                                            append += "<td align=\"center\"><a href=\"shoppingCart.jsp?remove=" + i
                                                    + "\"><font style=\"color: #0000FF\">Remove</a></font>" + "</td>";
                                            append += "</tr>";
                                        }
                                        append += "<tr><td colspan=\"2\" align=\"right\"><font style=\"color: #FF0000\"><strong>Total:</strong></font></td>";
                                        append += "<td align=\"center\">" + total + "USD</td><td align=\"center\"><a href =\"success.jsp\" class=\"btn\">Buy Now !</a></td></tr>";
                                        out.println(append);
                                    } else {
                                        int tempRemove = Integer.parseInt(remove);
                                        int removeIndex = tempRemove - 1;
                                        gameIds.remove(removeIndex);
                                        session.setAttribute("cart", gameIds);
                                        response.sendRedirect("shoppingCart.jsp");
                                    }
                                }
                            %>
                        </table>
                        <script src="js/Jpages.js"></script>
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
                        <h4><font style="color: #2F0916">Your Shopping History</h4></font>
                        <strong><div class="holder"></div></strong>
                        <table>
                            <thead><tr><th>No.</th><th>Games</th><th>Total Price</th><th>Confirm</th><th>Delivery</th></thead>
                            <tbody id="itemContainer">
                                <%
                                    UserOrderDAO userOrderDAO = new UserOrderDAO();
                                    int intUserId = Integer.parseInt(userId);
                                    List<UserOrder> userOrderList = userOrderDAO.findExactlyUserOrderByOneUser(intUserId);
                                    int no = 0;
                                    for (UserOrder each : userOrderList) {
                                        no += 1;
                                %>
                                <tr>
                                    <td><%=no%></td>
                                    <td><%
                                        String game = each.getGameId();
                                        String[] games = game.split(";");
                                        double totalPrice = 0;
                                        for (int y = 0; y < games.length; y++) {
                                            GameDAO gameDAO = new GameDAO();
                                            int gameID = Integer.parseInt(games[y]);
                                            Games game1 = gameDAO.findExactlyGames(gameID);
                                            out.println("<strong>" + game1.getName() + "</strong>" + " || ");
                                            totalPrice += game1.getPrice();
                                        }
                                        %></td>
                                    <td><%=totalPrice + " $"%></td>
                                    <td><%if (each.getConfirm() == 0) {
                                            out.println("Not Yet");
                                        } else {
                                            out.println("Done");
                                        }%></td>
                                        <td><%//Update heare
                                            out.println("update here");%></td>
                                </tr>
                                <%                                   }
                                %>
                            </tbody>
                        </table>

                        <!----- end ---------------->
                    </div>
                    <div class="clear"></div>
                    <br><br><a href="products.jsp"><font style="color: #0000FF"><strong><<< Back To 
                            Game List</strong></font></a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--==============================footer=================================-->
        <%@ include file="footer.jsp" %>
    </body>
</html>