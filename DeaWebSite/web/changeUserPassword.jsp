

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
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
         <form  action="ChangeUserPassServlet" method="post">
                <%

                 
                    if (userId == null) {
                        response.sendRedirect("index.jsp");
                    }

                    UserDAO userDAO = new UserDAO();
                    User user = userDAO.findUserById(userId);
                %>
        <div align="center" style="margin-top: 50px">  
            
       
        
                <input value="<%=user.getId()%>" type="hidden" name="user_id"/>
                
                <table border="1">
                    <tr>
                        <td colspan="2" style="text-align: center"><h5 style="color: #222">Change User Password for <%=user.getLastName()%> <%=user.getFirstName()%></h5></td>
                    
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
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
