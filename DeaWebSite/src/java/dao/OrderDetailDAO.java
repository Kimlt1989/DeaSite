/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.OrderDetail;
import util.DAOResources;

/**
 *
 * @author Kim Ly
 */
public class OrderDetailDAO extends DAOResources{

    public OrderDetailDAO() {
    }
    
     public void addNewOrderDetail(OrderDetail detail) {
        String sql = "insert into order_details (NAMES, DELIVERY, PRICE, user_order_id)"
                + "values (?, ?, ?, ?);";
        Connection connection = this.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail.getName());
            ps.setInt(2, detail.getDelivery());
            ps.setDouble(3, detail.getPrice());
            ps.setInt(4, detail.getUser_order_id());
            ps.execute();
            ps.close();
            this.closeConnection();
        } catch (Exception ex) {
        }
     }
}