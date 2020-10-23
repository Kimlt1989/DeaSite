

<%@page import="model.Categories"%>
<%@page import="dao.CategoryDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update A Genre</title>
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
            int gameIDSearch = 0;
            String gameIdString = request.getParameter("gameId");
            if (gameIdString == null) {
                gameIdString = "0";
            } else {
                gameIDSearch = Integer.parseInt(gameIdString);
            }
            CategoryDAO gameDAO = new CategoryDAO();
            Categories thisGame = gameDAO.findExactlyCategory(gameIDSearch);
        %>
        <h1>Update A Category</h1>
        <form method="post" action="UpdateCategoriesServlet" data-validate="parsley" enctype="multipart/form-data">
            <p style="color: red">* Please full fill all fields. Note: When update, have to update image again.</p>
            <input type="text" name="name" value="<%=thisGame.getCat_name()%>" data-required="true" data-trigger="change" data-maxlength="100"/><br>
            <textarea rows="6" cols="40"  name="description" data-required="true" data-trigger="change" data-rangelength="[20,700]"><%=thisGame.getCat_description()%></textarea>
            <br>
            <br><strong>Upload Genre Image:</strong> <input type="file" name="upload1"/><br>
            <font style="color: red; font-size: 12px">* Make sure the dimensions of the image is: 166 x 136.</font><br>
            <input type="submit" name="bsubmit" value="Update This Genre">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="adminManageGenre.jsp"><strong>Cancel</strong></a>
            <br><%
                String mess = (String) request.getAttribute("mess");
                if (mess == null) {
                    mess = "";
                } else {
                    out.println(mess);
                }
            %><br>
              <input name="oldGameId" type="hidden" value="<%=thisGame.getCat_id()%>">
        </form>
        <a href="adminManageCategories.jsp"><strong><font style="color: #0000FF"> <<< Back to Genres Manage</font></strong></a>
        <br><a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a>
    </body>
</html>
