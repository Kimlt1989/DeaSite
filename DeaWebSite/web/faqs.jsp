

<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQs</title>
        <link rel="icon" href="images/icon.jpeg">
        <link rel="shortcut icon" href="images/icon.jpeg" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/superfish.js"></script>     
    </head>
    <body>
        <!--==============================header=================================-->
        <%@ include file="header.jsp" %>
        <!--=======content================================-->
        <div class="content"><div class="ic"></div>
            <div class="white wt3">
                <div class="container_12">
                    <div class="grid_12">
                        <h3>FAQs</h3>
                        
                        <h4 style="color: red">How much is shipping and delivery?</h4>
                        <br>
                        <p style="padding-right: 280px">Pop your items in the shopping cart as you browse DVD Store and proceed to the checkout.
                            Once you've provided the delivery address, and chosen a shipping method, the costs will be calculated and shown on screen.
                            You don't need to complete the order just yet, as there are still a few more details that need to be entered before the order is finalised.</p>

                        <h4 style="color: red">When should my order arrive?</h4>
                        <br>
                        <p style="padding-right: 280px"> Usually, from the day you order, you can expect to be showing off
                            your new hand-crafted purchase in around 5 - 10 business days.<br>
                            We also offer an express shipping option during the checkout process for some orders.<br>
                            Our shipping partners advertise express delivery in 3 - 7 business days.
                            It's important to note that in some countries, you may need to allow an <br>
                            additional 4 - 5 days for your local customs.
                            The following countries have reported logistical delays that are outside of <br>
                            Redbubble's control: Canada, The UK, Australia, Italy, Germany.
                            As some items take longer to print and dry than others, the above delivery estimations are averages only.</p>

                        <h4 style="color: red">Where can DVD Store deliver to?</h4><br>
                        <p style="padding-right: 280px">
                            Our shipping partners deliver to all corners of the globe including APO, FPO, DPO addresses (Defence force, Diplomatic post etc).
                            Due to the nature of APO, FPO and DPO services it may take more than 45 days to receive your order. We recommend using a land/civilian address where possible.
                        </p>

                        <h4 style="color: red">What if my order is later than expected?</h4><br>
                        <p style="padding-right: 280px">
                            If your order hasn't reached you within 15 business days, the best first step is to contact your local post office in case they are holding the package for you. You'd be surprised how often this is the case!
                            You can check on the progress of your order until it is shipped in DVD Store.
                            Order in "Manufacturing" status?
                            The following countries have reported logistical delays that are outside of DVD Store's control: Canada, The UK, Australia, Italy, Germany.
                            If you feel that your order is taking much longer than it should, you've allowed a reasonable time for your local customs to peek at your awesome new stuff, 
                            and your local post office was not able to help, contact us and we'll see what we can do. When contacting us, please let us know your order number and the full correct 
                            delivery address so we can help you as soon as possible.
                        </p>

                        <h4 style="color: red">An order is in an unexpected country. Why?</h4><br>
                        <p style="padding-right: 280px">
                            To ensure that items are delivered as swiftly as possible, there may be short periods when a shipping partner will need to change the delivery path of an order.
                            At this time DHL has identified potential delays with customs in a number of countries, and affected orders have been routed via a hub in Germany.
                        </p>

                        <h4 style="color: red">Can I send a gift to someone else?</h4><br>
                        <p style="padding-right: 280px">
                            Absolutely! The 'billing' address must be your own, however you can choose a different 'delivery' address.
                            We don't include any invoices or payment information in the packages, but elements of the packaging may reveal the goodies inside.
                            Please note, because we email your payment confirmation and receipt it's also a good idea to use your own email address, to keep your secret.
                            Yes, of course you can return and exchange gifts! You can find all the information in DVD Store.
                        </p>


                        
                    </div>
                    <div class="clear"></div>
                    <br><br><a href="index.jsp"><strong><font style="color: #0000FF"><<< Back to Index</font></strong></a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--==============================footer=================================-->
        <%@ include file="footer.jsp" %>
    </body>
</html>
