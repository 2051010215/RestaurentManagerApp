/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.restaurantmanager.service;

import java.util.Map;

import com.restaurantmanager.pojo.Cart;

/**
*
* @author Trong Nhan
*/
public interface ReceiptService {
    boolean addReceipt(Map<String, Cart> carts);
}
