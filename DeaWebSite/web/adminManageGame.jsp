

<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserDAO"%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Games</title>
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
            td, th{ text-align: left; height:25px; word-wrap: break-word;padding-top: 10px}
            th { background: #f5f5f5; }
        </style>
        <%
            GameDAO gameDAO = new GameDAO();
            String deleteId = request.getParameter("deleteId");
            if (deleteId == null) {
                deleteId = "";
            } else {
                String appPath = request.getRealPath("/images/GameImages");
                gameDAO.deleteAFilm(deleteId, appPath);
            }
            List<Games> games = gameDAO.getAllGames();
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
                    
        <h2 style="color: #0000FF">Manage Games Page</h2>
<!--        <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Return to index</font></strong></a>-->
       
        
        <strong><div class="holder"></div></strong>
        
            <style>
                th {
                    border: solid 1px #222;
                }
                td {
                    border: solid 1px #222;
                }
                table.mytable tbody td {
                    border: solid thin;
                }
            </style>

            <table style="border: 1px solid #222; border-collapse: collapse" id="mytable" >
            <thead><tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th style="text-align: center">ISSUE DATE</th>
                    <th>Status</th>
                    <th>Price</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody id="itemContainer">
                <%
                    int i = 0;
                    for (Games each : games) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=each.getName()%></td>
                    <td><%=each.getDescription()%></td>
                    <td style="width: 100px; text-align: center; padding: 10px"><%=each.getIssuedate()%></td>
                    <td style="text-align: center"><%=each.getStatus()%></td>
                    <td><%=each.getPrice()%></td>
                    <td style="text-align: center; display: table-cell; vertical-align: inherit; text-indent: initial;padding: 10px;vertical-align: top;">
                        <input type="button" onclick="location.href='updateGame.jsp?gamesId=<%=each.getId()%>';" value="Update" />
                    </td>
                    <td style="text-align: center; display: table-cell; vertical-align: inherit; text-indent: initial;padding: 10px;vertical-align: top;">
                        <input type="button" onclick="location.href='adminManageGame.jsp?deleteId=<%=each.getId()%>';" value="Delete" /> 
                    </td>
                </tr>
                <%                    }
                %>
            </tbody>
        </table>
        <hr>
        
          <td style="text-align: center; display: table-cell; vertical-align: inherit; text-indent: initial;padding: 10px;vertical-align: top;">
              <input style="color: red" type="button" onclick="location.href='addNewGame.jsp';" value="Add New" /> 
          </td>
        <br>
<!--        <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Return to Admin Main Page</font></strong></a><br>-->
                  </div>
            </div>
        </div>
            <%@ include file="footer.jsp" %>
    </body>
</html>
