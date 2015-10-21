'use strict'

ProjectEstimatesAPIController = (ProjectEstimatesAPIService) ->
  vm = this

  activate = ->
    params =
      id: 'abc'

    payload =
      price:
        min: 0
        max: 0
      duration:
        min: 0
        max: 0
        unit: 'week'

    resource = ProjectEstimatesAPIService.post params, payload

    resource.$promise.then (data) ->
      vm.post = data

    vm

  activate()

ProjectEstimatesAPIController.$inject = ['ProjectEstimatesAPIService']

angular.module('example').controller 'ProjectEstimatesAPIController', ProjectEstimatesAPIController
