

<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DAOResources"%>


<%@page import="model.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DAOResources"%>

<%
    String flag = request.getParameter("f");
    if (flag == null) {
        flag = "0";
    }
%>
<%

    String userId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
%>
<header style="background-color:#000" >
    <div class="container_12" >
        <div class="grid_12">
            <div class="h_phone">
               <div class="blog_search">
                   <form id="form1" action="SearchServlet" method="post">
                       <input type="text" name="searchKeyword" >
                        <a onClick="document.getElementById('form1').submit()" href="#"></a>
                    </form> 
                    Need Help? Call Us +084.123
                </div> 
            </div>

            <a href="index.jsp"><img src="images/logo.png" alt="">
            <img src="images/krizalid14.gif" alt=""></a>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="menu_block" >
        <div class="container_12">
            <div class="grid_12">
                <div class="socials"><a  href="https://www.facebook.com/GAMEstore"></a></div>
                <div class="autor">
                    <%
                        if (userId == null) {
                            out.println("<a href=\"login.jsp\">User Login</a> <a href=\"register.jsp\">Register</a>");
                        } else {
                            UserDAO userDAO1 = new UserDAO();
                            boolean isAdmin = userDAO1.findAdminAccount(userId);
                            if (isAdmin == true) {
                                out.println("<a href=\"login.jsp\"> Welcome, " + userName + "</a>"
                                        + "<a href=\"LogoutServlet\">Logout</a>"
                                        + "<a href=\"adminCP.jsp\"> Admin CP </a>");
                            } else {
                                out.println("Welcome <a href=\"userInfo.jsp\">" + "<b>"+userName +"</b></a>"
                                        + "<a href=\"LogoutServlet\">Logout</a>"
                                        + "<a href=\"shoppingCart.jsp\">YourCart</a>");
                            }
                        }
                    %>
                </div>
                <nav class="">
                    <ul class="sf-menu">
                        <li class="<%=flag.equals("1") ? "current" : "with_ul"%>"><a href="index.jsp?f=1">Home</a></li>
                        <li class="<%=flag.equals("2") ? "current" : "with_ul"%>"><a href="about.jsp?f=2">About</a></li>
                        <li class="<%=flag.equals("3") ? "current" : "with_ul"%>"><a href="category.jsp?f=3">Categories</a>
                            <ul>
                                <%
                                    try {
                                        DAOResources dAOResources = new DAOResources();
                                        String sql = "select * from categories";
                                        Connection connection = dAOResources.getConnection();
                                        Statement stmt = connection.createStatement();
                                        ResultSet rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                %>
                                <li><a href="CateloriesResultServlet?gameId=<%=rs.getString("cat_id")%>"><%=rs.getString("cat_name")%></a></li>
                                    <%}
                                            rs.close();
                                            stmt.close();
                                            dAOResources.closeConnection();
                                        } catch (Exception e) {
                                        }
                                    %>
                                    
                            </ul>
                        </li>
                        <li class="<%=flag.equals("4") ? "current" : "with_ul"%>"><a href="products.jsp?f=4">Games</a></li>
                        
                        <li class="<%=flag.equals("6") ? "current" : "with_ul"%>"><a href="contact.jsp?f=6">Contacts</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
                    <hr style="height:3px;background-color:#069; width: 84%" color="#003399"/>
</header>