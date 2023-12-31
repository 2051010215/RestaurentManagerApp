/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.controllers;

import com.ltn.pojo.Product;
import com.ltn.service.ProductService;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author 1 9 9 8 N
 */
@Controller
public class ProductController {
    @Autowired
    private ProductService proService;
    
    @GetMapping("/products")
    public String list(Model model, Principal p) {
        model.addAttribute("product", new Product());
        return "products";
    }
    
    @GetMapping("/products/{id}")
    public String update(Model model, @PathVariable(value = "id") int id)  {
        model.addAttribute("product", this.proService.getProductById(id));
        return "products";
    }
    
    @PostMapping("/products")
    public String add(@ModelAttribute(value = "product") @Valid Product p, 
            BindingResult rs) {
        if (!rs.hasErrors())
            if (proService.addOrUpdateProduct(p) == true)
                return "redirect:/";
        
        return "products";
    }
}
