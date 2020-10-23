

<head>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Registration Form</title>
    <Script Language=JavaScript src="datetime.js"></Script>

    <link href="datetimescript/calendar/calendar-win2k-cold-1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="datetimescript/calendar/calendar.js"></script>
    <script type="text/javascript" src="datetimescript/calendar/calendar-en.js"></script>
    <script type="text/javascript" src="datetimescript/calendar/calendar-setup.js"></script>
    <link rel="stylesheet" href="subCss/style.css">    
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="subCss/parsley.js"></script>
    <link rel="shortcut icon" href="images/icon.jpeg" />
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-migrate-1.1.1.js"></script>
    <script src="js/superfish.js"></script>
    <script src="js/sForm.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>    
    <link rel="stylesheet" href="css/loginStyle.css">
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

        .auto-style1 {
            border: 1px solid #FFFF00;
            background-color: #000000;
        }
        .auto-style2 {
            color: #FFFF00;
            text-align: center;
        }
        .auto-style3 {
            color: #FFFF00;
        }
        .auto-style4 {
            color: #FFFF00;
            text-align: right;
        }


    </style>
</head>

<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <form method="post" action="RegisterServlet" data-validate="parsley">
  
            <table class="auto-style1" style="width: 400px; margin: 20px 0 20px 0">
                <tr>
                    <td colspan="2"><h2 class="auto-style2" >Registration Form</h2></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Username:</td>
                    <td class="auto-style3"><input name="username" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Password:</td>
                    <td class="auto-style3"><input name="password" type="password" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Confirm Password:</td>
                    <td class="auto-style3"><input name="confirm" type="password" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">First Name:</td>
                    <td class="auto-style3"><input name="firstname" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Last Name:</td>
                    <td class="auto-style3"><input name="lastname" type="text" /></td>
                </tr>
                <%
                    String birthday = request.getParameter("birthday");
                    java.util.Date d = new java.util.Date();
                    String today = (d.getYear() + 1900)+ "/" + (d.getMonth() + 1)+ "/" + d.getDate();
                    request.setAttribute("today", today);
                %>
                <tr>
                    <td class="auto-style4" style="width: 209px">Date of Birth:</td>
                    <td class="auto-style3">
                        <input id="birthday" name="birthday" size="17" type="text" value="<%=birthday == null ? today : birthday%>"/>
                        <img src="datetimescript/calendar_icon.gif" width="21" height="22" id="getDate" />
                    </td>
                </tr>
                <script type="text/javascript">
                    Calendar.setup({
                        inputField: "birthday", // id of the input field
                        ifFormat: "%Y/%m/%d", // format of the input field
                        button: "getDate"   // trigger for the calendar (button ID)					        
                    });
                </script>
                <tr>
                    <td class="auto-style4" style="width: 209px">Gender:</td>
                    <td class="auto-style3">
                        <select name="gender">
                            <option value="1">Male</option>
                            <option value="0">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Email Address:</td>
                    <td class="auto-style3"><input name="email" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Home Address:</td>
                    <td class="auto-style3"><input name="address" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 209px">Phone Number:</td>
                    <td class="auto-style3"><input name="phone" type="text" /></td>
                </tr>
                <tr>
                    <td class="auto-style3" style="width: 209px">&nbsp;</td>
                    <td class="auto-style3">
                        <input name="register" type="submit" value="Register" />&nbsp;&nbsp;<input name="reset" type="reset" value="Reset" /></td>
                </tr>
            </table>
        </form>
    </div>   
    <%@ include file="footer.jsp" %>
</body>
</html>