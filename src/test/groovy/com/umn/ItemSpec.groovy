package com.umn

import grails.testing.gorm.DomainUnitTest
// import grails.testing.mixin.integration.Integration
// import grails.gorm.transactions.*
import spock.lang.Specification
import spock.lang.Shared

// @Integration
// @Rollback
class ItemSpec extends Specification implements DomainUnitTest<Item> {

    @Shared Item item

    def setupData() {
        item = new Item(name: 'Candy',
                        sku: '123-abc',
                        cost: '1.00').save(flush: true)
    }

    void "item creation"() {
        given: 'data'
        setupData()

        expect: 'an item named candy'
        Item.count == 1
        item == Item.read(1)
    }

    def "shared item"() {
        expect: 'item is shared'
        item.id == 1
        item.name == 'Candy'
    }
}
