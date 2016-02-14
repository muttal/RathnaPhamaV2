package rathnapharma

class Customer {

    static constraints = {
    }

    String name
    String addressOne
    String addressTwo
    String city
    String state
    String postalCode
    String cellPhone
    String landLine
    String email
    String area
    String code
    Date lastUpdated

    static mapping = {
        autoTimestamp true
    }


}
