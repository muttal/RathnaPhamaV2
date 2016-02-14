package rathnapharma

import grails.converters.JSON

class SearchController {

    def customer() {
        def customers = Customer.findAllByNameIlike("%"+params.searchParam+"%")
        println customers as JSON
        render customers as JSON
    }

    def employee() {
        println params.searchParam
        String fullNameQuery = "%"+params.searchParam+"%"
        Role role = Role.findByRoleName('Delivery')
        def employees = Employee.findAllByRoleAndFullNameIlike(role,fullNameQuery)
        println employees as JSON
        render employees as JSON
    }


    def company() {
        println params.searchParam
        def companies = Company.findAllByNameIlike("%"+params.searchParam+"%")
        println companies as JSON
        render companies as JSON
    }

}
