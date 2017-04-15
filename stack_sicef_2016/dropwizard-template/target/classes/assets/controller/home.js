(function () {
    'use strict';

    angular
        .module('app')
        .controller('HomeController', HomeController);

    HomeController.$inject = ['UserService', '$rootScope' , 'FlashService'];
    function HomeController(UserService, $rootScope, FlashService) {
        var vm = this;

        vm.user = null;
        vm.allUsers = [];
        vm.deleteUser = deleteUser;

        initController();

        function initController() {
            loadCurrentUser();
            loadAllUsers();
        }

        function loadCurrentUser() {
            UserService.GetByUsername($rootScope.globals.currentUser.username)
                .then(function (user) {
                    vm.user = user;
                });
        }

        function loadAllUsers() {
            UserService.GetAll()
                .then(function (users) {
                    vm.allUsers = users;
                });
        }

        function deleteUser(id) {
            vm.dataLoading = true;
            UserService.Delete(id).then(function (response) {
                if (response.status == 'error') {
                    FlashService.Error('Unauthorized to delete users');
                    vm.dataLoading = false;
                } else {
                    vm.dataLoading = false;
                    loadAllUsers();
                }
            });
        }
    }

})();