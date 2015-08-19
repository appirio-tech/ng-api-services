'use strict'

FinalFixesAPIController = (FinalFixesAPIService) ->
  vm = this

  activate = ->
    params =
      workId : 123

    resource = FinalFixesAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

FinalFixesAPIController.$inject = ['FinalFixesAPIService']

angular.module('example').controller 'FinalFixesAPIController', FinalFixesAPIController
