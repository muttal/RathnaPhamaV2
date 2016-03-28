package rathnapharma

class EmployeeController {

    def add() {
        def employeeRequest = request.JSON
        def change = "Updated"

        def employee = Employee.findById(employeeRequest.id)
        if(employee == null){
            employee = new Employee()
            change = "Added"
        }
        employee.firstName = employeeRequest.firstName.trim()
        employee.lastName = employeeRequest.lastName.trim()
        employee.fullName = employeeRequest.firstName.trim()+" "+employeeRequest.lastName.trim()
        employee.addressOne = employeeRequest.addressOne
        employee.addressTwo = employeeRequest.addressTwo
        employee.city = employeeRequest.city
        employee.state = employeeRequest.state
        employee.email = employeeRequest.email.trim()
        employee.cellphone = employeeRequest.cellphone
        employee.company = employeeRequest.company
        employee.landline = employeeRequest.landline
        employee.postalCode = employeeRequest.postalCode
        employee.startDate = (employeeRequest.startDate != "")?
                Date.parse("yyyy-MM-dd", employeeRequest.startDate.split("T")[0]): new Date()
        employee.role = Role.findByRoleName(employeeRequest.role)
        employee.changedBy = Employee.findById(session.getAttribute("loggedInEmployee").id)
        def saveOutcome = employee.save(flush: true)
        if (!saveOutcome)
            render(status: 200, text: 'Employee could not be added')
        else
            render(status: 200, text: 'Employee '+change)
    }

    def remove(){
        def employee = request.JSON
        def employeeToBeRemoved = Employee.findById(employee.id)
        employeeToBeRemoved.isRemoved = true
        def saveOutcome = employeeToBeRemoved.save(flush: true)
        if (saveOutcome)
            render(status: 200, text: 'Deleted')
    }
}
