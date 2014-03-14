angular.module('auth')
  .controller 'LoginCtrl', ($scope, $http) ->
    $scope.user =
      username: ''
      password: ''
    $scope.login = ->
      $http.post '/login', ->