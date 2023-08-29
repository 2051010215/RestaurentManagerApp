/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.repository;

import com.ltn.pojo.User;


/**
 *
 * @author 1 9 9 8 N
 */
public interface UserReppository {
    User getUserByUsername(String username);
    boolean authUser(String username, String password);
    User addUser(User user);
}
