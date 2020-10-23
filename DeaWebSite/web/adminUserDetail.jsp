

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail</title>
        <%@ include file="checkAdmin.jsp" %>
        <link rel="shortcut icon" href="images/icon.jpeg" />
    </head>
    <body>
        <div align="center">
        <h1>User Information</h1>
        <%
                    UserDAO userDAO = new UserDAO();
                    User user = userDAO.findUserById(request.getParameter("id"));
                    if(user != null){
                %>
        <table border="1">
            <tr>
                <td>Username: </td>
                <td><b><%=user.getUserName()%></b></td>               
            </tr>
            <tr>
                <td>First Name: </td>
                <td><b><%=user.getFirstName()%></b></td>               
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><b><%=user.getLastName()%></b></td>               
            </tr>
            <tr>
                <td>Gender: </td>
                <td><b><%=user.getGender() == 0 ? "Female": "Male" %></b></td>               
            </tr>
            <tr>
                <td>Date of Birth: </td>
                <td><b><%=user.getDOB()%></b></td>               
            </tr>
            <tr>
                <td>Phone: </td>
                <td><b><%=user.getPhone()%></b></td>               
            </tr>
            <tr>
                <td>Email: </td>
                <td><b><%=user.getEmail()%></b></td>               
            </tr>
            <tr>
                <td>Address: </td>
                <td><b><%=user.getAddress()%></b></td>               
            </tr>            
        </table>
            <br/>
            <a href="adminManageUser.jsp">Manage Users Page</a>
            <%}
                    else response.sendRedirect("adminManageUser.jsp");
            %>
        </div>
    </body>
</html>
