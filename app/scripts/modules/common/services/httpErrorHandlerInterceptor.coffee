angular.module('common')
  .factory 'httpErrorHandlerInterceptor', ($location) ->
    'request': (config) ->
      config
    'response': (response) ->
      response
    'requestError': (rejection) ->
      rejection
    'responseError': (rejection) ->
      return $location.path 'error/access-forbiden' if rejection.status is 403
      rejection