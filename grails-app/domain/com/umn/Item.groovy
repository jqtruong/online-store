package com.umn

class Item {
    String name
    String description
    String sku
    Float  cost

    static constraints = {
        description nullable: true
    }
}
