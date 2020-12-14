

<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
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
            td, th{ text-align: left; height:25px; word-wrap: break-word;}
            th { background: #f5f5f5; }
        </style>
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
        <div align="center">
           <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_14">
                    
        <h2 style="color: #0000FF; padding-bottom: 20px">Users List</h2>
        <strong><div class="holder"></div></strong>
        
        <form method="post" action="DeleteUserServlet">
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
                <tr>
                    <td style="text-align: center; "><b>No.</b></td>
                    <td style="text-align: center; "><b>User Name</b></td>
                    <td style="text-align: center; "><b>User Role</b></td>
                    <td style="text-align: center"><input name="delete" value="Delete" type="submit"/></td>                    
                </tr>
                <%
                    UserDAO userDAO = new UserDAO();
                    List<User> users = userDAO.findAll();
                    int i = 0;
                    for (User each : users) {
                        i++;
                %>
                <tr>
                    <td style="text-align: center; "><%=i%></td>
                    <td style="text-align: center; "><a href="adminUserDetail.jsp?id=<%=each.getId()%>"><%=each.getUserName()%></a></td>
                    <td style="text-align: center; "><a href="adminUserDetail.jsp?id=<%=each.getId()%>"><%=each.getUserType()%></a></td>
                    <td style="text-align: center"><input type="checkbox" name="idDelete" value="<%=each.getId()%>"/></td>                    
                </tr>
                <%
                    }%>
            </table>            
        </form>
            <br/><br/>

        </div>
            </div>
           </div>
        </div>
            <%@ include file="footer.jsp" %>
    </body>
</html>
