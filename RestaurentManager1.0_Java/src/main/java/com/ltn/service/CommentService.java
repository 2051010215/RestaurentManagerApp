/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.ltn.service;

import com.ltn.pojo.Comment;
import java.util.List;

/**
 *
 * @author 1 9 9 8 N
 */
public interface CommentService {
    List<Comment> getComments(int productId);
    Comment addComment(Comment c);
}
