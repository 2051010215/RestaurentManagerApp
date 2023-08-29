package com.ltn.pojo;

import com.ltn.pojo.Product;
import com.ltn.pojo.Tag;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-29T22:32:00")
@StaticMetamodel(ProdTag.class)
public class ProdTag_ { 

    public static volatile SingularAttribute<ProdTag, Product> productId;
    public static volatile SingularAttribute<ProdTag, Tag> tagId;
    public static volatile SingularAttribute<ProdTag, Integer> id;

}