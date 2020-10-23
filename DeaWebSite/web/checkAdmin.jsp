<%@page import="dao.UserDAO"%>

<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp");
        return;
    } else {
        UserDAO userDAO1 = new UserDAO();
        boolean isAdmin = userDAO1.findAdminAccount(userId);
        if (isAdmin == false) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>

