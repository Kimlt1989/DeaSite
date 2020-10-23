

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <div align="center" style="margin-top: 50px">            
            <form method="post" action="ChangeUserPasswordServlet">
                <%

                    String userId = (String) session.getAttribute("userId");
                    String userName = (String) session.getAttribute("userName");
                    if (userId == null) {
                        response.sendRedirect("index.jsp");
                    }

                    UserDAO userDAO = new UserDAO();
                    User user = userDAO.findUserById(userId);
                %>
                <input value="<%=user.getId()%>" type="hidden" name="id"/>
                <table border="1">
                    <tr style="background-color: #771313">
                        <td colspan="2" style="text-align: center"><h3>Change User Password</h3></td>
                    
                    </tr>
                    <tr>
                        <td>Current Password:</td>
                        <td><input name="currentPassword" type="password"/></td>
                    </tr>
                    <tr>
                        <td>New Password:</td>
                        <td><input name="newPassword" type="password"/></td>
                    </tr>
                    <tr>
                        <td>Confirm New Password:</td>
                        <td><input name="confirmPassword" type="password"/></td>
                    </tr>                    
                </table>
                <input name="change" value="Change" type="submit"/>
                <input type="button" value="Back" onclick="window.location.href = 'index.jsp'"/>
            </form>
                <%
                    String msg = (String) request.getAttribute("msg");
                    out.println(msg!= null? msg: "");
                %>
    </body>
</html>
