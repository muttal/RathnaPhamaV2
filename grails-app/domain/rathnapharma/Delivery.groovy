package rathnapharma


class Delivery {

    static constraints = {
        chequePath nullable: true
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
    String chequePath
    boolean isRemoved

    static mapping = {
        autoTimestamp true
    }

}
