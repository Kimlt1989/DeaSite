

<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contacts</title>
        <meta charset="utf-8">
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/form.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/sForm.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="subCss/parsley.js"></script>

        <SCRIPT LANGUAGE="JavaScript">

            function contactBtn() {
                if ($('#form').parsley('validate'))
                {
                    document.contactForm.submitContact.value = "yes";
                    contactForm.submit();
                }
            }

            function clearBtn() {
                document.contactForm.submitContact.value = "";
                document.contactForm.name.value = "";
                document.contactForm.email.value = "";
                document.contactForm.mailContent.value = "";
                document.contactForm.phone.value = "";
                $('#form').parsley('destroy');
            }

        </SCRIPT>

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
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        <!--=======content================================-->

        <div class="content"><div class="ic"></div>
            <div class="white wt2">
                <div class="container_12">
                    <div class="grid_8">
                        <h3>Contact Information</h3>
                        <div class="map">
                            <figure class="img_inner fleft">
                                
                                <iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=1+Th%C3%A2n+Nh%C3%A2n+Trung,+ph%C6%B0%E1%BB%9Dng+13,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=1+than+nhan+trung+p&amp;sll=37.0625,-95.677068&amp;sspn=39.099308,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=1+Th%C3%A2n+Nh%C3%A2n+Trung,+13,+T%C3%A2n+B%C3%ACnh,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;t=m&amp;ll=10.802703,106.642313&amp;spn=0.025293,0.025749&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=1+Th%C3%A2n+Nh%C3%A2n+Trung,+ph%C6%B0%E1%BB%9Dng+13,+Ho+Chi+Minh+City,+Vietnam&amp;aq=0&amp;oq=1+than+nhan+trung+p&amp;sll=37.0625,-95.677068&amp;sspn=39.099308,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=1+Th%C3%A2n+Nh%C3%A2n+Trung,+13,+T%C3%A2n+B%C3%ACnh,+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam&amp;t=m&amp;ll=10.802703,106.642313&amp;spn=0.025293,0.025749&amp;z=14&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                                
                                 </figure>
                            <div class="text2">BEAR GAME STORE</div>
                            <address>
                                <dl>
                                    <dt>
                                    01,Than Nhan Trung<br>
                                    Phuong 13, Q.Tan Binh, Tp.HCM
                                    </dt>
                                    <dd><span>Phone Number</span>+84 113</dd>
                                    
                                    
                                    <dd>Email1: kimlt1989@gmail.com</dd>
                                    
                                </dl>
                            </address>
                        </div>
                    </div>
                    <div class="grid_4">
                        <h3>Contact Form</h3>
                        <form id="form" method="post" action="ContactPageServlet" data-validate="parsley" name="contactForm">
                            <div class="success_wrapper">
                                <div class="success">Contact form submitted!<br>
                                    <strong>We will be in touch soon.</strong> </div></div>
                            <fieldset>
                           
                                <label class="email">
                                    Your Email:<input type="text" name="from" size="30" maxlength="30" data-required="true" data-trigger="change" data-type="email">
                                </label>
                                <label class="email">
                                   Your PassWord<input type="password" name="fromPassword" size="30" maxlength="30">
                                </label>
                                <label class="email">
                                   Subject<input type="text" name="subject" size="30" maxlength="30">
                                </label>
                                <label class="message">
                                    
                                    <textarea cols="40" rows="10" name="body" data-trigger="keyup" data-rangelength="[10,1000]" ></textarea>
                                </label>
                                <div class="clear"></div>
                                <div class="btns"><a name="clear" onclick="clearBtn()" class="btn">Clear</a><span></span>
                                    <INPUT TYPE="hidden" name="submitContact"/>
                                    <a class="btn" name="contactSend" onclick="contactBtn()">Send</a>
                                    <div class="clear"></div>
                                </div>
                            </fieldset>
   <%
            String message = (String)request.getAttribute("message");
        %>
                        <p> <%=message != null ? message : " "%></p>
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--==============================footer=================================-->
        <%@ include file="footer.jsp" %>
    </body>
</html>
