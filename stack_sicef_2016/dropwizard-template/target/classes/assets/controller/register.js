(function () {
    'use strict';

    angular
        .module('app')
        .controller('RegisterController', RegisterController);

    RegisterController.$inject = ['UserService', '$location', '$rootScope', 'FlashService'];
    function RegisterController(UserService, $location, $rootScope, FlashService) {
        var vm = this;

        vm.register = register;

        function register() {
            vm.dataLoading = true;
            UserService.Create(vm.user)
                .then(function (response) {
                    if (response.status == 'ok') {
                        FlashService.Success('Registration successful', true);
                        $location.path('/login');
                    } else if (response.status == 'username_exists') {
                        FlashService.Error('Username already exists');
                        vm.dataLoading = false;
                    } else if (response.status == 'email_exists') {
                        FlashService.Error('Email already exists');
                        vm.dataLoading = false;
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
        }
    }

})();
