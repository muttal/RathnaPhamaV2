package rathnapharma


class Delivery {

    static constraints = {
    }

    Customer customer
    Company company
    Employee employee
    String invoiceNumber
    Integer invoiceValue
    Integer boxesDelivered
    String vehicleNumber
    Date deliveryDate
    Date lastUpdated

    static mapping = {
        autoTimestamp true
    }
}
