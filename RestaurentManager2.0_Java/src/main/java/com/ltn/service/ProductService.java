/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltn.service;

import com.ltn.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author 1 9 9 8 N
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params);
    Long countProduct();
    boolean addOrUpdateProduct(Product p);
    Product getProductById(int id);
    boolean deleteProduct(int id);
}
