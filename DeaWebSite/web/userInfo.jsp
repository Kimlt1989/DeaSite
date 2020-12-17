<%-- 
    Document   : userDetail
    Created on : Dec 21, 2013, 11:53:40 PM
    Author     : Kim Ly
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <title>JSP Page</title>
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
    </head>

    <body>
        <%@ include file="header.jsp" %>
            <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_14">
        <div align="center" style="margin-top: 50px">            
            <form method="post" action="UpdateUserInfoServlet">
            <%
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findUserById(userId);
            %>
            <input value="<%=user.getId()%>" type="hidden" name="user_id"/>
            <table border="1">
                <tr>
                    <td colspan="2" style="text-align: center"><h5 style="color: #222">User Information</h5></td>
                    
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
                </div>
            </div>
            </div>
                 <%@ include file="footer.jsp" %>
    </body>
</html>
