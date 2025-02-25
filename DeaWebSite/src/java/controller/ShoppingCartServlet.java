/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kim Ly
 */
public class ShoppingCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
        HttpSession session = request.getSession();
        try {
           List<String> gameIds = (List<String>) session.getAttribute("cart");
            if (gameIds == null) {
                gameIds = new ArrayList();
            }

            String gameId = request.getParameter("gameId");
            String userName = (String) session.getAttribute("userName");
            if(userName == null){
                out.write("<script type='text/javascript'>\n");
                                out.write("alert(' You have to login or register to ");
                                out.write("buy games. Thanks!');\n");
                                out.write("setTimeout(function(){window.location.href='register.jsp'},1000);");
                                out.write("</script>\n");
            }else{
                if (gameId != null) {
                gameIds.add(gameId);
                session.setAttribute("cart", gameIds);
                out.write("<script type='text/javascript'>\n");
                out.write("alert('Thank you! You have been add your game into your cart");
                out.write(".');\n");
                out.write("setTimeout(function(){window.location.href='products.jsp'},500);");
                out.write("</script>\n");
            } else {
                response.sendRedirect("index.jsp");
            }
            }
            
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
