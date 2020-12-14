

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title>Admin Page</title>
         <%@ include file="checkAdmin.jsp" %>
         
         
    </head>
    <body>
        <h1>Admin Main Page</h1>
        <a href="adminManageGame.jsp">1. Manage Game Table</a><br><br>
        <a href="adminManageCategories.jsp">2. Manage Categories Table</a><br><br>
        <a href="adminManageSuppliers.jsp">3. Manage Supplier Table</a><br><br>
        <a href="adminManageUser.jsp">4. Manage User Table</a><br><br>
        <a href="adminConfirm.jsp">5. Confirm Order</a><br><br>
<!--        <a href="adminSentNew.jsp">6. Send News to Subscribe people</a><br><br>-->
        <a href="index.jsp"><strong><font style="color: #0000FF"> <<< Back to index</font></strong></a>
    </body>
</html>
