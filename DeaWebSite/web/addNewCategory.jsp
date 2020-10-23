

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Category</title>
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
        <h1>Add A New Category</h1>
        <form method="post" action="AddNewCategoriesServlet"  enctype="multipart/form-data">
            <p style="color: red">* Please Input All Fields..</p>
            <input type="text" name="name" placeholder="Category Name:" data-required="true" data-trigger="change" data-maxlength="100"/><br>
            <textarea rows="6" cols="40"  name="description" placeholder="Description:" data-required="true" data-trigger="change" data-rangelength="[20,700]"></textarea>
            <br>
            <br><strong>Upload Genre Image:</strong> <input type="file" name="upload1"/><br>
            <font style="color: red; font-size: 12px">* Make sure the dimensions of the image is: 166 x 136.</font><br>
            <input type="submit" name="bsubmit" value="Add New Categories">
            <br><%
                String mess = (String) request.getAttribute("mess");
                if (mess == null) {
                    mess = "";
                } else {
                    out.println(mess);
                }
            %><br>
        </form>
        <a href="adminManageCategories.jsp"><strong><font style="color: #0000FF"> <<< Back to Category Manage</font></strong></a>
        <br><a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a>
    </body>
</html>
