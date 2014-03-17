angular.module('auth')
  .factory 'auth', ($http) ->
    console.log 'initialize auth service'
    login: (credentials) ->
      $http.post '/login', credentials

    register: (user) ->
      $http.post '/auth/register', user

    resetPassword: (user) ->
      $http.post '/auth/reset-password', user