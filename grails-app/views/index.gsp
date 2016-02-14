<!DOCTYPE html>
<html lang="en">

<head>
    <title>Rathna Enterprises</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no"/>

    <base href="/">

    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic'>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.5/angular-material.min.css"/>
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
    <link rel="stylesheet" href="/RathnaPharma/Rathna-Pharma/app/assets/app.css"/>
    <link rel="stylesheet"
          href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css"/>
    <style type="text/css">
    /**
    * Hide when Angular is not yet loaded and initialized
    */

    [ng\:cloak],
    [ng-cloak],
    [data-ng-cloak],
    [x-ng-cloak],
    .ng-cloak,
    .x-ng-cloak {
        display: none !important;
        *}

    </style>

</head>

<body ng-app='starterApp'>
<md-content style="width:100%;">
    <md-toolbar style="background-color:#283593;min-height:25px;text-align:center;">
        <span>Rathna Pharmaceuticals</span>
    </md-toolbar>

    <div ng-view></div>
</md-content>


<script src="//code.angularjs.org/1.5.0-rc.2/angular.min.js"></script>
<script src="//code.angularjs.org/1.5.0-rc.2/angular-animate.min.js"></script>
<script src="//code.angularjs.org/1.5.0-rc.2/angular-aria.min.js"></script>
<script src="//code.angularjs.org/1.5.0-rc.2/angular-route.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.5/angular-material.min.js"></script>
<script type="text/javascript"
        src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
        src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript"
        src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript"
        src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript"
        src="//cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
<script type="text/javascript"
        src="//cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js"></script>

<script type="text/javascript">

    var jsSelectedValue = "${session.loggedInEmployee}";
    alert(jsSelectedValue)
    angular
            .module('starterApp', ['ngRoute', 'ngMaterial'])
            .controller('EmployeeCtrl', function ($scope, $http, $timeout) {

                $scope.employee = {
                    firstName: '',
                    lastName: '',
                    company: 'Rathna Pharmaceuticals',
                    startDate: new Date(),
                    addressOne: '',
                    addressTwo: '',
                    city: '',
                    state: 'TN',
                    postalCode: '',
                    cellphone: '',
                    landline: '',
                    email: '',
                    role: 'Delivery'
                };
                $scope.states = ('AR AS BR CG GA GJ HR HP JK JH KA KL MP MH MN ML MZ NL OR PB RJ SK TIR UK UP WB TN ' +
                'TR AN CH DH DD DL LD PY').split(' ').map(function (state) {
                    return {
                        abbrev: state
                    };
                });

                $scope.showMessage=false;

                $scope.roles = ('Manager Delivery').split(' ').map(function (role) {
                    return {
                        desc: role
                    };
                })
                $scope.saveEmployee = function () {
                    $http.post("/RathnaPharma/employee/add/", $scope.employee).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null){
                            $scope.showMessage=true;
                            $timeout(function () { $scope.showMessage = false; }, 4000);
                        }
                    })
                }


            })
            .controller('CustomerCtrl', function ($scope, $http, $timeout) {
                $scope.showMessage=false;

                $(document).ready(function () {
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'pdfHtml5',
                                message: 'Outgoing Vehicle Gate Pass'
                            }
                        ],
                        createdRow: function (row) {
                            $('td', row).attr('tabindex', 0);
                        }
                    });
                });
                $scope.customer = {
                    name: '',
                    address: '',
                    addressTwo: '',
                    city: '',
                    state: 'TN',
                    zip: '',
                    cell: '',
                    landline: '',
                    email: '',
                    area: '',
                    code: ''
                };
                $scope.states = ('AR AS BR CG GA GJ HR HP JK JH KA KL MP MH MN ML MZ NL OR PB RJ SK TN TR UK UP WB TIR AN CH DH DD DL LD PY').split(' ').map(function (state) {
                    return {
                        abbrev: state
                    };
                })

                $scope.saveCustomer = function () {
                    $http.post("/RathnaPharma/customer/add/", $scope.customer).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null){
                            $scope.showMessage=true;
                            $timeout(function () { $scope.showMessage = false; }, 4000);
                        }
                    })
                }

            })
            .controller('DeliveryCtrl', function ($scope, $timeout, $q, $log, $http) {
                $scope.showMessage=false;

                var deliveryThis = this
                deliveryThis.querySearch = function (query) {
                    return $http.get("/RathnaPharma/search/customer?searchParam=" + query)
                            .then(function (result) {
                                return result.data;
                            })
                }
                deliveryThis.querySearchEmployee = function (query) {
                    return $http.get("/RathnaPharma/search/employee?searchParam=" + query)
                            .then(function (result) {
                                console.log(result);
                                return result.data;
                            })
                }
                deliveryThis.querySearchCompany = function (query) {
                    return $http.get("/RathnaPharma/search/company?searchParam=" + query)
                            .then(function (result) {
                                console.log(result);
                                return result.data;
                            })
                }

                $scope.delivery = {
                    customerId: '',
                    companyId: '',
                    employeeId: '',
                    invoice: '',
                    value: 'TN',
                    count: '',
                    vehicle: '',
                    date: new Date()
                };

                $scope.addDelivery = function () {
                    if(deliveryThis.selectedItem == null || deliveryThis.selectedItemCompany == null || deliveryThis.selectedItemEmployee == null){
                        $scope.showMessage = true;
                        $scope.hello = "Customer or Company or Delivery empty";
                        $timeout(function () { $scope.showMessage = false; }, 3000);
                    }
                    else{
                        $scope.delivery.customerId = deliveryThis.selectedItem.id
                        $scope.delivery.companyId = deliveryThis.selectedItemCompany.id
                        $scope.delivery.employeeId = deliveryThis.selectedItemEmployee.id
                        $http.post("/RathnaPharma/delivery/add/", $scope.delivery).success(function (data, status) {
                            $scope.hello = data;
                            if (data != null){
                                $scope.showMessage=true;
                                $timeout(function () { $scope.showMessage = false; }, 4000);
                            }
                        })
                    }
                }

                $scope.roleList = [];

            })
            .controller('CompanyCtrl', function ($scope, $timeout, $q, $log, $http) {
                $scope.showMessage=false;
                $scope.company = {
                    name: ''
                };
                $scope.saveCompany = function () {
                    $http.post("/RathnaPharma/company/add/", $scope.company).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null){
                            $scope.showMessage=true;
                            $timeout(function () { $scope.showMessage = false; }, 4000);
                        }
                    })
                }
            })
            .config(function ($routeProvider, $locationProvider) {
                $routeProvider

                // route for the home page
                        .when('/', {
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/home.html'
                        })
                        .when('/add', {
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/add.html'
                        })
                        .when('/otherwise', {
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/home.html'
                        })

                // use the HTML5 History API
//                $locationProvider.html5Mode(true);
            });


</script>

</body>

</html>