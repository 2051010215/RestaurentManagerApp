/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.restaurantmanager.repository.impl;

import java.util.Date;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.restaurantmanager.pojo.Cart;
import com.restaurantmanager.pojo.OrderDetail;
import com.restaurantmanager.pojo.SaleOrder;
import com.restaurantmanager.pojo.User;
import com.restaurantmanager.repository.ProductRepository;
import com.restaurantmanager.repository.ReceiptRepository;
import com.restaurantmanager.repository.UserReppository;

/**
*
* @author Trong Nhan
*/
@Repository
public class ReceiptRepositoryImpl implements ReceiptRepository {

    @Autowired
    private UserReppository userRepo;
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<String, Cart> carts) {

        Session s = this.factory.getObject().getCurrentSession();
        SaleOrder order = new SaleOrder();

        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User u = this.userRepo.getUserByUsername(authentication.getName());
            order.setUserId(u);
            order.setCreatedDate(new Date());
            s.save(u);

            for (Cart c : carts.values()) {
                OrderDetail d = new OrderDetail();
                d.setProductId(this.productRepo.getProductById(Integer.parseInt(c.getId().toString())));
                d.setOrderId(order);
                d.setNum(c.getQuantity());
                d.setUnitPrice(c.getUnitPrice());

                s.save(d);
            }

            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }

    }

}
