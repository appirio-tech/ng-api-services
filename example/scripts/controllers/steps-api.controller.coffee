'use strict'

StepsAPIController = (StepsAPIService) ->
  vm = this

  activate = ->
    params =
      projectId: 'abc'

    resource = StepsAPIService.query params, (data) ->
      vm.get = data

    vm

  activate()

StepsAPIController.$inject = ['StepsAPIService']

angular.module('example').controller 'StepsAPIController', StepsAPIController
