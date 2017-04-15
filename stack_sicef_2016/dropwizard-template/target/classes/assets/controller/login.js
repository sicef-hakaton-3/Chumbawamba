(function () {
    'use strict';

    angular
        .module('app')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$location', 'AuthenticationService', 'FlashService'];
    function LoginController($location, AuthenticationService, FlashService) {
        var vm = this;

        vm.login = login;

        (function initController() {
            // reset login status
            AuthenticationService.ClearCredentials();
        })();

        function login() {
            vm.dataLoading = true;
            AuthenticationService.Login(vm.username, vm.password, function (response) {
                if (response.status == 'ok') {
                    AuthenticationService.SetCredentials(vm.username, vm.password);
                    $location.path('/');
                } else if (response.status == 'username_not_found') {
                    FlashService.Error('Username not found');
                    vm.dataLoading = false;
                } else if (response.status == 'incorrect_password') {
                    FlashService.Error('Incorrect password');
                    vm.dataLoading = false;
                } else {
                    FlashService.Error(response.error);
                    vm.dataLoading = false;
                }
            });
        }
    }

})();
