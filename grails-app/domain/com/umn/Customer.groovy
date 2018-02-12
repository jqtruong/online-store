package com.umn

class Customer {
    String firstName
    String middleName
    String lastName
    String email
    String password

    // other data like address, etc.

    static constraints = {
        middleName nullable: true
    }
}
