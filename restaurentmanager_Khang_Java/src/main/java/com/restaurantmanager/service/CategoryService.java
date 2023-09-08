/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.restaurantmanager.service;

import java.util.List;

import com.restaurantmanager.pojo.Category;

/**
*
* @author Trong Nhan
*/
public interface CategoryService {
    List<Category> getCategories();
    Category getCateById(int id);
}
