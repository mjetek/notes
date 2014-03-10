angular.module('account')
  .controller 'LoginCtrl', ($scope, $http) ->
    $scope.loginModel =
      username: ''
      password: ''
    $scope.login: ->
      $http.post '/login', ->
        

