package rathnapharma

class LoginFilters {

    def filters = {
        all(controller:'login', action:'*', invert:true) {
            before = {
                if(session.getAttribute("loggedInEmployee") == null){
                    println flash
                    redirect(controller: 'login', action: 'index')
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
