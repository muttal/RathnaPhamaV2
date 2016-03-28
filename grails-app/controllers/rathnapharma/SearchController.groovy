package rathnapharma

import grails.converters.JSON

import java.text.SimpleDateFormat


class SearchController {

    def customer() {
        def customers = Customer.findAllByNameIlikeAndIsRemoved("%" + params.searchParam + "%", false)
        render customers as JSON
    }

    def employee() {
        String fullNameQuery = "%" + params.searchParam + "%"
        Role role = Role.findByRoleName('Delivery')
        def employees = Employee.findAllByRoleAndFullNameIlikeAndIsRemoved(role, fullNameQuery, false)
        render employees as JSON
    }


    def company() {
        def companies = Company.findAllByNameIlikeAndIsRemoved("%" + params.searchParam + "%", false)
        render companies as JSON
    }

    def deliveries() {
        def employee = Employee.findByIdAndIsRemoved(session.getAttribute("loggedInEmployee").id, false)
        def finalDeliveries = []
        def deliveries = []
        if (employee.role.id == 1 || employee.role.id == 2) {
            deliveries = Delivery.findAllByDeliveryDateGreaterThanEqualsAndIsRemoved(new Date().clearTime(), false)
        } else {
            deliveries = Delivery.findAllByDeliveryDateGreaterThanEqualsAndEmployeeAndIsRemoved(new Date().clearTime(), employee, false)
        }

        deliveries.each {
            def company = Company.findById(it.companyId)
            def customer = Customer.findById(it.customerId)
            def currEmp = Employee.findById(it.employeeId)
            def currentDelivery = [it.id, customer.name, company.name, it.invoiceNumber, it.invoiceValue, it.boxesDelivered, currEmp.fullName, it.vehicleNumber, customer.area]
            finalDeliveries.add(currentDelivery)
        }


        render(contentType: "text/json") {
            ['data': finalDeliveries]
        }
    }

    def employees() {
        def employees = []
        employees = Employee.findAllByRoleNotEqualAndIsRemoved(Role.findById(1), false)

        render(contentType: "text/json") {
            ['data': employees]
        }
    }

    def customers() {
        def customers = []
        customers = Customer.findAllByIsRemoved(false)

        render(contentType: "text/json") {
            ['data': customers]
        }
    }


    def vehiclePass() {
        def shipmentsMap = [:]
        def shipments = []
        def headerRow = []
        def headerValues = ['Company', 'Cases', 'Delivery Person']
        headerValues.each {
            def headerMap = [:]
            headerMap.put('text', it)
            headerMap.put('style', 'header')
            headerRow.add(headerMap)
        }
        shipments.add(headerRow)
        def deliveries = Delivery.findAllByVehicleNumberAndDeliveryDateAndIsRemoved(params.searchVehicle, new Date(Long.parseLong(params.date)).clearTime(), false)
        deliveries.each {
            shipments.add([it.company.name, it.boxesDelivered.toString(), it.employee.fullName])
        }
        shipmentsMap.put("vehicle", params.searchVehicle)
        shipmentsMap.put("date", new Date(Long.parseLong(params.date)).dateString)
        shipmentsMap.put("shipments", shipments)

        render shipmentsMap as JSON
    }
}
