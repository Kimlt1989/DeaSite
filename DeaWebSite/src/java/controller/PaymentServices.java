/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
import model.OrderDetail;
/**
 *
 * @author Pc52
 */
class PaymentServices {
      private static final String CLIENT_ID = "ATiSxL9v4zGxhyWXkX6GQwS0JYvfL3qFEA4aoDg3l44u3SRKERaZJ67TmyR9ZInPoGXPanoQe0WgYa9C";
    private static final String CLIENT_SECRET = "EDM3uJYIupR42mypAuh-n5OXbii7-UQI3ATWni4CTtmCLS4_Wut_56Ex3bj1fHpHH5OhznD91JMBL9GI";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetail orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
          Payer payer = new Payer();
          payer.setPaymentMethod("paypal");
     
          PayerInfo payerInfo = new PayerInfo();
          payerInfo.setFirstName("William")
             .setLastName("Peterson")
             .setEmail("william.peterson@company.com");
     
    payer.setPayerInfo(payerInfo);
     
    return payer;
       
    }
     
    private RedirectUrls getRedirectURLs() {
          RedirectUrls redirectUrls = new RedirectUrls();
    redirectUrls.setCancelUrl("http://localhost:8080/PaypalTest/cancel.html");
    redirectUrls.setReturnUrl("http://localhost:8080/PaypalTest/review_payment");
     
    return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
    Details details = new Details();
    details.setShipping(orderDetail.getShipping());
    details.setSubtotal(orderDetail.getSubtotal());
    details.setTax(orderDetail.getTax());
 
    Amount amount = new Amount();
    amount.setCurrency("USD");
    amount.setTotal(orderDetail.getTotal());
    amount.setDetails(details);
 
    Transaction transaction = new Transaction();
    transaction.setAmount(amount);
    transaction.setDescription(orderDetail.getProductName());
     
    ItemList itemList = new ItemList();
    List<Item> items = new ArrayList<>();
     
    Item item = new Item();
    item.setCurrency("USD");
    item.setName(orderDetail.getProductName());
    item.setPrice(orderDetail.getSubtotal());
    item.setTax(orderDetail.getTax());
    item.setQuantity("1");
     
    items.add(item);
    itemList.setItems(items);
    transaction.setItemList(itemList);
 
    List<Transaction> listTransaction = new ArrayList<>();
    listTransaction.add(transaction);  
     
    return listTransaction;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
     
        for (Links link : links) {
        if (link.getRel().equalsIgnoreCase("approval_url")) {
            approvalLink = link.getHref();
            break;
        }
    }      
     
        return approvalLink;
        }
}
