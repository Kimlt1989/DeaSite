

<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Category</title>
        <meta charset="utf-8">
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/sForm.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        
        <!--=======content================================-->

        <div class="content"><div class="ic"></div>
            <div class="white bl1 bl2">
                <div class="container_12">
                    <div class="grid_12">
                        <h3 class="head1">Categories List</h3>
                    </div>
                    <%
                        try {
                            DAOResources dAOResources = new DAOResources();
                            String sql = "select cat_id, cat_name, cat_description, cat_image from categories";
                            Connection connection = dAOResources.getConnection();
                            Statement stmt = connection.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            int i = 0;
                            while (rs.next()) {
                                i++;
                    %>
                    <div class="grid_6">
                        <img style="height: 200px; width: 200px" src="images/Genres/<%=rs.getString("CAT_Image")%>" alt="" class="img_inner fleft">
                        <a href="CateloriesResultServlet?gameId=<%=rs.getInt("CAT_ID")%>" class="btn bt1">View All</a>
                        <div class="extra_wrapper">
                            <p class="p3 col1"><strong><%=rs.getString("CAT_Name")%></strong></p>
                            <p><%=rs.getString("CAT_Description")%></p>
                        </div>
                    </div>
                        <%
                        if(i%2 == 0){
                            out.println("<div class=\"clear cl3\"></div>");
                        }
                        %>
                        
                    <%}
                        } catch (Exception e) {
                        }
                    %>
                    
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--==============================footer=================================-->
        
        <%@ include file="footer.jsp" %>
    </body>
</html>
