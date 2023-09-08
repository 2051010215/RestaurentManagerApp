/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dht.repository;

import com.dht.pojo.Cart;
import com.dht.pojo.OrderDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface ReceiptRepository {
    boolean addReceipt(Map<String, Cart> carts);
    List<OrderDetail> getOrderDetails(Map<String, String> params);
}
