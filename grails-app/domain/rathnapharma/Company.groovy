package rathnapharma

class Company {

    static constraints = {
    }

    String name
    Date lastUpdated
    boolean isRemoved

    static mapping = {
        autoTimestamp true
    }
}
