angular.module('account')
  .controller 'LoginCtrl', ($scope, $http) ->
    $scope.user =
      username: ''
      password: ''
    $scope.login = ->
      $http.post '/login', ->