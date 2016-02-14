package rathnapharma

class CompanyController {

    def add() {
        def companyRequest = request.JSON

        Company company = new Company()
        company.name = companyRequest.name.trim()
        def saveOutcome = company.save(flush: true, failOnError: true)
        if (!saveOutcome)
            render(status: 200, text: 'Company could not be added')
        else
            render(status: 200, text: 'Company Added')
    }
}
