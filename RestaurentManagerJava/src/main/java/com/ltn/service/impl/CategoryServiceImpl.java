/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.service.impl;

import com.ltn.pojo.Category;
import com.ltn.repository.CategoryRepository;
import com.ltn.service.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author 1 9 9 8 N
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
