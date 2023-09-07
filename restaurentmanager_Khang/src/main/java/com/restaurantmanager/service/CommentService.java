/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.restaurantmanager.service;

import java.util.List;

import com.restaurantmanager.pojo.Comment;

/**
*
* @author Trong Nhan
*/
public interface CommentService {
    List<Comment> getComments(int productId);
    Comment addComment(Comment c);
}
