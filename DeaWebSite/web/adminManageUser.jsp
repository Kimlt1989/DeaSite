

<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
        <%@ include file="checkAdmin.jsp" %>
        <link rel="shortcut icon" href="images/icon.jpeg" />
    </head>
    <body>
        <div align="center">
        <h1>List of Users</h1>
        <form method="post" action="DeleteUserServlet">
            <table border="1" width="300px">
                <tr>
                    <td>No</td>
                    <td>Username</td>
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
                    <td><%=i%></td>
                    <td><a href="adminUserDetail.jsp?id=<%=each.getId()%>"><%=each.getUserName()%></a></td>
                    <td style="text-align: center"><input type="checkbox" name="idDelete" value="<%=each.getId()%>"/></td>                    
                </tr>
                <%
                    }%>
            </table>            
        </form>
            <br/><br/>
        <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Return to Admin Main Page</font></strong></a><br>
        <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Return to index</font></strong></a>
        </div>
    </body>
</html>
