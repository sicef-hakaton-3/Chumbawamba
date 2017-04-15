(function () {
    'use strict';

    angular
        .module('app')
        .factory('NewsService', NewsService);

    NewsService.$inject = ['$http'];
    function NewsService($http) {
        var service = {};

        service.GetAll = GetAll;
        service.GetSelf = GetSelf;
        service.GetById = GetById;
        service.GetAllCategories = GetAllCategories;
        service.GetSourcesById = GetSourcesById;
        service.AddPlus = AddPlus;
        service.AddMinus = AddMinus;
        service.GetRelated = GetRelated;
        service.AddVisit = AddVisit;

        return service;

        function GetAll() {
            return $http.get('/api/news').then(handleSuccess, handleError('Error getting news'));
        }

        function GetSelf() { // TODO: /api/news/self
           return $http.get('/api/news').then(handleSuccess, handleError('Error getting news for user')); 
        }

        function GetById(id) {
            return $http.get('/api/news/id/' + id).then(handleSuccess, handleError('Error getting news by id'));
        }

        function GetSourcesById(id) {
            return $http.get('/api/news/links/' + id).then(handleSuccess, handleError('Error getting sources by id'));
        }

        function GetAllCategories() {
            return $http.get('/api/news/category').then(handleSuccess, handleError('Error getting categories'));
        }

        function GetRelated(id) {
            return $http.get('/api/news/similar/' + id).then(handleSuccess, handleError('Error getting related news'));
        }

        function AddPlus(id) {
            return $http.get('/api/news/vote/plus/' + id).then(handleSuccess, handleError('Error votting'));
        }

        function AddMinus(id) {
            return $http.get('/api/news/vote/minus/' + id).then(handleSuccess, handleError('Error votting'));
        }

        function AddVisit(id) {
            return $http.get('/api/news/vote/visited/' + id).then(handleSuccess, handleError('Error votting'));
        }

        // private functions

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { status: 'error', message: error };
            };
        }
    }

})();
