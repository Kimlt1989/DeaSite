/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.OrderDetail;

import com.paypal.base.rest.PayPalRESTException;
import dao.UserDAO;
import model.User;
/**
 *
 * @author Pc52
 */
public class AuthorizePaymentServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
    public AuthorizePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userId = request.getParameter("userID");
        String price = request.getParameter("price");
        String shipping = request.getParameter("shipping");
        String tax = request.getParameter("tax");
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findUserById(userId);
         
        OrderDetail orderDetail = new OrderDetail();
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
 
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


}
