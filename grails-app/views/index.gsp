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
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
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
    }

    table.dataTable tbody td {
        padding: 0;
    }

    md-dialog {
        max-height: 100%;
    }

    md-card {
        background-color: transparent;
    }

    md-content{
        background-color: transparent;
    }

    tbody{
        opacity: 0.7;
    }

    #background{
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url("RathnaPharma/images/logo-leaf.jpe") no-repeat center center fixed;
        opacity: 0.1;
        filter: alpha(opacity=10);
    }    
    </style>

</head>

<body ng-app='starterApp' class='"ng-cloak'>
<div id="background"></div>
<md-content style="width:100%;">
    <md-toolbar style="background-color:#4A148C;">

        <div class="md-toolbar-tools" ng-cloak>
            <md-button aria-label="Go Back" ng-hide="true">
                Go Back
            </md-button>

            <h2>
                <span>Rathna Pharmaceuticals</span>
            </h2>
            <span flex></span>

            <g:remoteLink controller="login" action="logOut" onSuccess="goToHome()">
                <md-button class="md-raised" aria-label="Learn More">
                    Log Out
                </md-button>
            </g:remoteLink>
        </div>
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
<script type="text/javascript"
        src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/1.10.11/js/dataTables.material.min.js"></script>

<script type="text/javascript">

    var jsSelectedValue = "${session.role}";

    function goToHome() {
        window.location = "/RathnaPharma";
    }

    angular
            .module('starterApp', ['ngRoute', 'ngMaterial'])
            .controller('HomeCtrl', function ($rootScope, $scope, $http, $timeout, $mdDialog, $mdMedia) {

                $scope.sessionConfig = {
                    gatePass: true,
                    acknowledgements: true,
                    employee: true,
                    customer: true,
                    delivery: true,
                    company: true,
                    employeeList: true,
                    customerList: true,
                    deliveryList: true
                }

                if (jsSelectedValue == "Admin") {
                    $scope.sessionConfig.acknowledgements = false;
                    $scope.sessionConfig.gatePass = true;
                    $scope.sessionConfig.delivery = false;
                    $scope.sessionConfig.deliveryList = true;
                    $scope.sessionConfig.employee = false;
                    $scope.sessionConfig.customer = false;
                    $scope.sessionConfig.company = false;
                    $scope.sessionConfig.employeeList = false;
                    $scope.sessionConfig.customerList = false;
                }
                else if (jsSelectedValue == "Manager") {
                    $scope.sessionConfig.acknowledgements = false;
                    $scope.sessionConfig.gatePass = false;
                    $scope.sessionConfig.delivery = false;
                    $scope.sessionConfig.deliveryList = true;
                    $scope.sessionConfig.employee = true;
                    $scope.sessionConfig.customer = true;
                    $scope.sessionConfig.company = true;
                    $scope.sessionConfig.employeeList = true;
                    $scope.sessionConfig.customerList = true;
                }
                else {
                    $scope.sessionConfig.deliveryList = false;
                    $scope.sessionConfig.acknowledgements = true;
                    $scope.sessionConfig.gatePass = true;
                    $scope.sessionConfig.delivery = true;
                    $scope.sessionConfig.employee = true;
                    $scope.sessionConfig.customer = true;
                    $scope.sessionConfig.company = true;
                    $scope.sessionConfig.employeeList = true;
                    $scope.sessionConfig.customerList = true;
                }

                $scope.gatePassRequest = {
                    vehNumber: '',
                    date: new Date()
                };

                $scope.addAcknowledgement = function () {
                    alert("bba");
                };

                $scope.openPdf = function () {
                    $http.get("/RathnaPharma/search/vehiclePass?searchVehicle=" + $scope.gatePassRequest.vehNumber + "&date=" + $scope.gatePassRequest.date.getTime())
                            .then(function (result) {
                                console.log(result);
                                var docDefinition = {

                                    // a string or { width: number, height: number }
                                    pageSize: 'A5',

                                    // by default we use portrait, you can change it to landscape if you wish
                                    pageOrientation: 'portrait',

                                    // [left, top, right, bottom] or [horizontal, vertical] or just a number for equal margins
                                    pageMargins: [40, 80, 40, 60],
                                    header: [

                                        {
                                            style: 'tableExample',
                                            columns: [
                                                {text: 'Gate Pass For Outgoing Vehicles', alignment: 'center'},{
                                                    image: 'sampleImage.jpg',
                                                    width: 150,
                                                    height: 150,
                                                },
                                            ]
                                        },
                                        {
                                            columns: [
                                                {
                                                    text: 'Vehicle Number - ' + result.data.vehicle,
                                                    alignment: 'left',
                                                    margin: [35, 10, 0, 0]
                                                },
                                                {
                                                    text: 'Date - ' + result.data.date,
                                                    alignment: 'right',
                                                    margin: [0, 10, 35, 0]
                                                }
                                            ]
                                        }
                                    ],

                                    footer: {
                                        columns: [
                                            {text: 'Rathna Pharma', alignment: 'center'}
                                        ]
                                    },
                                    content: [

                                        {
                                            style: 'tableExample',
                                            table: {
                                                widths: ['*', '*', '*'],
                                                body: result.data.shipments
                                            }
                                        },

                                        {
                                            style: 'tableExample',
                                            columns: [
                                                {text: 'The vehicle left the office at ____________', alignment: 'left'}
                                            ]
                                        },

                                        {
                                            style: 'signExample',
                                            columns: [
                                                {text: 'Signed By', alignment: 'right'}
                                            ]
                                        }
                                    ],
                                    styles: {
                                        header: {
                                            bold: true,
                                            color: '#000',
                                            fontSize: 11,
                                            margin: [0, 0, 0, 0]
                                        },
                                        demoTable: {
                                            color: '#666',
                                            fontSize: 10,
                                        },
                                        tableExample: {
                                            margin: [20, 15, 35, 15]
                                        },
                                        signExample: {
                                            margin: [40, 25, 35, 15]
                                        }
                                    }

                                };
                                pdfMake.createPdf(docDefinition).open();

                            })
                };

                $(document).ready(function () {

                    $scope.deliveriesList = [];
                    $scope.employeesList = [];
                    $scope.customersList = [];
                    $scope.companiesList = [];

                    var table = $('#example').DataTable({
                        "ajax": {
                            "url": 'RathnaPharma/search/deliveries'
                        },
                        "initComplete": function (settings, json) {
                            $scope.deliveriesList = json.data;
                            //console.log($scope.deliveriesList);
                        },
                        select: true
                    });

                    var employeeTable = $('#employeeDetails').DataTable({
                        "ajax": {
                            "url": 'RathnaPharma/search/employees'
                        },
                        "columns": [
                            {"data": "id"},
                            {"data": "fullName"},
                            {"data": "email"},
                            {"data": "startDate"},
                            {"data": "lastUpdated"},
                            {"data": "role.id"}
                        ],
                        "initComplete": function (settings, json) {
                            $scope.employeesList = json.data;
                            //console.log($scope.employeesList);
                        },
                        select: true
                    });

                    var customerTable = $('#customerDetails').DataTable({
                        "ajax": {
                            "url": 'RathnaPharma/search/customers'
                        },
                        "columns": [
                            {"data": "id"},
                            {"data": "name"},
                            {"data": "email"},
                            {"data": "area"},
                            {"data": "city"},
                            {"data": "cellPhone"},
                            {"data": "landLine"}
                        ],
                        "initComplete": function (settings, json) {
                            $scope.customersList = json.data;
                            //console.log($scope.customersList);
                        },
                        select: true
                    });


                    var companyTable = $('#companyDetails').DataTable({
                        "ajax": {
                            "url": 'RathnaPharma/search/company'
                        },
                        "columns": [
                            {"data": "id"},
                            {"data": "name"}
                        ],
                        "initComplete": function (settings, json) {
                            $scope.companiesList = json.data;
                            //console.log($scope.customersList);
                        },
                        select: true
                    });

                    $scope.$on('tableReload', function (event, data) {
                                if (data === "employee")
                                    employeeTable.ajax.reload();
                                else if (data === "customer")
                                    customerTable.ajax.reload();
                                else if (data === "delivery")
                                    table.ajax.reload();
                                else if (data === "company")
                                    companyTable.ajax.reload();
                            }
                    );


                    $scope.showAdd = function (type) {
                        $mdDialog.show({
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/' + type + '.html',
                            clickOutsideToClose: true
                        })
                    };


                    $scope.showEdit = function (type) {
                        if(type=="employee")
                            var selectedRow = employeeTable.row('.selected').data();
                        else if(type=="customer")
                            var selectedRow = customerTable.row('.selected').data();
                        else if(type=="delivery")
                            var selectedRow = table.row('.selected').data();
                        else if(type=="company")
                            var selectedRow = companyTable.row('.selected').data();

                        if (selectedRow) {
                            $mdDialog.show({
                                templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/' + type + '.html',
                                clickOutsideToClose: true
                            });
//                        console.log(selectedRow.id);
                            $timeout(function () {
                                $rootScope.$broadcast('edit'+type, selectedRow);
                            }, 1000);

                        }
                    };

                    $scope.delete = function (type,ev) {
                        if(type === "employee")
                            var selectedRow = employeeTable.row('.selected').data();
                        else if(type === "customer")
                            var selectedRow = customerTable.row('.selected').data();
                        else if (type === "delivery")
                            var selectedRow = table.row('.selected').data();
                        else if (type === "company")
                            var selectedRow = companyTable.row('.selected').data();

                        var confirm = $mdDialog.confirm()
                                .title('Sure you want to delete?')
                                .textContent('This will delete the '+type)
                                .ariaLabel('Remove')
                                .targetEvent(ev)
                                .ok('Yes')
                                .cancel('No');
                        $mdDialog.show(confirm).then(function() {

                            if (selectedRow) {
                                $http.post("/RathnaPharma/"+type+"/remove/", selectedRow).success(function (data, status) {
                                    console.log(data);
                                    $scope.hello = data;
                                    if (data != null && data == "Deleted") {
                                        if(type === "employee")
                                            employeeTable.row('.selected').remove().draw(false);
                                        else if(type === "customer")
                                            customerTable.row('.selected').remove().draw(false);
                                        else if(type === "delivery")
                                            table.row('.selected').remove().draw(false);
                                    }
                                    else {
                                        alert("Sorry. Could not be deleted. Try later.");
                                    }
                                }).error(function(data){
                                    alert("Something went wrong. Check if deliveries exists for this.");
                                })
                            }
                        }, function() {
                            $scope.status = 'You decided to keep the '+type;
                        });
                    };

                    function readURL(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                $('#acknowledgeImage').attr('src', e.target.result);
//                                $('#imgInp').hide();
                            }

                            reader.readAsDataURL(input.files[0]);
                        }
                    }

                    $(document).on('change', '#cameraInput', function () {
                        //console.log("before here");
                        readURL(this);
                    });

                });
