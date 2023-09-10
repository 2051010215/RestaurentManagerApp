/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.service.impl;

import com.ltn.pojo.Comment;
import com.ltn.pojo.User;
import com.ltn.repository.CommentRepository;
import com.ltn.repository.UserReppository;
import com.ltn.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author 1 9 9 8 N
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
