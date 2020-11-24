


<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Movies</title>
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
                    perPage : 6
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
            .price{
                position: absolute; 
                top: 225px; 
                left: 0; 
                width: 30%; 
                color: white; 
                font: bold 20px/40px Helvetica, Sans-Serif; 
                letter-spacing: -1px;  
                background: rgb(0, 0, 0); /* fallback color */
                background: rgba(0, 0, 0, 0.7);
                padding: 0px;
            }
        </style>
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
    
         
        <!--=======content================================-->
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    <div class="grid_12">
                        <h3>List Games</h3>
                    </div>
                    <div class="clear"></div>
                    <div class="holder">
                    </div>
                    <ul id="itemContainer">

                           <%
                     
                            DAOResources dAOResources = new DAOResources();
                            String sql = "select * from games";
                            Connection connection = dAOResources.getConnection();
                            Statement stmt = connection.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            int i = 0;
                            while (rs.next()) {
                                i++;
                    %>
                    
                    <li><div class="grid_4">
                            <div class="img_inner fleft"><img src="images/GameImages/<%=rs.getString("Image")%>" alt="">
                                
                            </div>
                       
                        <div class="extra_wrapper">
                            <p class="col1"><strong><%=rs.getString("Name")%>
                                </strong><br/>
                                Price: <font style="color: red">$<%=rs.getString("Price")%></font>
                            </p>
                                    
                            <br>
                            <a href="GamesDetailServlet?gameId=<%=rs.getString("Id")%>" class="btn">Detail</a>
                        </div>
                    </div>
                    </li>
                    <%
                                            }
                       
                    %>
                    
                  
                    </ul>
                    
                    <div class="clear"></div>
                    <div class="holder">
                    </div>
                </div>
            </div>
        </div>
        <!--==============================footer=================================-->
     
        <%@ include file="footer.jsp" %>
    </body>
</html>