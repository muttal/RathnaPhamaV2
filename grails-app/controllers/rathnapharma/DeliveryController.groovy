package rathnapharma

class DeliveryController {

    def add() {
        println "lala"
        def deliveryRequest = request.JSON

//        if()

        Delivery delivery = new Delivery()
        delivery.company = Company.findById(deliveryRequest.companyId)
        delivery.customer = Customer.findById(deliveryRequest.customerId)
        delivery.employee = Employee.findById(deliveryRequest.employeeId)
        delivery.boxesDelivered = Integer.parseInt(deliveryRequest.count)
        delivery.invoiceNumber = deliveryRequest.invoice
        delivery.invoiceValue = Integer.parseInt(deliveryRequest.value)
        delivery.vehicleNumber = deliveryRequest.vehicle
        delivery.deliveryDate = Date.parse("yyyy-MM-dd", deliveryRequest.date.split("T")[0])

        def saveOutcome = delivery.save(flush: true, failOnError: true)
        if (!saveOutcome)
            render(status: 200, text: 'Delivery could not be added')
        else
            render(status: 200, text: 'Delivery Added')

        render(status: 200, text:  'Delivery Added')
    }
}
