/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.restaurantmanager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restaurantmanager.pojo.Category;
import com.restaurantmanager.repository.CategoryRepository;
import com.restaurantmanager.service.CategoryService;

/**
*
* @author Trong Nhan
*/
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository cateRepo;
    
    @Override
    public List<Category> getCategories() {
        return this.cateRepo.getCategories();
    }

    @Override
    public Category getCateById(int id) {
        return this.cateRepo.getCateById(id);
    }
    
}
