/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.service;

import com.ltn.pojo.Cart;
import com.ltn.pojo.OrderDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author 1 9 9 8 N
 */
public interface ReceiptService {
    boolean addReceipt(Map<String, Cart> carts);
    List<OrderDetail> getOrderDetails(Map<String, String> params);
}
