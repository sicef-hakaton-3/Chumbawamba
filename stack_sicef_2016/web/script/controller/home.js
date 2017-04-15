(function () {
    'use strict';

    angular
        .module('app')
        .controller('HomeController', HomeController);

    HomeController.$inject = ['AuthenticationService', 'UserService', 'NewsService', '$routeParams', '$rootScope' , 'FlashService'];
    function HomeController(AuthenticationService, UserService, NewsService, $routeParams, $rootScope, FlashService) {
        var vm = this;

        vm.user = null;
        vm.selectedCategory = null;
        vm.logout = logout;
        vm.addPlus = addPlus;
        vm.addMinus = addMinus;
        vm.register = register;
        vm.selection = []
        vm.related_news = []
        vm.toggleSelection = toggleSelection;

        initController();

        function toggleSelection(id) {
            if ($.inArray(id, vm.selection) === -1) {
                vm.selection.push(id);
            } else {
                vm.selection.splice(vm.selection.indexOf(id), 1);
            }
        }

        function initController() {
            loadCurrentUser();
            loadCategories();
            if ($routeParams.category) {
                vm.selectedCategory = {'category_id': $routeParams.category};
            }
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

        function loadCategories() {
            NewsService.GetAllCategories()
                .then(function (categories) {
                    vm.categories = categories;
                });
        }

        function loadNews() {
            var loggedIn = $rootScope.globals.currentUser;
            if (!loggedIn) {
                NewsService.GetAll()
                    .then(function (news) {
                        vm.allNews = news;
                        news.forEach(function(news_entry) {
                           (vm.categories).forEach(function(categories_entry) {
                              if (news_entry.category_id == categories_entry.id) {
                                    news_entry.cat = categories_entry;
                              }
                           });
                        });
                    });
            } else {
                NewsService.GetSelf()
                    .then(function (news) {
                        vm.allNews = news;
                        news.forEach(function(news_entry) {
                           (vm.categories).forEach(function(categories_entry) {
                              if (news_entry.category_id == categories_entry.id) {
                                    news_entry.cat = categories_entry;
                              }
                           });
                        });
                    });
            }
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