//                $http.get("/RathnaPharma/search/deliveries")
//                        .then(function (result) {
//                            $scope.deliveriesList = result.data;
//                        })

            })
            .controller('EmployeeCtrl', function ($rootScope, $scope, $http, $timeout) {
                var today = new Date()
                today.setDate(today.getDate() - 10000)

                $scope.employeeInitial = {
                    mode: "Add",
                    id: '',
                    firstName: '',
                    lastName: '',
                    company: 'Rathna Pharmaceuticals',
                    startDate: today,
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
                $scope.employee = angular.copy($scope.employeeInitial);

                $scope.$on('editemployee', function (event, data){
                            $scope.employee.mode = "Edit";
                            $scope.employee.id = data.id;
                            $scope.employee.firstName = data.firstName;
                            $scope.employee.lastName = data.lastName;
                            $scope.employee.company = data.company;
                            $scope.employee.startDate = new Date(data.startDate);
                            $scope.employee.addressOne = data.addressOne;
                            $scope.employee.addressTwo = data.addressTwo;
                            $scope.employee.city = data.city;
                            $scope.employee.state = data.state;
                            $scope.employee.postalCode = data.postalCode;
                            $scope.employee.cellphone = data.cellphone;
                            $scope.employee.landline = data.landline;
                            $scope.employee.email = data.email;
                            if(data.role.id == 2)
                                $scope.employee.role = "Manager";
                            else
                                $scope.employee.role = "Delivery";
                        }
                );


                $scope.states = ('AR AS BR CG GA GJ HR HP JK JH KA KL MP MH MN ML MZ NL OR PB RJ SK TIR UK UP WB TN ' +
                'TR AN CH DH DD DL LD PY').split(' ').map(function (state) {
                    return {
                        abbrev: state
                    };
                });

                $scope.showMessage = false;

                $scope.roles = ('Manager Delivery').split(' ').map(function (role) {
                    return {
                        desc: role
                    };
                })
                $scope.saveEmployee = function () {
                    $http.post("/RathnaPharma/employee/add/", $scope.employee).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null) {
                            $scope.showMessage = true;
                            $scope.employee = angular.copy($scope.employeeInitial);
                            $scope.userForm.$setPristine();
                            $scope.userForm.$setUntouched();
                            $rootScope.$broadcast('tableReload', "employee");
//                            $timeout(function () {
//                                $scope.showMessage = false;z
//                            }, 4000);
                        }
                    })
                }


            })
            .controller('CustomerCtrl', function ($rootScope, $scope, $http, $timeout) {
                $scope.showMessage = false;

                $scope.customerInitial = {
                    mode: 'Add',
                    id: '',
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
                $scope.customer = angular.copy($scope.customerInitial);

                $scope.$on('editcustomer', function (event, data){
                            $scope.customer.mode = "Edit"
                            $scope.customer.id = data.id;
                            $scope.customer.name = data.name;
                            $scope.customer.address = data.addressOne;
                            $scope.customer.addressTwo = data.addressTwo;
                            $scope.customer.city = data.city;
                            $scope.customer.state = data.state;
                            $scope.customer.zip = data.postalCode;
                            $scope.customer.cell = data.cellPhone;
                            $scope.customer.landline = data.landLine;
                            $scope.customer.email = data.email;
                            $scope.customer.area = data.area;
                            $scope.customer.code = data.code;
                        }
                );

                $scope.states = ('AR AS BR CG GA GJ HR HP JK JH KA KL MP MH MN ML MZ NL OR PB RJ SK TN TR UK UP WB TIR AN CH DH DD DL LD PY').split(' ').map(function (state) {
                    return {
                        abbrev: state
                    };
                })

                $scope.saveCustomer = function () {
                    $http.post("/RathnaPharma/customer/add/", $scope.customer).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null) {
                            $scope.customer = angular.copy($scope.customerInitial);
                            $scope.showMessage = true;
                            $scope.customerForm.$setPristine();
                            $scope.customerForm.$setUntouched();
                            $rootScope.$broadcast('tableReload', "customer");
//                            $timeout(function () {
//                                $scope.showMessage = false;
//                            }, 4000);
                        }
                    }).error(function(data){
                        alert("Something went wrong. Check if deliveries exists for this.");
                    })
                }

            })
            .controller('DeliveryCtrl', function ($rootScope, $scope, $timeout, $q, $log, $http) {
                $scope.showMessage = false;

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
                                //console.log(result);
                                return result.data;
                            })
                }
                deliveryThis.querySearchCompany = function (query) {
                    return $http.get("/RathnaPharma/search/company?searchParam=" + query)
                            .then(function (result) {
                                //console.log(result);
                                return result.data;
                            })
                }

                $scope.deliveryInitial = {
                    mode: 'Add',
                    id: '',
                    customerId: '',
                    companyId: '',
                    employeeId: '',
                    invoice: '',
                    value: '',
                    count: '',
                    vehicle: '',
                    date: new Date()
                };

                $scope.delivery = angular.copy($scope.deliveryInitial);

                $scope.$on('editdelivery', function (event, data){
                            $scope.delivery.mode = "Edit";
                            $scope.delivery.id = data[0];
                            $scope.delivery.invoice = data[3];
                            $scope.delivery.value = ""+data[4];
                            $scope.delivery.count = ""+data[5];
                            $scope.delivery.vehicle = ""+data[7];
                            $scope.delivery.date = new Date();
                        }
                );

                $scope.addDelivery = function () {
                    if (deliveryThis.selectedItem == null || deliveryThis.selectedItemCompany == null || deliveryThis.selectedItemEmployee == null) {
                        $scope.showMessage = true;
                        $scope.hello = "Customer or Company or Delivery empty";
                        $timeout(function () {
                            $scope.showMessage = false;
                        }, 3000);
                    }
                    else {
                        $scope.delivery.customerId = deliveryThis.selectedItem.id
                        $scope.delivery.companyId = deliveryThis.selectedItemCompany.id
                        $scope.delivery.employeeId = deliveryThis.selectedItemEmployee.id
                        $http.post("/RathnaPharma/delivery/add/", $scope.delivery).success(function (data, status) {
                            $scope.delivery = angular.copy($scope.deliveryInitial);
                            $scope.showMessage = true;
                            $scope.deliveryForm.$setPristine();
                            $scope.deliveryForm.$setUntouched();
                            $rootScope.$broadcast('tableReload', "delivery");
//                            $timeout(function () {
//                                $scope.showMessage = false;
//                            }, 4000);
                        }).error(function(data){
                            alert("Something went wrong. Check if deliveries exists for this.");
                        })
                    }
                }

                $scope.roleList = [];

            })
            .controller('CompanyCtrl', function ($rootScope, $scope, $http, $timeout) {
                $scope.showMessage = false;
                $scope.companyInitial = {
                    id: '',
                    name: ''
                };
                $scope.company = angular.copy($scope.companyInitial);

                $scope.$on('editcompany', function (event, data){
                            $scope.company.mode = "Edit"
                            $scope.company.id = data.id;
                            $scope.company.name = data.name;
                        }
                );

                $scope.saveCompany = function () {
                    $http.post("/RathnaPharma/company/add/", $scope.company).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null) {
                            $scope.company = angular.copy($scope.companyInitial);
                            $scope.showMessage = true;
                            $scope.companyForm.$setPristine();
                            $scope.companyForm.$setUntouched();
                            $rootScope.$broadcast('tableReload', "company");
//                            $timeout(function () {
//                                $scope.showMessage = false;
//                            }, 4000);
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
                        .when('/otherwise', {
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/home.html'
                        })

                // use the HTML5 History API
//                $locationProvider.html5Mode(true);
            });


</script>

</body>

</html>