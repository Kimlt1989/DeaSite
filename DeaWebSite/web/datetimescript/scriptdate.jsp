<%
	String mydate = request.getParameter("mydate");
%>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>My Date Script</title>
<Script Language=JavaScript src="datetime.js"></Script>

<link href="calendar/calendar-win2k-cold-1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<script type="text/javascript" src="calendar/calendar-setup.js"></script>

</head>


<html>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<form name="frmName" method=post action="">
<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" bordercolorlight="#000000" bordercolordark="#000000" id="table1">
	
	<tr>
		<td width="154">&nbsp;</td>
		<td width="272">&nbsp;</td>
	</tr>
	<tr>
		<td  colspan="2">
		<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolorlight="#000000" bordercolordark="#000000" id="table2">
			<tr>
			  <td>
				<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" bordercolorlight="#000000" bordercolordark="#000000" id="table3">
					<tr>
                        <td width="92" align="right"><font face="Tahoma" size="2">
						Date:&nbsp;</font></td>
                        <%
                            java.util.Date d = new java.util.Date();
                            String today = (d.getMonth() + 1) + "/" + d.getDate() + "/" + (d.getYear()+1900);
							request.setAttribute("today", today);
                        %>
                        <td><input type="text" name="mydate" id="mydate" size="11" value="<%=mydate==null?today:mydate%>">
                        <img src="calendar_icon.gif" width="21" height="22" id="getDate" >
                        <font face="Tahoma" style="font-size: 9pt">(<i>mm/dd/yyyy</i>)</font></td>
					</tr>
					<script type="text/javascript">
					    Calendar.setup({
					        inputField     :    "mydate",      // id of the input field
					        ifFormat       :    "%m/%d/%Y",       // format of the input field
					        button         :    "getDate"   // trigger for the calendar (button ID)					        
					    });
					</script>
               
					</table>
			  </td>
			</tr>
		</table>
		</td>
	</tr>
</form>
	<tr><td colspan= 2>&nbsp;</td></tr>
</table>
</body>
</html>