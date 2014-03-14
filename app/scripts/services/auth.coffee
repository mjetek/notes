angular.module('auth')
  .factory 'auth', ($http) ->
    login: (credentials) ->
      q = $http.post '/login', credentials

    register: (user) ->
      $http.post '/register', user