/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.restaurantmanager.repository;

import java.util.List;
import java.util.Map;

import com.restaurantmanager.pojo.Product;

/**
*
* @author Trong Nhan
*/
public interface ProductRepository {
    List<Product> getProducts(Map<String, String> params);
    Long countProduct();
    boolean addOrUpdateProduct(Product p);
    Product getProductById(int id);
    boolean deleteProduct(int id);
}
