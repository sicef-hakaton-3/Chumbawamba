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
            AuthenticationService.Login(vm.email, vm.password, function (response) {
                console.log(vm.email, vm.password);
                if (response.status == 'ok') {
                    AuthenticationService.SetCredentials(vm.email, vm.password);
                    $location.path('/');
                } else if (response.status == 'email_not_found') {
                    FlashService.Error('Email ne postoji.');
                    vm.dataLoading = false;
                } else if (response.status == 'incorrect_password') {
                    FlashService.Error('Neispravna sifra.');
                    vm.dataLoading = false;
                } else {
                    FlashService.Error(response.error);
                    vm.dataLoading = false;
                }
            });
        }
    }

})();
