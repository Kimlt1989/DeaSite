

<%@page import="model.Suppliers"%>
<%@page import="model.Suppliers"%>
<%@page import="model.Suppliers"%>
<%@page import="dao.SupplierDAO"%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Supplier</title>
        <%@ include file="checkAdmin.jsp" %>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.1.1.js"></script>
        <script src="js/Jpages.js"></script>
        <script type="text/javascript">
            $(function() {
                /* initiate plugin */
                $("div.holder").jPages({
                    containerID: "itemContainer",
                    perPage: 10,
                    previous: "←",
                    next: "→",
                    delay: 20
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
            table{ width: 100%;}
            td, th{ text-align: left; height:25px; }
            th { background: #f5f5f5; }
        </style>
        <%
            SupplierDAO supplierDAO = new SupplierDAO();
            String deleteId = request.getParameter("deleteId");
            if (deleteId == null) {
                deleteId = "";
            } else {
                String appPath = request.getRealPath("/images/Suppliers");
                supplierDAO.deleteASupplier(deleteId, appPath);
            }
            List<Suppliers> supplierses = supplierDAO.viewAll();
        %>
    </head>
    <body>
        <h1>Manage Supplier Page</h1>
        <a href="index.jsp"><font style="color: #green"> <<< Return to index</font></a>

        <strong><div class="holder"></div></strong>
        <table border="1">
            <thead><tr><th>No.</th><th>Name</th><th>Address</th><th>Update</th><th>Delete</th></tr></thead>
            <tbody id="itemContainer">
                <%
                    int i = 0;
                    for (Suppliers each : supplierses) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=each.getSup_name()%></td>
             
                    <td><textarea rows="1" cols="120" disabled="true"><%=each.getSup_address()%></textarea></td>
                    <td><a href="updateSupplier.jsp?supId=<%=each.getSup_id()%>">Update</a></td>
                    <td><a href="adminManageSuppliers.jsp?deleteId=<%=each.getSup_id()%>">Delete</a></td>
                </tr>
                <%                    }
                %>
            </tbody>
        </table>
        <hr>
        <a href="addNewSupplier.jsp"><strong><font style="color: red">Add New</font></strong></a><br>
        <br>
        <a href="adminCP.jsp"><strong><font style="color: #0000FF"> <<< Return to Admin Main Page</font></strong></a><br>
        
    </body>
</html>
