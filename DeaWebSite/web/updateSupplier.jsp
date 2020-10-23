<%-- 
    Document   : updateSupplier
    Created on : Dec 23, 2013, 10:27:19 PM
    Author     : KIM
--%>



<%@page import="model.Suppliers"%>
<%@page import="dao.SupplierDAO"%>
<%@page import="model.Categories"%>
<%@page import="dao.CategoryDAO"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update A Supplier</title>
        <%@ include file="checkAdmin.jsp" %>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="subCss/parsley.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <style type="text/css">
            input.parsley-error
            {
                color: #FF0000 !important;
                background-color: #F2DEDE !important;
                border: 1px solid #EED3D7 !important;
            }
            ul.parsley-error-list
            {
                font-size: 11px;
                margin: 2px;
                list-style-type:none;
                color: #FF0000
            }

            ul.parsley-error-list li
            {
                line-height: 11px;
            }
        </style>
        <style type="text/css">
            table{ width: 100%;}
            td, th{ text-align: left; height:25px; }
            th { background: #f5f5f5; }
        </style>
    </head>
    <body>
        <%
            int supIDSearch = 0;
            String supIdString = request.getParameter("supId");
            if (supIdString == null) {
                supIdString = "0";
            } else {
                supIDSearch = Integer.parseInt(supIdString);
            }
            SupplierDAO supplierDAO = new SupplierDAO();
            Suppliers thisSup = supplierDAO.findExactlySupplier(supIDSearch);
        %>
        <h1>Update A Supplier</h1>
        <form method="post" action="UpdateSupplierServlet" data-validate="parsley" enctype="multipart/form-data">
            <p style="color: red">* Please full fill all fields. Note: When update, have to update image again.</p>
            <input type="text" name="name" value="<%=thisSup.getSup_name()%>" data-required="true" data-trigger="change" data-maxlength="100"/><br>
            <textarea rows="6" cols="40"  name="address" data-required="true" data-trigger="change" data-rangelength="[0,700]"><%=thisSup.getSup_address()%></textarea>
            <br>
<!--            <br><strong>Upload Genre Image:</strong> <input type="file" name="upload1"/><br>
            <font style="color: red; font-size: 12px">* Make sure the dimensions of the image is: 166 x 136.</font><br>-->
            <input type="submit" name="bsubmit" value="Update This Supplier">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="adminManageGenre.jsp"><strong>Cancel</strong></a>
            <br><%
                String mess = (String) request.getAttribute("mess");
                if (mess == null) {
                    mess = "";
                } else {
                    out.println(mess);
                }
            %><br>
              <input name="oldSupId" type="hidden" value="<%=thisSup.getSup_id()%>">
        </form>
        <a href="adminManageCategories.jsp"><strong><font style="color: #0000FF"> <<< Back to Supplier Manage</font></strong></a>
        <br><a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a>
    </body>
</html>

