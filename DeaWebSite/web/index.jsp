

<%@page import="model.Games"%>
<%@page import="dao.GameDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/slider.css">
        <link href="style1.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/sForm.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/tms-0.4.1.js"></script>
        <script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
        <script	src="js/jquery.touchSwipe.min.js"></script>
        <script>
            $(window).load(function() {
                $('.slider')._TMS({
                    show: 0,
                    pauseOnHover: false,
                    prevBu: '.prev',
                    nextBu: '.next',
                    playBu: false,
                    duration: 800,
                    preset: 'fade',
                    pagination: false, //'.pagination',true,'<ul></ul>'
                    pagNums: false,
                    slideshow: 8000,
                    numStatus: false,
                    banners: true,
                    waitBannerAnimation: false,
                    progressBar: false
                })
            });
            $(window).load(
                    function() {
                        $('.carousel1').carouFredSel({auto: false, prev: '.prev1', next: '.next1', width: 1030, items: {
                                visible: {min: 1,
                                    max: 4
                                },
                                height: 'auto',
                                width: 157
                            }, responsive: true,
                            scroll: 1,
                            mousewheel: false,
                            swipe: {onMouse: true, onTouch: true}});
                    });
        </script>
        <style type="text/css">
            .price{
                position: absolute; 
                top: 328px; 
                left: 0; 
                width: 20%; 
                color: white; 
                font: bold 20px/40px Helvetica, Sans-Serif; 
                letter-spacing: -1px;  
                background: rgb(0, 0, 0); /* fallback color */
                background: rgba(0, 0, 0, 0.7);
                padding: 0px;
            }
        </style>
    </head>
    <body class="page1">
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        <div class="slider-relative" style="margin-bottom: 10px">
            <div class="slider-block">
                <div class="slider">
                    <a href="#" class="prev"></a>
                    <a href="#" class="next"></a>
                    <ul class="items">
                        
                        <li>
                            <img src="images/102.jpg" alt="">
                           
                        </li>
                        <li>
                            <img src="images/103.jpg" alt="">
                            
                        </li>
                        <li>
                            <img src="images/104.jpg" alt="">
                            
                        </li>
                        <li>
                            <img src="images/105.jpg" alt="">
                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>
       
        <!--=======content===========================================================================================================================-->
                <form>

            <div class="content"><div class="ic" style="background-color: #FFF"></div>
            <div class="black">
            
                <div class="container_12">
                    <h3 style="color: red">New Games</h3>
                    <ul id="itemContainer">
                    <%
                        GameDAO gameDAO = new GameDAO();
                        int numberOfFilms = 8;
                        List<Games> games = gameDAO.getNewestGames();
                        if (games != null) {
                            for (Games each : games) {
                               
                    %>
                      <li>
                          <div class="grid_4">
                            <div class="img_inner fleft"><img src="images/GameImages/<%=each.getImage()%>" alt="">
                                
                            </div>
                       
                        <div class="extra_wrapper">
                            <p class=""><h4><%=each.getName()%></h4><br/>
                                <span>Price: <font style="color: blue">$<%=each.getPrice()%></font></span>
                            </p>
                                    
                            <br>
                            <a href="GamesDetailServlet?gameId=<%=each.getId()%>" class="btn">Detail</a>
                        </div>
                    </div>
                    </li>
                    <%
                            }
                        }
                    %>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>       
                </form>
        <!--==============================footer=================================-->
     
        <%@ include file="footer.jsp" %>
    </body>
</html>
