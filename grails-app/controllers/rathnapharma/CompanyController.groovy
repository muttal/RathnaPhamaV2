package rathnapharma

class CompanyController {

    def add() {

        def companyRequest = request.JSON
        def change = "Updated"

        def company = Company.findById(companyRequest.id)
        if(company == null){
            company = new Company()
            change = "Added"
        }

        company.name = companyRequest.name.trim()
        def saveOutcome = company.save(flush: true)
        if (!saveOutcome)
            render(status: 200, text: 'Company could not be added')
        else
            render(status: 200, text: 'Company '+change)
    }

    def remove(){
        def company = request.JSON
        def companyToBeRemoved = Company.findById(company.id)
        companyToBeRemoved.isRemoved = true
        def saveOutcome = companyToBeRemoved.save(flush: true)
        if (saveOutcome)
            render(status: 200, text: 'Deleted')
    }
}
