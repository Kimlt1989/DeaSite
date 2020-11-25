<%@page import="java.util.ArrayList"%>
<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="model.UserOrder"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserOrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Order</title>
        <%@ include file="checkAdmin.jsp" %>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
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

        <%
            UserOrderDAO userOrderDAO = new UserOrderDAO();
            List<UserOrder> userOrders = userOrderDAO.getUserOrder();

        %>
    </head>
    <body>
        <h1>Manage User Order Table</h1>

        <font style="color: #E83671"><h3>List of Not Confirm Order</h3></font>
        <p style="color: red">* You have to know that this list is the short list of this table for you to recognize the record.</p>
        <strong><div class="holder"></div></strong>
    </form>
    <table border="1">
        <thead>
            <tr>
                <th style="text-align: center">Id</th>
                <th style="text-align: center">Customer</th>
                <th style="text-align: center">Phone</th>
                <th style="text-align: center">Address</th>
                <th style="text-align: center">Order Date</th>
                <th style="text-align: center">Games</th>
                <th style="text-align: center">Total</th>
                <th style="text-align: center">Confirm</th>
            </tr>
        </thead>
        <tbody id="itemContainer">
            <%
                for (UserOrder each : userOrders) {
                    if (each.getConfirm() == 0) {
            %>
            <tr>
                <td><%=each.getOrderId()%></td>
                <td><%=each.getName()%></td>
                <td style="text-align: center"><%=each.getPhone()%></td>
                <td><%=each.getAddress()%></td>
                <td style="text-align: center"><%=each.getOrderDate()%></td>
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
                <td style="text-align: center"><%=totalPrice%> $</td>
                <td style="text-align: center"><a href="UserOrderConfirmServlet?confirm=<%=each.getOrderId() + "/" + totalPrice%>">Confirm This</a></td>
            </tr>
            <%                    }
                    }
                
            %>
        </tbody>
    </table>
    <hr>
    <br>
    <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a><br>
    <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Back to index</font></strong></a>
</body>
</html>
