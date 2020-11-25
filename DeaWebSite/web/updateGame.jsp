

<%@page import="model.Games"%>
<%@page import="model.Games"%>
<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DAOResources"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Games</title>
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
        <h1>Update Games</h1>
        <%
            int gameIDSearch = 0;
            String gameIdString = request.getParameter("gamesId");
            if (gameIdString == null) {
                gameIdString = "0";
            } else {
                gameIDSearch = Integer.parseInt(gameIdString);
            }
            GameDAO gameDAO = new GameDAO();
            Games thisGame = gameDAO.findExactlyGames(gameIDSearch);
        %>
        
        <form method="post" action="UpdateGameSerlvet" data-validate="parsley" enctype="multipart/form-data">
            <p style="color: red">* Please full fill all fields. Note: When update, have to update image again.</p>
            <center><table>
                    <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                    <tr>
                        <td><input type="text" name="name" value="<%=thisGame.getName()%>" data-required="true" /></td>
                        <td><input type="text" name="price" value="<%=thisGame.getPrice()%>" data-required="true" data-trigger="change" data-maxlength="200"/></td>
                        <td><input type="text" name="quantity" value="<%=thisGame.getQuantity()%>" data-required="true" data-trigger="change" data-maxlength="200"/></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="date" value="<%=thisGame.getIssuedate()%>" data-required="true"/></td>
                        <td><input type="text" name="status" value="<%=thisGame.getStatus()%>" data-required="true" data-trigger="change" data-maxlength="10"/></td>
<!--                        <td><input type="text" name="image" value="<%=thisGame.getImage()%>" data-required="true" data-trigger="change" data-type="digits" data-maxlength="1"/></td>-->
                    </tr>
                    <tr>
<!--                        <td><input type="text" name="cover" value="<%=thisGame.getCover()%>" data-required="true" data-trigger="change" data-maxlength="500"/></td>-->
<!--                        <td><input type="text" name="coverthump" value="<%=thisGame.getCoverthump()%>" data-required="true" data-trigger="change" data-maxlength="80"/></td>-->
                        <td><input type="text" name="trailer" value="<%=thisGame.getTrailer()%>" data-required="true" data-trigger="change" data-maxlength="200"/></td>
                    </tr>
                    
                              
                </table>
            </center><textarea rows="6" cols="40"  name="description" data-required="true" data-trigger="change" data-rangelength="[140,5000]"><%=thisGame.getDescription()%></textarea>
            <br><strong>Categories:</strong><table>
                <%
                    try {
                        DAOResources dAOResources = new DAOResources();
                        String sql = "select CAT_ID, CAT_Name from categories";
                        Connection connection = dAOResources.getConnection();
                        Statement stmt = connection.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        int i = 1;
                        while (rs.next()) {
                            if (i == 1 || i % 5 == 1) {
                                out.println("<tr>");
                            }

                %>
                <td><input name="genreCheckbox" type="radio" value="<%=rs.getString("CAT_ID")%>" data-group="group1" data-mincheck="1" data-trigger="change"><%=rs.getString("CAT_Name")%></td>
                    <%
                                if (i % 5 == 0) {
                                    out.println("</tr>");
                                }
                                i++;
                            }

                            rs.close();
                            stmt.close();
                        } catch (Exception e) {
                        }
                    %>
                <br><br></table>
                 <br><strong>Suppliers</strong><table>
                <%
                    try {
                        DAOResources dAOResources = new DAOResources();
                        String sql = "select SUP_ID, SUP_Name from suppliers";
                        Connection connection = dAOResources.getConnection();
                        Statement stmt = connection.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        int i = 1;
                        while (rs.next()) {
                            if (i == 1 || i % 5 == 1) {
                                out.println("<tr>");
                            }

                %>
                <td><input name="SupplierCheckbox" type="radio" value="<%=rs.getString("SUP_ID")%>" data-group="group1" data-mincheck="1" data-trigger="change"><%=rs.getString("SUP_Name")%></td>
                    <%
                                if (i % 5 == 0) {
                                    out.println("</tr>");
                                }
                                i++;
                            }

                            rs.close();
                            stmt.close();
                        } catch (Exception e) {
                        }
                    %>
                <br><br></table>
                
                
            <br><strong>Upload Film Cover:</strong> <input type="file" name="upload1"/><br>
            <strong>Cover Thumbnail:</strong> <input type="file" name="upload2"/><br>
            <font style="color: red; font-size: 12px">* Make sure the dimensions of the cover is: 500 x 700 and the thumbnail is: 190 x 266.</font><br><br>
            <input type="submit" name="bsubmit" value="Update This Film">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="adminManageFilm.jsp"><strong>Cancel</strong></a>
            <br><%
                String mess = (String) request.getAttribute("mess");
                if (mess == null) {
                    mess = "";
                } else {
                    out.println(mess);
                }
            %><br>
            <input name="oldGamesId" type="hidden" value="<%=thisGame.getId()%>">
        </form>
        <a href="adminManageFilm.jsp"><strong><font style="color: #0000FF"> <<< Back to Movies Manage</font></strong></a><br>
        <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Back to Admin Main Page</font></strong></a>
    </body>
</html>
