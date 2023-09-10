/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.service.impl;

import com.ltn.pojo.Cart;
import com.ltn.pojo.OrderDetail;
import com.ltn.repository.ReceiptRepository;
import com.ltn.service.ReceiptService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author 1 9 9 8 N
 */
@Service
public class ReceiptServiceImpl implements ReceiptService {
    @Autowired
    private ReceiptRepository receiptRepo;

    @Override
    public boolean addReceipt(Map<String, Cart> carts) {
        return this.receiptRepo.addReceipt(carts);
    }
    @Override
    public List<OrderDetail> getOrderDetails(Map<String, String> params) {
        return this.receiptRepo.getOrderDetails(params);
    }
}
