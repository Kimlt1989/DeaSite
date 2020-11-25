/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Pc52
 */
public class ChangeUserPassServlet extends HttpServlet {

   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
   
        String userId = request.getParameter("user_id");
        String currentPasswordInput = request.getParameter("currentPassword");
        String newPassowrd = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String bChange = request.getParameter("bchange");
        
        UserDAO userDAO = new UserDAO();
        User user = new User();
        String currentPassword = user.getPassword();
        if (bChange == null) {
            bChange = "";
        } else {
            boolean resule = userDAO.changePassword(currentPasswordInput, userId);
            if(resule){
                   out.write("<script type='text/javascript'>\n");
                        out.write("alert('Done');\n");
                        out.write("setTimeout(function(){window.location.href='index.jsp'},1000);");
                        out.write("</script>\n");
            }else {
                       out.write("<script type='text/javascript'>\n");
                        out.write("alert('Failed');\n");
                        out.write("setTimeout(function(){window.location.href='index.jsp'},1000);");
                        out.write("</script>\n");
            }
        }
        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet changeUserPassword</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet changeUserPassword at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     

}
