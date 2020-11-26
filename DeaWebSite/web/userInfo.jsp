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
            <input value="<%=user.getId()%>" type="hidden" name="user_id"/>
            <table border="1">
                <tr style="background-color: #771313">
                    <td colspan="2" style="text-align: center"><h3>User Information</h3></td>
                    
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td><input name="firstname" type="text" value="<%=user.getFirstName()%>"></input></td>
                </tr>
                  <tr>
                    <td>Last Name:</td>
                    <td><input name="lastname" type="text" value="<%=user.getLastName()%>"></input></td>
                </tr>
                <tr>
                    <td>Birthday: </td>
                    <td><input type="date" name="birthday"  value="<%=user.getDOB()%>"></input></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <select name="gender">
                            <% for(int i=0; i <=1; i++) {
                                
                                String abc = user.getGender() == i ? "Male" : "Female";
                                
                                if (i == 1){
                                    abc = "Male";
                                }
                                   if (i == 0){
                                    abc = "Female";
                                }
                                
                                if(user.getGender()== i){
                                      out.println("<option selected value='"+i+"'>"+ abc  +"</option>");
                                }else{
                                    
                                out.println("<option value='"+i+"'>"+ abc  +"</option>");
                                
                                }
                            %>

                            <%}%>
                        </select>
                    </td>
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
            <input type="submit" name="bupdate" value="Update"/>
            <input name="reset" type="reset" value="Reset" />
            </form>
        </div> 
    </body>
</html>
