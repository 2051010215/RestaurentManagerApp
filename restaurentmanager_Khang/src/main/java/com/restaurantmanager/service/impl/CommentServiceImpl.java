/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.restaurantmanager.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.restaurantmanager.pojo.Comment;
import com.restaurantmanager.pojo.User;
import com.restaurantmanager.repository.CommentRepository;
import com.restaurantmanager.repository.UserReppository;
import com.restaurantmanager.service.CommentService;

/**
*
* @author Trong Nhan
*/
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentRepository commentRepo;
    @Autowired
    private UserReppository userRepo;

    @Override
    public List<Comment> getComments(int productId) {
        return this.commentRepo.getComments(productId);
    }

    @Override
    public Comment addComment(Comment c) {
        c.setCreatedDate(new Date());
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = this.userRepo.getUserByUsername(authentication.getName());
        c.setUser(u);
        
        return this.commentRepo.addComment(c);
    }
    
}
