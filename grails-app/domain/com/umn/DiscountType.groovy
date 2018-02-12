package com.umn

class DiscountType {
    final static String DISCOUNT_TYPE_SCOPE_ITEM = 'ITEM'
    final static String DISCOUNT_TYPE_SCOPE_ORDER = 'ORDER'

    String name
    String description
    String scope

    static constraints = {
        description nullable: true
        scope validator: {
            return (it in [DISCOUNT_TYPE_SCOPE_ITEM,
                           DISCOUNT_TYPE_SCOPE_ORDER])
        }
    }
}
