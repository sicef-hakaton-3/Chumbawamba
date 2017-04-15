(function () {
    'use strict';

    angular
        .module('app')
        .controller('SingleController', SingleController);

    SingleController.$inject = ['UserService', 'AuthenticationService', 'NewsService', '$routeParams', '$rootScope' , 'FlashService'];
    function SingleController(UserService, AuthenticationService, NewsService, $routeParams, $rootScope, FlashService) {
        var vm = this;

        vm.user = null;
        vm.single_id = null;
        vm.register = register;
        vm.selection = []
        vm.related_news = []
        vm.toggleSelection = toggleSelection;
        vm.logout = logout;
        vm.addPlus = addPlus;
        vm.addMinus = addMinus;
        vm.categories = []

        initController();

        function initController() {
            loadCurrentUser();
            loadCategory();
            loadCategories();
            loadNews();
        }

        function loadCurrentUser() {
            var loggedIn = $rootScope.globals.currentUser;
            if (loggedIn) {
                UserService.GetByEmail($rootScope.globals.currentUser.email)
                    .then(function (user) {
                        vm.user = user;
                    });
            }
        }

        function loadCategory() {
            vm.single_id = $routeParams.single_id;
            NewsService.AddVisit(vm.single_id);
        }

        function loadCategories() {
            NewsService.GetAllCategories()
                .then(function (categories) {
                    vm.categories = categories;
                });
        }

        function loadNews() {
            NewsService.GetById(vm.single_id)
                .then(function (news) {
                    vm.news = news;
                    (vm.categories).forEach(function(categories_entry) {
                        if (news.category_id == categories_entry.id) {
                              news.cat = categories_entry;
                        }
                     });
                });
            NewsService.GetSourcesById(vm.single_id)
                .then(function (sources) {
                    vm.sources = sources;
                });
            NewsService.GetRelated(vm.single_id)
                .then(function (related) {
                    vm.related_news = related;
                });
        }

        function register() {
            vm.dataLoading = true;
            var req = {'email': vm.email, 'password': vm.password, 'categories': vm.selection}
            UserService.Create(req)
                .then(function (response) {
                    if (response.status == 'ok') {
                        FlashService.Success('Registration successful', true);
                        $location.path('/login');
                    } else if (response.status == 'email_exists') {
                        FlashService.Error('Email vec postoji.');
                        vm.dataLoading = false;
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
        }

        function toggleSelection(id) {
            if ($.inArray(id, vm.selection) === -1) {
                vm.selection.push(id);
            } else {
                vm.selection.splice(vm.selection.indexOf(id), 1);
            }
        }

        function addPlus(id) {
            NewsService.AddPlus(id);
        }

        function addMinus(id) {
            NewsService.AddMinus(id);
        }

        function logout() {
            AuthenticationService.ClearCredentials();
        }
    }

})();