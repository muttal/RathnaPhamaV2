package rathnapharma

class DeliveryController {

    def add() {
        def change = "Updated"
        def deliveryRequest = request.JSON

        def delivery = Delivery.findById(deliveryRequest.id)
        if(delivery == null){
            delivery = new Delivery()
            change = "Added"
        }

        delivery.company = Company.findById(deliveryRequest.companyId)
        delivery.customer = Customer.findById(deliveryRequest.customerId)
        delivery.employee = Employee.findById(deliveryRequest.employeeId)
        delivery.boxesDelivered = Integer.parseInt(deliveryRequest.count)
        delivery.invoiceNumber = deliveryRequest.invoice
        delivery.invoiceValue = Integer.parseInt(deliveryRequest.value)
        delivery.vehicleNumber = deliveryRequest.vehicle
        delivery.deliveryDate = Date.parse("yyyy-MM-dd", deliveryRequest.date.split("T")[0])

        def saveOutcome = delivery.save(flush: true, failOnError: true)
        if (!saveOutcome)
            render(status: 200, text: 'Delivery could not be added')
        else
            render(status: 200, text: 'Delivery '+change)

    }

    def acknowledgement(){
        def deliveryId =  request.getParameterValues('deliveryId')

        if(deliveryId != null){
            def ackImage = params['cameraInput']
            if(!ackImage.empty)
            {
//                def webRootDir = servletContext.getRealPath("../../")
                def userDir = new File("", "/ackImage")
                userDir.mkdirs()
                def imageName = ackImage.originalFilename
                println imageName
                println imageName.split('\\.')[1]
                 ackImage.transferTo( new File( userDir, ackImage.originalFilename))

                //update cheque detail
                def delivery = Delivery.findById(deliveryId)
                delivery.chequePath = userDir.toString()+"\\"+(String)ackImage.originalFilename
                def saveOutcome = delivery.save(flush: true, failOnError: true)
                if (!saveOutcome)
                    render(status: 200, text: 'Delivery could not be updated')
                else
                    render(status: 200, text: 'Delivery updated')
            }
        }
    }


    def remove(){
        def delivery = request.JSON
        def deliveryToBeRemoved = Delivery.findById(delivery[0])
        deliveryToBeRemoved.isRemoved = true
        def saveOutcome = deliveryToBeRemoved.save(flush: true)
        if (saveOutcome)
            render(status: 200, text: 'Deleted')
    }
}
