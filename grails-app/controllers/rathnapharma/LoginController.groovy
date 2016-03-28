package rathnapharma

import grails.converters.JSON

class LoginController {

    def index() {
        println request.requestURL
        render view: "index"
    }

    def create() {
        println "login create called"
        def createdUser = request.getJSON()
        println createdUser
        if (createdUser.email == null || createdUser.password == null || createdUser.dob == null) {
            render(status: 200, text: 'User could not be registered. Email, Password and Start Date are mandatory')
            return
        }
        println Date.parse("yyyy-MM-dd", createdUser.dob.split("T")[0])
        def employee = Employee.findByEmailAndStartDate(createdUser.email.trim(), Date.parse("yyyy-MM-dd", createdUser.dob.split("T")[0]))
        if (employee == null){
            render(status: 200, text: 'Employee not available in system. Contact Admin')
        }
        else {
            def existingLogin = Login.findByEmployeeAndUserNameAndPassword(employee,createdUser.email.trim(),createdUser.password.trim())
            if (existingLogin == null) {
                Login login = new Login()
                login.userName = createdUser.email.trim()
                login.password = createdUser.password.trim()
                login.employee = employee
                login.save(failOnError: true)
                render(status: 200, text: 'Registration Successful. Login to continue')
            } else {
                existingLogin.password = createdUser.password.trim()
                existingLogin.save(failOnError: true)
                render(status: 200, text: 'Password Modified. Login to continue')
            }

        }

    }

    def validate() {
        def user = JSON.parse(params.user)

        if (user.email == null || user.password == null || user.dob == null) {
            render(status: 200, text: 'User could not be logged in. Email, Password and Start Date are mandatory')
            return
        }

        def employee = Employee.findByEmailAndStartDate(user.email.trim(), Date.parse("yyyy-MM-dd", user.dob.split("T")[0]))
        if (employee == null){
            render(status: 200, text: 'Employee not available in system. Contact Admin')
        }
        else{
            if(Login.findByUserNameAndPasswordAndEmployee(user.email.trim(),user.password.trim(),employee) == null){
                render(status: 200, text: 'Invalid Login')
            }
            else{
                session.setAttribute("loggedInEmployee",employee)
                session.setAttribute("role",employee.role.roleName)
                render(status: 200, text:  'Logged')
            }
        }
    }

    def logOut(){
        println "action invoked"
        session.invalidate()
        render(status: 200, text:  'Logged Out')
    }

}
