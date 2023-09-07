package com.restaurantmanager.pojo;

import com.restaurantmanager.pojo.Product;
import com.restaurantmanager.pojo.SaleOrder;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-09-07T23:23:31")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Long> unitPrice;
    public static volatile SingularAttribute<OrderDetail, Product> productId;
    public static volatile SingularAttribute<OrderDetail, SaleOrder> orderId;
    public static volatile SingularAttribute<OrderDetail, Integer> num;
    public static volatile SingularAttribute<OrderDetail, Integer> id;

}