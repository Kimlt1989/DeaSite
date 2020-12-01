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
    <table border="1" id="myTable2">
            <style>
                th{
                    cursor: pointer;
                }
            </style>
        <thead>
            <tr>
                <th style="text-align: center" onclick="sortTable(0)">ID</th>
                <th style="text-align: center" onclick="sortTable(1)">Customer</th>
                <th style="text-align: center" onclick="sortTable(2)">Phone</th>
                <th style="text-align: center" onclick="sortTable(3)">Address</th>
                <th style="text-align: center" onclick="sortTable(4)">Order Date</th>
                <th style="text-align: center" onclick="sortTable(5)">Games</th>
                <th style="text-align: center" onclick="sortTable(6)">Total</th>
                <th style="text-align: center">Confirm</th>
            </tr>
        </thead>
        <tbody id="itemContainer">
            <%
                for (UserOrder each : userOrders) {
                    if (each.getConfirm() == 0) {
            %>
            <tr>
                <td style="text-align: center"><%=String.valueOf(each.getOrderId())%></td>
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
           <script>
  
                function sortTable(n) {
                  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                  table = document.getElementById("myTable2");
                  switching = true;
                  // Set the sorting direction to ascending:
                  dir = "asc";
                  /* Make a loop that will continue until
                  no switching has been done: */
                  while (switching) {
                    // Start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /* Loop through all table rows (except the
                    first, which contains table headers): */
                    for (i = 1; i < (rows.length - 1); i++) {
                      // Start by saying there should be no switching:
                      shouldSwitch = false;
                      /* Get the two elements you want to compare,
                      one from current row and one from the next: */
                      x = rows[i].getElementsByTagName("TD")[n];
                      y = rows[i + 1].getElementsByTagName("TD")[n];
                      /* Check if the two rows should switch place,
                      based on the direction, asc or desc: */
                      if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                          // If so, mark as a switch and break the loop:
                          shouldSwitch = true;
                          break;
                          
                        }
                        
                      } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                          // If so, mark as a switch and break the loop:
                          shouldSwitch = true;
                          break;
                        }
                    
                      }
                    }
                    if (shouldSwitch) {
                      /* If a switch has been marked, make the switch
                      and mark that a switch has been done: */
                      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                      switching = true;
                      // Each time a switch is done, increase this count by 1:
                      switchcount ++;
                    } else {
                      /* If no switching has been done AND the direction is "asc",
                      set the direction to "desc" and run the while loop again. */
                      if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                      }
                    }
                  }
                }
                
                </script>
                
                              
    </table>
    <hr>
    <br>
    <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a><br>
    <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Back to index</font></strong></a>
</body>
</html>
