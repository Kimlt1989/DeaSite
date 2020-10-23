<html>
<head>
<title>My script date 1</title>
<Script Language=JavaScript src="datetime.js"></Script>		
<script language="javascript">
function registryDate(){
	window.location ="registrydateofficer.jsp"
}
function checkFrm(){
	txtbegindate = document.frmMain.begin_date.value;
	if(!isDate(txtbegindate)){
		document.frmMain.begin_date.select();
		document.frmMain.begin_date.focus();
		return false;
	}
	txtenddate = document.frmMain.end_date.value;
	if(!isDate(txtenddate)){
		document.frmMain.end_date.select();
		document.frmMain.end_date.focus();
		return false;
	}
	return true;
}
</script>

<meta name="generator" content="Microsoft FrontPage 6.0">
</head>
<%
	String strDate = request.getParameter("mydate");
	
	
    java.util.Date d = new java.util.Date();
    String today = (d.getMonth() + 1) + "/" + d.getDate() + "/" + (d.getYear()+1900);
	if(strDate == null)
		strDate = today;
%>


<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%" align="center" valign="top">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" id="table1">
	<tr>
		<td>&nbsp;</td>
		<td><font face="Tahoma" size="2">
		<input type="text" name="begin_date" size="12" onClick="javascript:fPopCalendar(begin_date, begin_date); return false" value="<%=strDate%>"> (mm/dd/yyyy)</font></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</body>
</center></html>
</body>
</html>