package rathnapharma

class Login {

    static constraints = {
        userName(nullable: false, unique:true)
    }
    String userName
    String password
    Employee employee
    boolean isRemoved


}
