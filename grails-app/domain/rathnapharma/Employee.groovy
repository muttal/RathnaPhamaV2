package rathnapharma

class Employee {

    static constraints = {
        addressTwo nullable: true
        city nullable: true
        cellphone nullable: true
        landline nullable: true
        changeCount nullable: true
        email unique: true
    }

    String firstName
    String lastName
    String company
    Date startDate
    String addressOne
    String addressTwo
    String city
    String state
    String postalCode
    String cellphone
    String landline
    String email
    Role role
    Date lastUpdated
    Date dateCreated
    Employee changedBy
    String fullName
    Integer changeCount
    boolean isRemoved

    static mapping = {
        autoTimestamp true
    }
}
