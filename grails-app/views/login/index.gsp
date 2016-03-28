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

    .inputdemoIcons {
        /*
      .right-icon {
        position: absolute;
        top: 4px;
        right: 2px;
        left: auto;
        margin-top: 0;
      }
      */
    }

    .inputdemoIcons .inputIconDemo {
        min-height: 48px;
    }

    md-card {
        background-color: transparent;
    }

    md-content{
        background-color: transparent;
    }
    md-datepicker{
        background-color: transparent;
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
    .centered {
        position: fixed;
        top: 50%;
        left: 50%;
        /* bring your own prefixes */
        transform: translate(-50%, -50%);
        z-index: 99;
    }
    </style>

</head>

<body ng-app='loginApp' layout="row">
<div id="background"></div>
<md-content style="width:100%;">
    <md-toolbar style="background-color:#4A148C;">

        <div class="md-toolbar-tools">
            <h2>
                <span>Rathna Pharmaceuticals</span>
            </h2>
            <span flex></span>
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
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>

<script type="text/javascript">
    angular
            .module('loginApp', ['ngRoute', 'ngMaterial'])
            .controller('UserCtrl', function ($scope, $http) {
                var today = new Date()
                $scope.showMessage = false;
                today.setDate(today.getDate() - 10000)
                $scope.user = {
                    email: '',
                    password: '',
                    dob: today
                };
                $scope.loginUser = function () {
                    $http.get("/RathnaPharma/login/validate/", {
                        params: {user: JSON.stringify($scope.user)}
                    }).success(function (data, status) {
                        if (data != "Logged" && status == 200) {
                            $scope.hello = data;
                            $scope.showMessage = true;
                        }
                        else {
                            window.location.href = '/RathnaPharma'
                        }

                    })
                }
                $scope.registerUser = function () {
                    $http.post("/RathnaPharma/login/create/", $scope.user).success(function (data, status) {
                        $scope.hello = data;
                        if (data != null)
                            $scope.showMessage = true;
                    })
                }
            })
            .config(function ($routeProvider, $mdDateLocaleProvider, $locationProvider) {
                $mdDateLocaleProvider.parseDate = function(dateString) {
                    var m = moment(dateString, 'DD/MM/YYYY', true);
                    return m.isValid() ? m.toDate() : new Date(NaN);
                };
                $mdDateLocaleProvider.formatDate = function (date) {
                    return moment(date).format('DD/MM/YYYY');
                };
                $routeProvider
                        .when('/', {
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/login.html'
                        })
                        .otherwise({
                            templateUrl: '/RathnaPharma/Rathna-Pharma/app/pages/login.html'
                        });

                // use the HTML5 History API
                $locationProvider.html5Mode(true);
            });


</script>

</body>

</html>