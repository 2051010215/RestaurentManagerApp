/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ltn.pojo;

import lombok.Data;


/**
 *
 * @author 1 9 9 8 N
 */
@Data
public class Cart {
    private Long id;
    private String name;
    private int quantity;
    private Long unitPrice;
}
