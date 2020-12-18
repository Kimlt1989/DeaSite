<%-- 
 
    Author     : KIM LY
--%>

<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.UserOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PrintReceipt</title>
    </head>
    <body>
        <h1>Receipt</h1>
        <%
            UserOrder userOrder = (UserOrder) request.getAttribute("userOrder");
            OrderDetail orderDetail = (OrderDetail) request.getAttribute("orderDetail");
        %>

        <table border="1">
            <tr>
                <td colspan="4" align="center"><strong>Game Store</strong></td>
            </tr>
            <tr>
                <td><strong>Customer:</strong></td>
                <td><%=userOrder.getName()%></td>
                <td><strong>Phone</strong></td>
                <td><%=userOrder.getPhone()%></td>
            </tr>
            <tr>
                <td><strong>List of Game:</strong></td>
                <td><%
                String game = userOrder.getGameId();
                                        String[] games = game.split(";");
                                        for (int y = 0; y < games.length; y++) {
                                            GameDAO gameDAO = new GameDAO();
                                            int filmID = Integer.parseInt(games[y]);
                                            Games game1 = gameDAO.findExactlyGames(filmID);
                                            out.println("<strong>" + game1.getName() + "</strong><br>");
                                        }
                %></td>
            </tr>
            <tr>
                <td><strong>Total:</strong></td>
                <td><%=orderDetail.getPrice()%></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center"><strong>Cashier signature</strong></td>
                <td colspan="2" align="center"><strong>Recipient signature</strong></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table><br>
                <a href="adminConfirm.jsp"><strong> <<< Back to Admin Confirm Order Page </strong></a>
    </body>
</html>
