package rathnapharma

class CustomerController {

    def add() {
        def customerRequest = request.JSON

        def customer = Customer.findByEmail(customerRequest.email.trim())
        if(customer == null)
            customer = new Customer()

        customer.name = customerRequest.name.trim()
        customer.addressOne = customerRequest.address.trim()
        customer.addressTwo = customerRequest.addressTwo
        customer.city = customerRequest.city.trim()
        customer.state = customerRequest.state
        customer.postalCode = customerRequest.zip.trim()
        customer.cellPhone = customerRequest.cell
        customer.landLine = customerRequest.landline
        customer.email = customerRequest.email.trim()
        customer.area = customerRequest.area
        customer.code = customerRequest.code
        def saveOutcome = customer.save(flush: true)
        if (!saveOutcome)
            render(status: 200, text: 'Customer could not be added')
        else
            render(status: 200, text: 'Customer Added')
    }
}
