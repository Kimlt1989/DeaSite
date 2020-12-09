/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Kim Ly
 */
public class OrderDetail {
    private int id;
    private int delivery;   
    private double price;
    private int user_order_id;
    private String name;

    public OrderDetail() {
    }
    
    public OrderDetail(String name,int delivery, double price, int user_order_id) {
        this.delivery = delivery;
        this.price = price;
        this.user_order_id = user_order_id;
        this.name = name;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDelivery() {
        return delivery;
    }

    public void setDelivery(int delivery) {
        this.delivery = delivery;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getUser_order_id() {
        return user_order_id;
    }

    public void setUser_order_id(int user_order_id) {
        this.user_order_id = user_order_id;
    }
    
    
}
