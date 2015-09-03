'use strict'

SubmissionsAPIController = (SubmissionsAPIService) ->
  vm = this

  activate = ->
    params =
      projectId   : 'abc'
      stepId      : 'abc'

    resource = SubmissionsAPIService.query params, (data) ->
      vm.get = data

    vm

  activate()

SubmissionsAPIController.$inject = ['SubmissionsAPIService']

angular.module('example').controller 'SubmissionsAPIController', SubmissionsAPIController
