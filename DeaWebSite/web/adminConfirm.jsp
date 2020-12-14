<%@page import="java.util.ArrayList"%>
<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="model.UserOrder"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserOrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Order</title>
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
            td, th{ text-align: left; height:25px; word-wrap: break-word; border: solid 1px #222;padding-top: 5px;padding-left: 5px;}
            th { background: #f5f5f5; }
        </style>
        <%
            UserOrderDAO userOrderDAO = new UserOrderDAO();
            List<UserOrder> userOrders = userOrderDAO.getUserOrder();

        %>
    </head>
    <body>
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
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_14">
        
        <h2 style="color: #0000FF">Pending Order Confirm</h2>
        </br>
     
        <p style="color: red">* You have to know that this list is the short list of this table for you to recognize the record.</p>
        <strong><div class="holder"></div></strong>
    </form>


            
    <table style="border: 1px solid #222; border-collapse: collapse" id="myTable2">
            <style>
                th{
                    cursor: pointer;
                }
            </style>
        <thead>
            <tr>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(0)">ID</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(1)">Customer</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(2)">Phone</th>
                <th style="text-align: center; width: 150px; padding: 5px 5px 5px 5px" onclick="sortTable(3)">Address</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(4)">Order Date</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(5)">Games</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px" onclick="sortTable(6)">Total</th>
                <th style="text-align: center; padding: 5px 5px 5px 5px">Confirm</th>
            </tr>
        </thead>
        <tbody id="itemContainer">
            <%
                for (UserOrder each : userOrders) {
                    if (each.getConfirm() == 0) {
            %>
            <tr>
                <td style="text-align: center; padding: 5px 5px 5px 5px"><%=String.valueOf(each.getOrderId())%></td>
                <td><%=each.getName()%></td>
                <td style="text-align: center; padding: 5px 5px 5px 5px"><%=each.getPhone()%></td>
                <td><%=each.getAddress()%></td>
                <td style="text-align: center;width: 80px; padding: 5px 5px 5px 5px"><%=each.getOrderDate()%></td>
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
                <td style="text-align: center;width: 50px"><%=totalPrice%> $</td>
                <td style="text-align: center; display: table-cell; vertical-align: inherit; text-indent: initial;padding: 10px;vertical-align: top;">
                <input type="button" onclick="location.href='UserOrderConfirmServlet?confirm=<%=each.getOrderId() + "/" + totalPrice%>';" value="Confirm" />
                </td>
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
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
</body>
</html>
