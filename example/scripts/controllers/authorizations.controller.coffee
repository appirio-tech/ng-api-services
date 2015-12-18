'use strict'

AuthorizationsController = (AuthorizationsAPIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = AuthorizationsAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

AuthorizationsController.$inject = ['AuthorizationsAPIService']

angular.module('example').controller 'AuthorizationsController', AuthorizationsController
