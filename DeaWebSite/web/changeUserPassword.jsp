

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
         <form  action="ChangeUserPassServlet" method="post">
                <%

                    String userId = (String) session.getAttribute("userId");
                    String userName = (String) session.getAttribute("userName");
                    if (userId == null) {
                        response.sendRedirect("index.jsp");
                    }

                    UserDAO userDAO = new UserDAO();
                    User user = userDAO.findUserById(userId);
                %>
        <div align="center" style="margin-top: 50px">  
            
       
        
                <input value="<%=user.getId()%>" type="hidden" name="user_id"/>
                
                <table border="1">
                    <tr style="background-color: #771313">
                        <td colspan="2" style="text-align: center"><h3>Change User Password for <%=user.getLastName()%> <%=user.getFirstName()%></h3></td>
                    
                    </tr>
                    <tr>
                        <td>Current Password:</td>
                        <td><input name="currentPassword" type="password"/></td>
                    </tr>
                    <tr>
                        <td>New Password:</td>
                        <td><input name="newPassword" type="password" id="password"/></td>
                    </tr>
                    <tr>
                        <td>Confirm New Password:</td>
                        <td><input name="confirmPassword" type="password" oninput="check(this)"/></td>
                        <script language='javascript' type='text/javascript'>
                            function check(input) {
                                if (input.value != document.getElementById('password').value) {
                                    input.setCustomValidity('Password Must be Matching.');
                                } else {
                                    // input is valid -- reset the error message
                                    input.setCustomValidity('');
                                }
                            }
                        </script>
                    </tr>                    
                </table>
                
                <input name="bchange" value="Change" type="submit"/>
                <input type="button" value="Back" onclick="window.location.href = 'index.jsp'"/>
                <%
                    String msg = (String) request.getAttribute("msg");
                    out.println(msg!= null? msg: "");
                %>
        </div>
                    </form>

    </body>
</html>
