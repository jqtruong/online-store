package com.umn

class Discount {
    DiscountType type
    String name
    String description
    Integer percent             // % off
    Integer amount              // $ off
    Integer itemCount           // BxGO

    static constraints = {
        description nullable: true
        percent nullable: true
        amount nullable: true
        itemCount nullable: true
    }
}
