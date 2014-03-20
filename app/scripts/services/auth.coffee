angular.module('auth')
  .factory 'auth', ($http) ->
    console.log 'initialize auth service'
    login: (credentials) ->
      $http.post '/login', credentials

    register: (user) ->
      $http.post '/auth/register', user

    changePassword: (data) ->
      $http.post '/auth/change-password', data

    resetPassword: (user) ->
      $http.post '/auth/reset-password', user

    usernameAvailable: (username) ->
      $http.get "/auth/username-available/#{username}"