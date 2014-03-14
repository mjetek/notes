angular.module('auth')
  .factory 'auth', ($http) ->
    login: (credentials) ->
      $http.post '/login', credentials

    register: (user) ->
      $http.post '/register', user

    resetPassword: (user) ->
      $http.post '/resetPassword', user