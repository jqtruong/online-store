package com.umn

class OrderDiscount {
    Order order
    Discount discount
    Item item                   // null if discount applied on order
    Integer value               // % or $ off, or x in BxGO

    static constraints = {
        item nullable: true
    }
}
