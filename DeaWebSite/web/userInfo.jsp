<%-- 
    Document   : userDetail
    Created on : Dec 21, 2013, 11:53:40 PM
    Author     : SamSung
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <title>JSP Page</title>
    </head>
    <%

        String userId = (String) session.getAttribute("userId");
        String userName = (String) session.getAttribute("userName");
        if (userId == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <body>
        <div align="center" style="margin-top: 50px">            
            <form method="post" action="UpdateUserInfoServlet">
            <%
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findUserById(userId);
            %>
            <input value="<%=user.getId() %>" type="hidden" name="id"/>
            <table border="1">
                <tr style="background-color: #771313">
                    <td colspan="2" style="text-align: center"><h3>User Information</h3></td>
                    
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><b><%=user.getLastName()%> <%=user.getFirstName()%></b></td>
                </tr>
                <tr>
                    <td>Birthday: </td>
                    <td><%=user.getDOB()%></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td><%=user.getGender() == 1 ? "Male" : "Female"%></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input name="email" type="text" value="<%=user.getEmail()%>"/></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><input name="phone" type="text" value="<%=user.getPhone()%>"/></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><input name="address" type="text" value="<%=user.getAddress()%>"/></td>
                </tr>                
            </table>               
                <a href="changeUserPassword.jsp">Change Password</a>
            <br/><br/>
            <input type="button" value="Back" onclick="window.location.href = 'index.jsp'"/>
            <input type="submit" name="update" value="Update"/>
            <input name="reset" type="reset" value="Reset" />
            </form>
        </div> 
    </body>
</html>
